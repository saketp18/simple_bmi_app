import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_bmi_app/data/data.dart';
import 'package:simple_bmi_app/screen1.dart';
import 'package:simple_bmi_app/views/card_views.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C22),
        accentColor: Color(0xFF090C22),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFF848697),
            fontSize: 18.0,
            letterSpacing: 2.0,
          ),
        ),
      ),
      home: MyHomePage(title: 'BMI Calculator'),
    );
  }
}

Color activeColor = Color(0xFF1D1F33);
Color inactiveColor = Color(0xFF101427);
Color maleColor = Color(0xFF101427);
Color femaleColor = Color(0xFF101427);

Color inactiveTextColor = Color(0xFF848697);
Color activeTextColor = Color(0xFFFFFFFF);
Color maleTextColor = Color(0xFF848697);
Color femaleTextColor = Color(0xFF848697);
int heightValue = 200;
int weightValue = 60;
int ageValue = 18;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Data data = Data();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFF090C22),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.MALE);
                        });
                      },
                      child: ReuseableCard(
                        color: maleColor,
                        cardChild: IconContent(
                          icons: FontAwesomeIcons.mars,
                          label: "MALE",
                          textColor: maleTextColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateColor(Gender.FEMALE);
                        });
                      },
                      child: ReuseableCard(
                          color: femaleColor,
                          cardChild: IconContent(
                            icons: FontAwesomeIcons.venus,
                            label: "FEMALE",
                            textColor: femaleTextColor,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReuseableCard(
                color: inactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HEIGHT"),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          data.height.toString(),
                          style: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                            color: activeTextColor,
                            letterSpacing: 3.0,
                          ),
                        ),
                        Text("cm")
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: SliderTheme(
                        data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(
                              enabledThumbRadius: 15.0,
                            ),
                            overlayColor: Color(0x1FEA1556),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 26.0),
                            thumbColor: Color(0xFFEA1556),
                            activeTrackColor: Color(0xFFFDFFFF),
                            inactiveTrackColor: Color(0xFF888895)),
                        child: Slider(
                          onChanged: (double value) {
                            setState(() {});
                            data.height = value.round();
                          },
                          value: data.height.toDouble(),
                          max: 240,
                          min: 140,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCard(
                      color: inactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("WEIGHT"),
                          Text(
                            data.weight.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: activeTextColor,
                              letterSpacing: 3.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    data.weight--;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                elevation: 10.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                fillColor: Color(0xFF1C2033),
                                shape: CircleBorder(),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    data.weight++;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                elevation: 10.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                fillColor: Color(0xFF1C2033),
                                shape: CircleBorder(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCard(
                      color: inactiveColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                          ),
                          Text(
                            data.age.toString(),
                            style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: activeTextColor,
                              letterSpacing: 3.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    data.age--;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                                elevation: 10.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                fillColor: Color(0xFF1C2033),
                                shape: CircleBorder(),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  setState(() {
                                    data.age++;
                                  });
                                },
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                                elevation: 10.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56,
                                  height: 56,
                                ),
                                fillColor: Color(0xFF1C2033),
                                shape: CircleBorder(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                var bmi = data.calculateBMI();
                print(bmi.toStringAsFixed(2));
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                              data: data,
                            )));
              },
              child: Container(
                height: 65.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(3),
                    topLeft: Radius.circular(3),
                  ),
                  color: Color(0xFFEA1556),
                ),
                child: Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      color: activeTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updateColor(Gender gender) {
    if (Gender.FEMALE == gender) {
      maleColor = inactiveColor;
      maleTextColor = inactiveTextColor;
      femaleColor = activeColor;
      femaleTextColor = activeTextColor;
    } else if (Gender.MALE == gender) {
      maleColor = activeColor;
      maleTextColor = activeTextColor;
      femaleColor = inactiveColor;
      femaleTextColor = inactiveTextColor;
    }
  }
}
