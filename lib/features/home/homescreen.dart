import 'package:flutter/material.dart';
import 'package:spoton_admin/common_widget/custom_alert_dialog.dart';
import 'package:spoton_admin/features/Bookings/bookings.dart';
import 'package:spoton_admin/features/dashboard/dashboard.dart';
import 'package:spoton_admin/features/login/loginpage.dart';
import 'package:spoton_admin/features/parking_space/parking_space.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 250,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 60.0,
                ),
                const Text(
                  'SpotOn',
                  style: TextStyle(fontSize: 25, color: Color(0xFF7F00FF)),
                ),
                const SizedBox(height: 80.0),
                DrawerItemButton(
                  inverse: _tabController.index == 0,
                  iconData: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () {
                    _tabController.animateTo(0);
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20.0),
                DrawerItemButton(
                  inverse: _tabController.index == 1,
                  iconData: Icons.car_repair,
                  label: 'Bookings',
                  onTap: () {
                    _tabController.animateTo(1);
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20.0),
                DrawerItemButton(
                  inverse: _tabController.index == 2,
                  iconData: Icons.local_parking_sharp,
                  label: 'Parking Spaces',
                  onTap: () {
                    _tabController.animateTo(2);
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20.0),
                DrawerItemButton(
                  inverse: false,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => CustomAlertDialog(
                        title: "LOG OUT",
                        content: const Text(
                          "Are you sure you want to log out? Clicking 'Logout' will end your current session and require you to sign in again to access your account.",
                        ),
                        width: 400,
                        primaryButton: "LOG OUT",
                        onPrimaryPressed: () {
                          Supabase.instance.client.auth.signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false);
                        },
                      ),
                    );
                  },
                  iconData: Icons.logout,
                  label: "Log out",
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                const Dashboard(),
                const Bookings(),
                const ParkingSpace(),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.cyanAccent,
                ),
                Container(
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItemButton extends StatelessWidget {
  final Function() onTap;
  final bool inverse;
  final IconData iconData;
  final String label;
  const DrawerItemButton({
    super.key,
    required this.onTap,
    this.inverse = true,
    required this.iconData,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          borderRadius: BorderRadius.circular(20),
          color: inverse ? const Color(0xFFFFFFFF) : Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: inverse ? const Color(0xFF7F00FF) : Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  label,
                  style: TextStyle(
                      color: inverse ? const Color(0xFF7F00FF) : Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
