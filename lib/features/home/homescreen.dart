import 'package:flutter/material.dart';
import 'package:spoton_admin/features/dashboard/dashboard.dart';
import 'package:spoton_admin/features/login/loginpage.dart';

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
      backgroundColor: Colors.black,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: 250,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: 60.0,
                ),
                Text(
                  'SpotOn',
                  style: TextStyle(fontSize: 25, color: Color(0xFF7F00FF)),
                ),
                SizedBox(height: 80.0),
                DrawerItemButton(
                  inverse: _tabController.index == 0,
                  iconData: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () {
                    _tabController.animateTo(0);
                    setState(() {});
                  },
                ),
                DrawerItemButton(
                  inverse: _tabController.index == 1,
                  iconData: Icons.car_repair,
                  label: 'Booking',
                  onTap: () {
                    _tabController.animateTo(1);
                    setState(() {});
                  },
                ),
                DrawerItemButton(
                  inverse: _tabController.index == 2,
                  iconData: Icons.local_parking_sharp,
                  label: 'Parking Spaces',
                  onTap: () {
                    _tabController.animateTo(2);
                    setState(() {});
                  },
                ),
                DrawerItemButton(
                  inverse: _tabController.index == 3,
                  iconData: Icons.report,
                  label: 'Reports',
                  onTap: () {
                    _tabController.animateTo(3);
                    setState(() {});
                  },
                ),
                DrawerItemButton(
                  inverse: _tabController.index == 4,
                  iconData: Icons.report_problem_outlined,
                  label: 'Problems',
                  onTap: () {
                    _tabController.animateTo(4);
                    setState(() {});
                  },
                ),
                DrawerItemButton(
                  inverse: _tabController.index == 5,
                  iconData: Icons.pending_actions_sharp,
                  label: 'Roles & Permissions',
                  onTap: () {
                    _tabController.animateTo(5);
                    setState(() {});
                  },
                ),
                Spacer(),
                DrawerItemButton(
                  inverse: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  iconData: Icons.logout,
                  label: "Log out",
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                Dashboard(),
                Container(
                  color: Colors.yellow,
                ),
                Container(
                  color: Colors.green,
                ),
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
    return Material(
      color: inverse ? Color(0xFFE7EEE7) : Colors.black,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: [
              Icon(
                iconData,
                color: inverse ? Color(0xFF7F00FF) : Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: TextStyle(
                    color: inverse ? Color(0xFF7F00FF) : Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
