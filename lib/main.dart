import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'reUsable.dart';
import 'constants.dart';

void main() => runApp(MyApp());

enum Gender {
  male,
  female,
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Gender selectedLabel;

  double height = 5.0;

  int weight = 50;
  int age = 20;
  bool agePlus = false;
  bool ageMinus = false;
  bool weightPlus = false;
  bool weightMinus = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: themeData,
      home: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Center(
              child: Text('BMI Me'),
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLabel = Gender.male;
                          });
                        },
                        onDoubleTap: () {
                          setState(() {
                            selectedLabel = null;
                          });
                        },
                        child: ReUseableCard(
                          cardColor: selectedLabel == Gender.male
                              ? kActiveColor
                              : kInactiveColor,
                          cardChild: CardData(
                            icon: Icons.accessibility_new,
                            nameLabel: 'MALE',
                            icon_labelColor: selectedLabel == Gender.male
                                ? kIconColor
                                : kSelectedIconColor,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLabel = Gender.female;
                          });
                        },
                        onDoubleTap: () {
                          setState(() {
                            selectedLabel = null;
                          });
                        },
                        child: ReUseableCard(
                          cardColor: selectedLabel == Gender.female
                              ? kActiveColor
                              : kInactiveColor,
                          cardChild: CardData(
                            nameLabel: 'FEMALE',
                            icon: Icons.favorite,
                            icon_labelColor: selectedLabel == Gender.female
                                ? kIconColor
                                : kSelectedIconColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ReUseableCard(
                cardColor: kActiveColor,
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kFixedTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      //verticalDirection: ,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: TextStyle(
                            color: kSelectedIconColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 50.0,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'ft\'inch',
                          style: kFixedTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        activeTrackColor: kSelectedIconColor,
                        thumbColor: kSelectedIconColor,
                        inactiveTrackColor: kInactiveColor,
                        overlayColor: Colors.red.withAlpha(80),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 40.0,
                        ),
                      ),
                      child: Slider(
                        min: 4.5,
                        max: 6.5,
                        divisions: 20,
                        value: height,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue;
                          });
                        },
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReUseableCard(
                        cardColor: kActiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: kFixedTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumbericTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      weight++;
                                      weightPlus = true;
                                    });
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      weightPlus = false;
                                    });
                                  },
                                  child: ReuseIcon(
                                    iconData: Icons.add_circle,
                                    color: weightPlus,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      if (weight > 3) weight--;
                                      weightMinus = true;
                                    });
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      weightMinus = false;
                                    });
                                  },
                                  child: ReuseIcon(
                                    iconData: Icons.indeterminate_check_box,
                                    color: weightMinus,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReUseableCard(
                        cardColor: kActiveColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: kFixedTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumbericTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      age++;
                                      agePlus = true;
                                    });
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      agePlus = false;
                                    });
                                  },
                                  child: ReuseIcon(
                                    iconData: Icons.add_circle,
                                    color: agePlus,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                GestureDetector(
                                  onTapDown: (_) {
                                    setState(() {
                                      if (age > 3) age--;
                                      ageMinus = true;
                                    });
                                  },
                                  onTapUp: (_) {
                                    setState(() {
                                      ageMinus = false;
                                    });
                                  },
                                  child: ReuseIcon(
                                    iconData: Icons.indeterminate_check_box,
                                    color: ageMinus,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              calculateClass(
                  selectedLabel: selectedLabel,
                  weight: weight,
                  height: height,
                  scaffoldKey: _scaffoldKey),
            ],
          ),
        ),
      ),
    );
  }
}
