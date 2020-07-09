import 'package:flutter/material.dart';
import 'constants.dart';
import 'reUsable.dart';

class Result extends StatelessWidget {
  Result(
      {@required this.resultText,
      @required this.bmiResult,
      @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: themeData,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text('BMI Result'),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Your Result..!',
                    style: kNumbericTextStyle,
                  ),
                ),
              ),
              Expanded(
                child: ReUseableCard(
                  cardColor: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          resultText,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          fontSize: 90.0,
                          color: kSelectedIconColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                            color: kSelectedIconColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                color: kAppbarColor,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: BottomButton(bottomButtonText: 'RE - CALCULATE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
