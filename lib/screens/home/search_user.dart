import 'package:flutter/material.dart';
import 'package:jctelecaller/data/data_provider.dart';
import 'package:jctelecaller/provider/cart_provider.dart';
import 'package:jctelecaller/screens/auth/add_user.dart';
import 'package:jctelecaller/provider/user_provider.dart';
import 'package:jctelecaller/screens/home/home.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:provider/provider.dart';

class SearchUserScreen extends StatefulWidget {
  const SearchUserScreen({super.key});

  @override
  _SearchUserScreenState createState() => _SearchUserScreenState();
}

class _SearchUserScreenState extends State<SearchUserScreen> {
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  void _searchUser(String value, UserProvider userProvider) async {
    if (value.length == 10) {
      setState(() => isLoading = true);
      await userProvider.searchUserByPhone(value);
      setState(() => isLoading = false);
    } else {
      userProvider.clearSearchResults();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search User"),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              cursorColor: IKColors.primary,
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Enter Phone Number",
                hintText: "Enter 10-digit phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: IKColors.primary),
                  borderRadius: BorderRadius.circular(12),
                ),
                floatingLabelStyle: TextStyle(color: IKColors.primary),
                prefixIcon: const Icon(Icons.phone),
              ),
              onChanged: (value) => _searchUser(value, userProvider),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const Center(
                  child: CircularProgressIndicator(
                color: IKColors.primary,
              )),
            if (!isLoading && phoneController.text.length < 10)
              _buildEmptyState("Enter User's phone number", Icons.search),
            if (!isLoading && phoneController.text.length == 10)
              Expanded(
                child: Consumer<UserProvider>(
                  builder: (context, userProvider, child) {
                    return userProvider.searchResults.isNotEmpty
                        ? ListView.builder(
                            itemCount: userProvider.searchResults.length,
                            itemBuilder: (context, index) {
                              final user = userProvider.searchResults[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: IKColors.primary,
                                    child: Text(
                                      user.name.isNotEmpty
                                          ? user.name[0].toUpperCase()
                                          : "?",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    user.name.isNotEmpty
                                        ? user.name
                                        : "No Name",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  subtitle: Text(
                                    user.phone.isNotEmpty
                                        ? user.phone
                                        : "No Phone",
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.blueGrey,
                                  ),
                                  onTap: () {
                                    userProvider.setSelectedUser(user);
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .clearCart();
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
                                ),
                              );
                            },
                          )
                        : _buildEmptyState("USER NOT FOUND", Icons.person_off);
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String message, IconData icon) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: IKColors.primary.withOpacity(0.7)),
            const SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 15),
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
                  await Provider.of<UserProvider>(context, listen: false)
                      .searchUserByPhone(phoneController.text);
                  setState(() {});
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: IKColors.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.add),
              label: const Text(
                "ADD USER",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
