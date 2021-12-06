import 'package:body_mass_index/Calculator_Brain.dart';
import 'package:body_mass_index/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'Icon_content.dart';
import 'Result_page.dart';


import 'constants.dart';
import 'Bottom_button.dart';



enum Gender {
   male ,
   female ,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

Gender selectedGender;
int height=180;
int weight=60;
int age=20;


  @override
  Widget build(BuildContext context) {
    var children2 = <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onpress: () {
                    setState(() {
                                          selectedGender = Gender.male;
                                        });
                  },
                  colour: selectedGender == Gender.male ? kActivecardcolour : kInactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars,label: 'MALE',),
                  )
                  ),
              Expanded(
                child: ReusableCard(
                  onpress: () {
                    setState(() {
                                          selectedGender = Gender.female;
                                        });
                  },
                  colour:  selectedGender == Gender.female ? kActivecardcolour : kInactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.venus,label: 'FEMALE',),
                  ),),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActivecardcolour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Text('Height', style: klabelTextStyle,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: <Widget>[
                     Text(height.toString(),style:kNumbertext,),
                     Text('  CM', style: klabelTextStyle,)
                   ],
                 ),
                 SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     thumbColor: Color(0xFFEB1555),
                     activeTrackColor: Colors.white,
                     overlayColor: Color(0x29EB1555),
                     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                     overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                   ),
                   child: Slider(
                     value: height.toDouble(),
                     min: 120.0,
                     max: 220.0, 
                     inactiveColor: Color(0xFF8D8B98),
                     onChanged: (double newValue) {
                       setState(() {
                                           height = newValue.round();
                                            });
                       },
                    ),
                 )
               ],
              ),
              ),
              ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour:  kActivecardcolour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style:  klabelTextStyle,),
                      Text(weight.toString(), style: kNumbertext,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                                setState(() {
                                                    weight++;
                                                                });
                            },
                            ),
                              SizedBox(width: 10.0,),
                             RoundIconButton(
                               icon: FontAwesomeIcons.minus,
                               onPressed: () {
                                 setState(() {
                                                    weight--;
                                                                  });
                               },
                               ),
                        ],
                      )
                    ],
                  ),
                  )
                  ),
              Expanded(
                child: ReusableCard(
                  colour:  kActivecardcolour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('AGE', style: klabelTextStyle,),
                      Text(age.toString(),style: kNumbertext,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                            setState(() {
                                              age++;
                                                        });
                          },),
                          SizedBox(width: 10.0,),
                          RoundIconButton(icon: FontAwesomeIcons.minus,onPressed: () {
                            setState(() {
                                           age--;               
                                                        });
                          },)
                        ],
                      )

                    ],
                  ),
                  ),
                  ),
            ],
          )),
          Bottombutton(
            buttonTitle: 'see results',
            ontap: () {
                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiresult: calc.caculateBMI(),
                      resultText: calc.resultsbmi(),
                      interpretation: calc.getInterpretation(),
                    )),);
            },
          ),
        ];
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children2,
      ),
      
    );
  }
}



class RoundIconButton  extends StatelessWidget {

RoundIconButton({@required this.icon, @required this.onPressed});
final IconData icon;
final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width:  56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E), 
     );
  }
}