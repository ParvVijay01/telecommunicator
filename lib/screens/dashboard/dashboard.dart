import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jctelecaller/components/drawer/drawer_menu.dart';
import 'package:jctelecaller/utils/constants/colors.dart';
import 'package:slide_to_act/slide_to_act.dart';

class DashboardScreen extends StatefulWidget {
  final bool showDrawer; // Flag to determine whether to show the drawer

  const DashboardScreen({super.key, required this.showDrawer});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); // Key for opening the drawer

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    double totalIncome = box.read("totalIncome") ?? 0.0;
    double commission = box.read("commission") ?? 0.0;
    double remainingBalance = box.read("remainingBalance") ?? 0.0;
    int totalOrders = box.read("orders") ?? 0;

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true, // Extends the body behind AppBar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: widget.showDrawer // Show the drawer button only if coming from HomeScreen
            ? IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer(); // Open the drawer
                },
              )
            : null, // No drawer button if coming from Sign-in screen
      ),
      drawer: widget.showDrawer // Show drawer only if coming from HomeScreen
          ? MyDrawer(showDrawer: true,)
          : null, // No drawer if coming from Sign-in screen
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [IKColors.primary, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Floating Background Icons
          Positioned(top: 50, left: 30, child: _floatingIcon(Icons.star, 50)),
          Positioned(top: 100, right: 40, child: _floatingIcon(Icons.circle, 35)),
          Positioned(bottom: 120, left: 20, child: _floatingIcon(Icons.favorite, 40)),
          Positioned(bottom: 180, right: 60, child: _floatingIcon(Icons.circle_outlined, 30)),
          Positioned(top: 250, left: 120, child: _floatingIcon(Icons.auto_awesome, 45)),
          // Main Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: IKColors.primary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.stars, color: Colors.white, size: 32),
                    const SizedBox(height: 8),
                    Text(
                      "₹${totalIncome.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Lifetime cashback",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    _buildAmountRow("Redeemed", commission, Icons.check_circle),
                    _buildAmountRow("Redeemable", remainingBalance, Icons.account_balance_wallet),
                    _buildOrdersRow("Total orders", totalOrders, Icons.receipt_long),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        child: SlideAction(
                          onSubmit: () {
                            _redeemFunction();
                          },
                          height: 50,
                          elevation: 0,
                          sliderButtonIcon: const Icon(Icons.arrow_forward, color: Colors.white),
                          text: "Swipe to redeem",
                          textStyle: const TextStyle(fontSize: 16, color: Colors.black),
                          innerColor: IKColors.primary,
                          outerColor: Colors.white,
                          borderRadius: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/search_user');
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Search User",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Floating Background Icon
  Widget _floatingIcon(IconData icon, double size) {
    return Icon(
      icon,
      color: Colors.white.withOpacity(0.2),
      size: size,
    );
  }

  Widget _buildAmountRow(String title, double amount, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white70, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Text(
            "₹${amount.toStringAsFixed(2)}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersRow(String title, int amount, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white70, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Text(
            amount.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _redeemFunction() {
    print("Redeem process initiated");
  }
}

