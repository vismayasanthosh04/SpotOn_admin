import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Text(
            'Dasboard',
            style: TextStyle(fontSize: 35, color: Color(0xFF7F00FF)),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30),
            child: Row(
              children: [
                DashboardCard(
                    label: '150',
                    label1: 'Total Bookings',
                    iconData: Icons.library_books),
                SizedBox(
                  width: 20,
                ),
                DashboardCard(
                    label: '53',
                    label1: 'Total Parking Slot',
                    iconData: Icons.local_parking_sharp),
                SizedBox(
                  width: 20,
                ),
                DashboardCard(
                    label: '50',
                    label1: 'Total Vehicle',
                    iconData: Icons.car_repair),
                SizedBox(
                  width: 20,
                ),
                DashboardCard(
                    label: '50',
                    label1: 'Vehicle Owner',
                    iconData: Icons.supervisor_account_outlined)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String label;
  final String label1;
  final IconData iconData;
  const DashboardCard({
    super.key,
    required this.label,
    required this.label1,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF00A36C)),
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      decoration: const BoxDecoration(
          color: Color(0xFF7F00FF),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      height: 150,
      width: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    Text(
                      label1,
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  iconData,
                  size: 50,
                  color: Colors.white,
                )
              ],
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'More Info ->',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
