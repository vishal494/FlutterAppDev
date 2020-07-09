import 'package:flutter/material.dart';
import 'constants.dart';
import 'result.dart';
import 'operationBrains.dart';
import 'main.dart';

class CardData extends StatelessWidget {
  CardData({this.nameLabel, this.icon, this.icon_labelColor});

  final String nameLabel;
  final IconData icon;
  // ignore: non_constant_identifier_names
  final Color icon_labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100,
          color: icon_labelColor,
        ),
        Text(
          nameLabel,
          style: TextStyle(
            color: icon_labelColor,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        )
      ],
    );
  }
}

class ReUseableCard extends StatelessWidget {
  ReUseableCard({@required this.cardColor, this.cardChild});

  final Color cardColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}

class ReuseIcon extends StatelessWidget {
  ReuseIcon({@required this.iconData, @required this.color});

  final IconData iconData;
  final bool color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: color ? kAppbarColor.withAlpha(90) : kSelectedIconColor,
      size: 40.0,
    );
  }
}

class BottomButton extends StatelessWidget {
  BottomButton({@required this.bottomButtonText});

  final String bottomButtonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        bottomButtonText,
        style: kBottomButton,
      ),
    );
  }
}

class calculateClass extends StatelessWidget {
  const calculateClass({
    Key key,
    @required this.selectedLabel,
    @required this.weight,
    @required this.height,
    @required GlobalKey<ScaffoldState> scaffoldKey,
  })  : _scaffoldKey = scaffoldKey,
        super(key: key);

  final Gender selectedLabel;
  final int weight;
  final double height;
  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      color: kAppbarColor,
      child: GestureDetector(
        onTap: () {
          if (selectedLabel != null) {
            OperationBrains operationBrains =
                OperationBrains(weight: weight, height: height);

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => new Result(
                        bmiResult: operationBrains.result(),
                        resultText: operationBrains.resultText(),
                        interpretation: operationBrains.interpretation(),
                      )),
            );
          } else {
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        },
        child: BottomButton(bottomButtonText: 'CALCULATE'),
      ),
    );
  }
}
