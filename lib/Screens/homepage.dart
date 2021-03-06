import 'package:costcalculator/Screens/mobile_select.dart';
import 'package:costcalculator/Screens/web_select.dart';
import 'package:costcalculator/cost_review.dart';
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
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Container(
                      width: 410.0,
                      height: 410.0,
                      child: Image.asset('assets/invoice_logo.png'),
                    ),
                  ),
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
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        isEmpty: chosenIndustry == '',
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            icon: Icon(Icons.arrow_drop_down_circle_rounded),
                            iconEnabledColor: Colors.indigo,
                            isExpanded: true,
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'What are you planning to develop?',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
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
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      SizedBox(
                        height: 45.0,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MobileSelect()));
                          },
                          icon: Icon(Icons.phone_android_rounded),
                          label: Text(
                            'Mobile App',
                            style: TextStyle(fontSize: 18.0),
                          ),
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
