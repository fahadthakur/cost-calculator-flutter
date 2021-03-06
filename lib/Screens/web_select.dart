import 'dart:ui';

import 'package:costcalculator/Models/question.dart';
import 'package:costcalculator/Screens/review.dart';
import 'package:costcalculator/cost_review.dart';
import 'package:costcalculator/scrolling_effect.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class WebSelect extends StatefulWidget {
  const WebSelect({Key? key}) : super(key: key);

  @override
  _WebSelectState createState() => _WebSelectState();
}

class _WebSelectState extends State<WebSelect> {
  List<Question> questions = [
    Question('What is the purpose of the website?',
        ['Build Trust', 'Reach Audience', 'Generate Leads'], 1000),
    Question('Do you need help with branding?', ['Yes', 'No'], 500),
    Question('How many products or services do you plan to sell?',
        ['1-10', '10+'], 500),
    Question('Do you need a custom design?', ['Yes', 'No'], 500),
    Question(
        'Do you need a blog with your business website?', ['Yes', 'No'], 500),
    Question('Do you need to manage multiple languages?', ['Yes', 'No'], 300),
    Question(
        'Do you want the site to be structured for better Search engine visibility?',
        ['Yes', 'No'],
        200),
    Question('Do you want professional analytics tools to track conversions?',
        ['Yes', 'No'], 50),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                CostReview.optionsChosen.clear();
                CostReview.estimatedCost = 0;

                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_rounded)),
          title: Text(
            "Business Website Cost Calculator",
            style: TextStyle(fontSize: 22.0),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 90.0),
                  child: Container(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                          itemBuilder: (_, int index) => QuestionWidget(
                              questions[index].question,
                              questions[index].options,
                              questions[index].cost),
                          itemCount: questions.length),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Column(
                    children: [
                      Text(
                        'Current Estimated Cost: \$' +
                            CostReview.estimatedCost.toString(),
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 40.0,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: Icon(Icons.update_rounded),
                                label: Text(
                                  'Update Cost',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            SizedBox(
                              height: 40.0,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                onPressed: () {
                                  print(CostReview.optionsChosen);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ReviewPage()));
                                },
                                icon: Icon(Icons.rate_review_rounded),
                                label: Text(
                                  'Review Options',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
