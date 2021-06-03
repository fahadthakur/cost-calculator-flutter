import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  QuestionWidget(this.question, this.options);

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
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownList extends StatefulWidget {
  final List<String> options;
  const DropDownList({Key? key, required this.options}) : super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState(options);
}

class _DropDownListState extends State<DropDownList> {
  final List<String> items;
  String dropdownValue = '';
  _DropDownListState(this.items) {
    dropdownValue = items[0];
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
          this.dropdownValue = value.toString();
        });
      },
      value: dropdownValue,
    );
  }
}
