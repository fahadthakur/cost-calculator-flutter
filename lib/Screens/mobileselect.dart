import 'dart:ui';

import 'package:costcalculator/Models/question.dart';
import 'package:costcalculator/Screens/review.dart';
import 'package:costcalculator/cost.dart';
import 'package:costcalculator/scrollingeffect.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class MobileSelect extends StatefulWidget {
  const MobileSelect({Key? key}) : super(key: key);

  @override
  _MobileSelectState createState() => _MobileSelectState();
}

class _MobileSelectState extends State<MobileSelect> {
  List<Question> questions = [
    Question('Select app technology', ['Android', 'iOS', 'Both'], 1000),
    Question(
        'Will your users require an account to login?', ['Yes', 'No'], 200),
    Question('Would your app need to take photos or watch videos?',
        ['Yes', 'No'], 100),
    Question('Would your app need to connect to any Bluetooth or IoT devices?',
        ['Yes', 'No'], 300),
    Question('Does your app need a Referral system?', ['Yes', 'No'], 500),
    Question('Does your app require card payments?', ['Yes', 'No'], 500),
    Question('Do you want your app to have Navigation / Map functionality?',
        ['Yes', 'No'], 300),
    Question('Will you need to send push notifications?', ['Yes', 'No'], 100),
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
          "Mobile App Cost Calculator",
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
