import 'package:flutter/material.dart';
import 'package:lookme/data/data_provider.dart';
import 'package:lookme/provider/cart_provider.dart';
import 'package:lookme/screens/auth/add_user.dart';
import 'package:lookme/provider/user_provider.dart';
import 'package:lookme/screens/home/home.dart';
import 'package:provider/provider.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search User"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: "Enter Phone Number",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) async {
                if (value.length == 10) {
                  await userProvider.searchUserByPhone(value);
                  setState(() {}); // 🔹 Refresh UI
                } else {
                  userProvider.clearSearchResults();
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 20),

            // Display prompt if phone number is incomplete
            if (phoneController.text.length < 10)
              const Center(child: Text("Enter User's phone number")),

            if (phoneController.text.length == 10)
              Expanded(
                child: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    return userProvider.searchResults.isNotEmpty
                        ? ListView.builder(
                            itemCount: userProvider.searchResults.length,
                            itemBuilder: (context, index) {
                              final user = userProvider.searchResults[index];
                              return ListTile(
                                title: Text(user.name.isNotEmpty
                                    ? user.name
                                    : "No Name"),
                                subtitle: Text(user.phone.isNotEmpty
                                    ? user.phone
                                    : "No Phone"),
                                onTap: () {
                                  userProvider.setSelectedUser(user); // Select the user
  Provider.of<CartProvider>(context, listen: false).clearCart();
                                  userProvider.setSelectedUser(user);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangeNotifierProvider(
                                        create: (context) => DataProvider()
                                          ..fetchAllCategories()
                                          ..fetchProducts(),
                                        child: Home(),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "USER NOT FOUND",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton.icon(
                                  onPressed: () async {
                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddUserForm(
                                          phoneNumber: phoneController.text,
                                        ),
                                      ),
                                    );

                                    if (result == true) {
                                      // 🔹 Re-fetch user after adding
                                      await userProvider.searchUserByPhone(
                                          phoneController.text);
                                      setState(() {}); // 🔹 Refresh UI
                                    }
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text(" ADD USER"),
                                ),
                              ],
                            ),
                          );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
