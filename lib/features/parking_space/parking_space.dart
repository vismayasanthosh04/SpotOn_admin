import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:spoton_admin/common_widget/custom_button.dart';
import 'package:spoton_admin/common_widget/custom_search.dart';

class ParkingSpace extends StatefulWidget {
  const ParkingSpace({super.key});

  @override
  State<ParkingSpace> createState() => _ParkingSpaceState();
}

class _ParkingSpaceState extends State<ParkingSpace> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    const Text(
                      'Parcking Space',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 350,
                      child: CustomSearch(
                        onSearch: (p0) {},
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomButton(
                      inverse: true,
                      onPressed: () {},
                      label: 'Add Spot',
                      iconData: Icons.add,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: DataTable2(
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      minWidth: 300,
                      columns: const [
                        DataColumn(label: Text('Location')),
                        DataColumn(label: Text('Spot count')),
                        DataColumn(label: Text('Available now')),
                        DataColumn(label: Text('Details'), numeric: true),
                      ],
                      rows: [
                        DataRow(cells: [
                          const DataCell(Text('Dharmashala')),
                          const DataCell(Text('50')),
                          const DataCell(Text('20')),
                          DataCell(
                            TextButton(
                              onPressed: () {},
                              child: const Text('View Details'),
                            ),
                          ),
                        ])
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
