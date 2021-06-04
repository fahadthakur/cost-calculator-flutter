import 'dart:ui';

import 'package:costcalculator/Models/question.dart';
import 'package:costcalculator/Screens/review.dart';
import 'package:costcalculator/cost.dart';
import 'package:costcalculator/scrollingeffect.dart';
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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              CostReview.optionsChosen.clear();
              CostReview.estimatedCost = 0;
              print(CostReview.optionsChosen);
              print(CostReview.estimatedCost);
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text(
          "Business Website Cost Calculator",
          style: TextStyle(fontSize: 22.0),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 80.0),
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
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            print('Clciked');
                            setState(() {});
                          },
                          icon: Icon(Icons.update_rounded),
                          label: Text(
                            'Update Cost',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            print(CostReview.optionsChosen);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewPage()));
                          },
                          icon: Icon(Icons.reviews_rounded),
                          label: Text(
                            'Review Chosen Options',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
