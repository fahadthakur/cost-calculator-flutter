import 'package:costcalculator/Screens/webselect.dart';
import 'package:costcalculator/cost.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> industries = [
    'Education',
    'Healthcare',
    'Travel & Tourism',
    ' Bank & Finance',
    'Government',
    'Others'
  ];

  String chosenIndustry = 'Education';
  bool contentVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home_rounded),
        title: Text(
          'Cost Calculator',
          style: TextStyle(fontSize: 22.0),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'What is your target industry?',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  FormField<String>(
                    builder: (FormFieldState<String> state) {
                      return InputDecorator(
                        decoration: InputDecoration(
                            labelText: 'Industry',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                        isEmpty: chosenIndustry == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: chosenIndustry,
                            isDense: true,
                            onChanged: (value) {
                              setState(() {
                                chosenIndustry = value.toString();
                                state.didChange(value);
                              });
                              if (chosenIndustry == 'Others') {
                                contentVisible = true;
                              } else {
                                contentVisible = false;
                              }
                              CostReview.industry = chosenIndustry;
                              print(CostReview.industry);
                            },
                            items: industries.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Visibility(
                    visible: contentVisible,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Name of the industry',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        labelStyle: TextStyle(fontSize: 16.0),
                      ),
                      style: TextStyle(fontSize: 18.0),
                      onChanged: (value) {
                        CostReview.industry = value;
                        print(CostReview.industry);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Text(
                    'What are you planning to develop?',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebSelect()));
                        },
                        icon: Icon(Icons.web_rounded),
                        label: Text(
                          'Business Website',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.phone_android_rounded),
                        label: Text(
                          'Mobile App',
                          style: TextStyle(fontSize: 18.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
