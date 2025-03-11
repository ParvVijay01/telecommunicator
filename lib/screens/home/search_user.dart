import 'package:flutter/material.dart';
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
    final userProvider = Provider.of<UserProvider>(context);

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
              onChanged: (value) {
                if (value.length == 10) {
                  userProvider
                      .searchUserByPhone(value); // 🔹 This should update the UI
                } else {
                  userProvider.clearSearchResults();
                }
              },
            ),
            const SizedBox(height: 20),
            if (phoneController.text.length < 10)
              const Center(child: Text("Enter User's phone number")),
            if (phoneController.text.length == 10)
              Expanded(
                child: userProvider.searchResults.isNotEmpty
                    ? ListView.builder(
                        itemCount: userProvider.searchResults.length,
                        itemBuilder: (context, index) {
                          final user = userProvider.searchResults[index];
                          return ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.phone),
                            onTap: () {
                              // 🔹 Store selected user
                              userProvider.setSelectedUser(user);

                              // 🔹 Redirect to home screen
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()),
                              );
                            },
                          );
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "USER NOT FOUND",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddUser()),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: const Text("+ ADD USER"),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
                            ),
                          ),
                        ],
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
