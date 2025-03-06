import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:spoton_admin/common_widget/custom_search.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  final List<Map<String, String>> _bookings = [
    {
      'userName': 'Sugu',
      'location': 'Thaliparamba',
      'spotNo': '5',
      'timePeriod': '5 PM - 6 PM',
    },
    {
      'userName': 'John',
      'location': 'Kannur',
      'spotNo': '10',
      'timePeriod': '6 PM - 7 PM',
    },
    {
      'userName': 'Jane',
      'location': 'Kozhikode',
      'spotNo': '15',
      'timePeriod': '7 PM - 8 PM',
    },
  ];

  List<Map<String, String>> _filteredBookings = [];

  @override
  void initState() {
    super.initState();
    _filteredBookings = List.from(_bookings);
  }

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Bookings',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: CustomSearch(
                        onSearch: (p0) {},
                      ),
                    ),
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
                      DataColumn2(label: Text('User Name'), size: ColumnSize.L),
                      DataColumn(label: Text('Location')),
                      DataColumn(label: Text('Spot No.')),
                      DataColumn(label: Text('Time Period')),
                      DataColumn(label: Text('Details'), numeric: true),
                    ],
                    rows: _filteredBookings.map((booking) {
                      return DataRow(cells: [
                        DataCell(Text(booking['userName']!)),
                        DataCell(Text(booking['location']!)),
                        DataCell(Text(booking['spotNo']!)),
                        DataCell(Text(booking['timePeriod']!)),
                        DataCell(
                          TextButton(
                            onPressed: () {},
                            child: const Text('View Details'),
                          ),
                        ),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
