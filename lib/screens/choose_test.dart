import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/quiz_page.dart';

class ChooseTest extends StatefulWidget {
  @override
  _ChooseTestState createState() => _ChooseTestState();
}

class _ChooseTestState extends State<ChooseTest> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  testOption(String title, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          if (title != "Part 1 - Test 3 (comming son)")
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GetJson(jsonLoad: path, test: title)));
          else {
            _globalKey.currentState
                .showSnackBar(SnackBar(content: Text("Comming Son")));
          }
        },
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  borderRadius: BorderRadius.circular(25)),
              child: Image.asset(
                "assets/test.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Text(title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _globalKey,
      backgroundColor: CustomColor.backgroundTest,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: size / 4),
          child: Column(children: [
            Text("BỘ ĐỀ ETS 2020",
                style: GoogleFonts.openSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: [
                      testOption('Part 1 - Test 1', 'assets/test1part1.json'),
                      testOption('Part 1 - Test 2', 'assets/test2part1.json'),
                      testOption("Part 1 - Test 3 (comming son)",
                          'assets/test2part1.json'),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
