import 'package:jctelecaller/provider/user_provider.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final bool showDrawer;
  const MyDrawer({super.key, required this.showDrawer});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: true);
    final userName = userProvider.userId?.name;
    final userEmail = userProvider.userId?.email;

    return Container(
      color: Theme.of(context).cardColor,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFC2518F),
                    Color(0xFF8E2DE2)
                  ], // Gradient Color
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              accountName: Text(
                userName ?? "Guest User",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                userEmail ?? "guest@example.com",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),

            // Home Button
            ListTile(
              leading: Icon(Icons.home, color: IKColors.primary),
              title: Text("Home", style: TextStyle(fontSize: 16)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/home');
              },
            ),

            Divider(
                thickness: 1, indent: 15, endIndent: 15), // Adds a visual break

            // Dashboard Button
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.deepPurpleAccent),
              title: Text("Dashboard", style: TextStyle(fontSize: 16)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/dashboard',
                    arguments: showDrawer);
              },
            ),
            Divider(thickness: 1, indent: 15, endIndent: 15),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.deepPurple,
              ),
              title: Text("Search User", style: TextStyle(fontSize: 16)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/search_user');
              },
            ),
            Divider(thickness: 1, indent: 15, endIndent: 15),

            Spacer(), // Pushes logout button to the bottom

            // Logout Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                icon: Icon(Icons.logout),
                label: Text("Logout", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
