import 'package:costcalculator/cost.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final int cost;
  QuestionWidget(this.question, this.options, this.cost);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            DropDownList(
              options: options,
              cost: cost,
            ),
            Text('Cost: \$' +
                cost.toString() +
                '. Cost Depends on the choice chosen'),
          ],
        ),
      ),
    );
  }
}

class DropDownList extends StatefulWidget {
  final List<String> options;
  final int cost;
  const DropDownList({Key? key, required this.options, required this.cost})
      : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState(options, cost);
}

class _DropDownListState extends State<DropDownList> {
  final List<String> items;
  final int cost;
  static int estimatedCost = 0;
  String dropdownValue = '';
  _DropDownListState(this.items, this.cost) {
    dropdownValue = items[0];
    if (dropdownValue == 'Yes' || items.length == 3) {
      estimatedCost += cost;
      Cost.cost = estimatedCost;
      print(estimatedCost);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      items: items
          .map((String item) =>
              DropdownMenuItem<String>(child: Text(item), value: item))
          .toList(),
      onChanged: (value) {
        setState(() {
          print("previous ${this.dropdownValue}");
          print("selected $value");
          if ((value == 'Yes' || value == '10+') && dropdownValue != value) {
            estimatedCost += cost;
          }
          if ((value == 'No' || value == '1-10') && dropdownValue != value) {
            estimatedCost -= cost;
          }
          this.dropdownValue = value.toString();
          Cost.cost = estimatedCost;
          print('Static var ' + Cost.cost.toString());
          print(estimatedCost);
        });
      },
      value: dropdownValue,
    );
  }
}
