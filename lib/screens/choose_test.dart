import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/quiz_page.dart';

class ChooseTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColor.backgroundTest,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: size / 4),
          child: Column(
            children: [
              Text("BỘ ĐỀ ETS 2020",
                  style: GoogleFonts.openSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Colors.green,
                            Colors.orange,
                          ]),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.ac_unit),
                          title: Text("Part 5 - Test 1"),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GetJson()));
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
