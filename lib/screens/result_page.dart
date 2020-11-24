import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';

class ResultPage extends StatelessWidget {
  final int score;

  const ResultPage({Key key, this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundTest,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              child: Image.asset("assets/result/good.jpg"),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Your Scored: $score',
                style: GoogleFonts.openSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.textQuestion)),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(15)),
            child: FlatButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                },
                child: Text('HOME',
                    style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.textQuestion))),
          ),
        ],
      ),
    );
  }
}
