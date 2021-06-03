import 'package:flutter/material.dart';

import '../widgets.dart';

class WebSelect extends StatefulWidget {
  const WebSelect({Key? key}) : super(key: key);

  @override
  _WebSelectState createState() => _WebSelectState();
}

class _WebSelectState extends State<WebSelect> {
  var questions = {
    'What is the purpose of the website?': [
      'Build Trust',
      'Reach Audience',
      'Generate Leads'
    ],
    'Do you need help with branding?': ['Yes', 'No'],
    'How many products or services do you plan to sell?': ['1-10', '10+'],
    'Do you need a custom design?': ['Yes', 'No'],
    'Do you need a blog with your business website?': ['Yes', 'No'],
    'Do you need to manage multiple languages?': ['Yes', 'No'],
    'Do you want the site to be structured for better Search engine visibility?':
        ['Yes', 'No'],
    'Do you want professional analytics tools to track conversions?': [
      'Yes',
      'No'
    ]
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Website Cost Calculator"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Container(
            child: ListView.builder(
                itemBuilder: (_, int index) => QuestionWidget(
                    questions.keys.elementAt(index),
                    questions.values.elementAt(index)),
                itemCount: questions.length.toInt()),
          ),
        ),
      ),
    );
  }
}
