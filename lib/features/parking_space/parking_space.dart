import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:spoton_admin/common_widget/custom_alert_dialog.dart';
import 'package:spoton_admin/common_widget/custom_button.dart';
import 'package:spoton_admin/common_widget/custom_search.dart';
import 'package:spoton_admin/common_widget/custom_text_formfield.dart';
import 'package:spoton_admin/util/value_validator.dart';

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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddSpot(),
                        );
                      },
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

class AddSpot extends StatelessWidget {
  AddSpot({
    super.key,
  });
  final TextEditingController _locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      title: 'Add Spot',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            labelText: 'Enter location',
            controller: _locationController,
            validator: notEmptyValidator,
          ),
          const SizedBox(
            height: 20,
          ),
//spot number
          const Text(
            'Spot No',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
            labelText: 'Enter spot no',
            controller: _locationController,
            validator: notEmptyValidator,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onPressed: () {},
            label: 'Add spot',
            inverse: true,
          )
        ],
      ),
    );
  }
}
