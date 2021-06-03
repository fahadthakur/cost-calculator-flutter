import 'package:costcalculator/Models/question.dart';
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
        title: Text("Business Website Cost Calculator"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Container(
                  child: ListView.builder(
                      itemBuilder: (_, int index) => QuestionWidget(
                          questions[index].question,
                          questions[index].options,
                          questions[index].cost),
                      itemCount: questions.length),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
