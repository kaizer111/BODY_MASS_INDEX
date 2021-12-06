import 'package:body_mass_index/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bottom_button.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {

ResultsPage({@required this.bmiresult, @required this.resultText, @required this.interpretation});

final String bmiresult;
final String resultText;
final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATER'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text('Your Results', style: kTitleTextStyle,),
          ),),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActivecardcolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),style: kResultTextStyle,),
                  Text(bmiresult,style: kBMInumberText,),
                  Text(interpretation, style: kBodyTet,
                  textAlign: TextAlign.center,),
                ],
              ),
              ),
          ),
          Expanded(
            child: Container(
              child: Bottombutton(
                buttonTitle: 'RE-CALCULATE',
                ontap: () {
                  Navigator.pop(context);
                },
                ),
            ),
          ),
        ],
      ),
      );
  }
}