import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/result_page.dart';

class GetJson extends StatelessWidget {
  final String jsonLoad;
  final String test;

  const GetJson({Key key, this.jsonLoad, this.test}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(jsonLoad, cache: false),
      builder: (context, snapshot) {
        List myData = json.decode(snapshot.data.toString());
        if (myData == null) {
          return Scaffold(
            backgroundColor: CustomColor.backgroundTest,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpinKitSquareCircle(
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text('LOADING',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.textQuestion)),
                ],
              ),
            ),
          );
        } else {
          return QuizPage(
            myData: myData,
            test: test,
          );
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  final List myData;
  final String test;
  QuizPage({this.myData, this.test});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int mark = 0;
  bool _isButtonDisabled;
  @override
  void initState() {
    super.initState();
    _isButtonDisabled = false;
  }

  Map<String, Color> btnColor = {
    "A": CustomColor.colortoshow,
    "B": CustomColor.colortoshow,
    "C": CustomColor.colortoshow,
    "D": CustomColor.colortoshow,
  };
  Color colorToShow = CustomColor.colortoshow;
  Color right = CustomColor.right;
  Color wrong = CustomColor.wrong;

  Future delay() {
    return Navigator.push(context,
        MaterialPageRoute(builder: (context) => ResultPage(score: mark)));
  }

  void nextQuestion() {
    setState(() {
      _isButtonDisabled = false;
      if (index < widget.myData.length - 1) {
        index = index + 1;
      }
    });
    if (index + 1 == widget.myData.length) {
      Future.delayed(Duration(seconds: 3), delay);
    }
  }

  checkAnswer(String key) {
    setState(() {
      _isButtonDisabled = true;
      if (key == widget.myData[index]['answer']) {
        mark += 5;
        print(key);
        btnColor[key] = right;
      } else {
        if (widget.myData[index]["A"] == widget.myData[index]['answer']) {
          btnColor[widget.myData[index]["A"]] = right;
        }
        if (widget.myData[index]["B"] == widget.myData[index]['answer']) {
          btnColor[widget.myData[index]["B"]] = right;
        }

        if (widget.myData[index]["C"] == widget.myData[index]['answer']) {
          btnColor[widget.myData[index]["C"]] = right;
        }

        if (widget.myData[index]["D"] == widget.myData[index]['answer']) {
          btnColor[widget.myData[index]["D"]] = right;
        }

        btnColor[key] = wrong;
      }

      return Timer(Duration(seconds: 2), nextQuestion);
    });
  }

  Widget answer(String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          _isButtonDisabled ? null : checkAnswer(answer);
        },
        child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: btnColor[answer],
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.indigo, width: 4),
            ),
            child: Row(
              children: [
                Text(answer,
                    style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                        color: CustomColor.textQuestion)),
              ],
            )),
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(widget.myData[index]['hint'],
                style: GoogleFonts.openSans(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black)),
          ),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF252c4a),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Question ${index + 1}/${widget.myData.length}',
                        style: GoogleFonts.openSans(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.textHeaderQuiz)),
                    FlatButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        onPressed: () {
                          Navigator.popUntil(
                              context, ModalRoute.withName('/home'));
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text('HOME',
                              style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.textQuestion)),
                        )),
                  ],
                ),
              ),
              Divider(
                color: CustomColor.textHeaderQuiz,
                thickness: 2,
              ),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 70,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 10,
                percent: (index + 1) / widget.myData.length,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.green,
                animateFromLastPercent: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(widget.test,
                    textAlign: TextAlign.end,
                    style: GoogleFonts.openSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
              ),
              Expanded(
                flex: 5,
                child: Center(
                  child: Text(widget.myData[index]['question'],
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.textQuestion)),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    answer(widget.myData[index]["A"]),
                    answer(widget.myData[index]["B"]),
                    answer(widget.myData[index]["C"]),
                    answer(widget.myData[index]["D"]),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Icon(
                      Icons.lightbulb,
                      color: Colors.yellowAccent,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text('Your scored: $mark',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.textQuestion)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
