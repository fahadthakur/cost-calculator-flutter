import 'package:costcalculator/cost_review.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<String> options;
  final int cost;
  QuestionWidget(this.question, this.options, this.cost) {
    CostReview.optionsChosen.putIfAbsent(question, () => options[0]);
  }

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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: DropDownList(
                options: options,
                cost: cost,
                question: question,
              ),
            ),
            Text(
              'Cost: \$' +
                  cost.toString() +
                  '. Cost Depends on the choice chosen',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class DropDownList extends StatefulWidget {
  final String question;
  final List<String> options;
  final int cost;
  const DropDownList(
      {Key? key,
      required this.options,
      required this.cost,
      required this.question})
      : super(key: key);

  @override
  _DropDownListState createState() =>
      _DropDownListState(options, cost, question);
}

class _DropDownListState extends State<DropDownList>
    with AutomaticKeepAliveClientMixin {
  final List<String> items;
  final int cost;
  static int estimatedCost = CostReview.estimatedCost;
  String dropdownValue = '';
  final String question;

  _DropDownListState(this.items, this.cost, this.question) {
    dropdownValue = items[0];
    if (dropdownValue == 'Yes' || items.length == 3) {
      estimatedCost = CostReview.estimatedCost;
      estimatedCost += cost;
      CostReview.estimatedCost = estimatedCost;
      print(CostReview.estimatedCost);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: Icon(Icons.arrow_drop_down_circle_rounded),
      iconEnabledColor: Colors.indigo,
      isExpanded: true,
      items: items
          .map((String item) =>
              DropdownMenuItem<String>(child: Text(item), value: item))
          .toList(),
      onChanged: (value) {
        setState(() {
          if ((value == 'Yes' || value == '10+') && dropdownValue != value) {
            estimatedCost += cost;
          }
          if ((value == 'No' || value == '1-10') && dropdownValue != value) {
            estimatedCost -= cost;
          }
          this.dropdownValue = value.toString();
          CostReview.estimatedCost = estimatedCost;
        });
        CostReview.optionsChosen.update(question, (value) => dropdownValue);
      },
      value: dropdownValue,
    );
  }
}
