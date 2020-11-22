import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/home_page.dart';
import 'package:quiz_app/screens/result_page.dart';

class GetJson extends StatelessWidget {
  final String jsonLoad = "assets/reading.json";
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(jsonLoad, cache: false),
      builder: (context, snapshot) {
        List myData = json.decode(snapshot.data.toString());
        if (myData == null) {
          return Scaffold(
            body: Center(
              child: Text(
                "Loading",
              ),
            ),
          );
        } else {
          return QuizPage(myData: myData);
        }
      },
    );
  }
}

class QuizPage extends StatefulWidget {
  final List myData;
  QuizPage({this.myData});
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int mark = 0;

  Map<String, Color> btnColor = {
    "A": CustomColor.colortoshow,
    "B": CustomColor.colortoshow,
    "C": CustomColor.colortoshow,
    "D": CustomColor.colortoshow,
  };
  Color colorToShow = CustomColor.colortoshow;
  Color right = CustomColor.right;
  Color wrong = CustomColor.wrong;

  void nextQuestion() {
    setState(() {
      if (index < widget.myData.length - 1) {
        index = index + 1;
      }
    });
  }

  checkAnswer(String key) {
    setState(() {
      if (key == widget.myData[index]['answer']) {
        mark += 5;
        btnColor[key] = right;
      } else
        btnColor[key] = wrong;
      return Timer(Duration(seconds: 2), nextQuestion);
    });
  }

  Widget answer(String answer) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          checkAnswer(answer);
          if (index + 1 == widget.myData.length) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(score: mark)));
          }
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
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15)),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text('HOME',
                              style: GoogleFonts.openSans(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.textQuestion))),
                    ),
                  ],
                ),
              ),
              Divider(
                color: CustomColor.textHeaderQuiz,
                thickness: 2,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Expanded(
                flex: 4,
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
                    answer(widget.myData[index]['A']),
                    answer(widget.myData[index]['B']),
                    answer(widget.myData[index]['C']),
                    answer(widget.myData[index]['D']),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)),
                  child: FlatButton(
                      onPressed: () {
                        nextQuestion();
                      },
                      child: Text('SKIP',
                          style: GoogleFonts.openSans(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: CustomColor.textQuestion))),
                ),
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
                  Text('Your scored: $mark',
                      style: GoogleFonts.openSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.textQuestion)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
