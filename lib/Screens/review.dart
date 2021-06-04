import 'package:costcalculator/cost.dart';
import 'package:costcalculator/scrollingeffect.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Review Page',
          style: TextStyle(fontSize: 22.0),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Review your chosen options',
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                        itemCount: CostReview.optionsChosen.length,
                        itemBuilder: (BuildContext context, int index) {
                          String key =
                              CostReview.optionsChosen.keys.elementAt(index);
                          return new Column(
                            children: <Widget>[
                              new ListTile(
                                title: new Text(
                                  '$key',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                subtitle: new Text(
                                  '${CostReview.optionsChosen[key]}',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Text('Estimated Cost: \$ ${CostReview.estimatedCost}',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
