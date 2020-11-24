import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/choose_test.dart';
import 'package:quiz_app/screens/topic_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  customCard(String title, String image) {
    return InkWell(
      onTap: () {
        if (title == 'TOEIC READING') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChooseTest()));
        } else if (title == 'TOEIC VOCABULARY') {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TopicPage()));
        }
      },
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 150,
          width: 150,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/$title.jpg",
                  scale: 0.5,
                ),
              ),
              Text(title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: CustomColor.backgroundTest,
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CustomColor.backgroundTest,
                    Colors.black,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('TOEIC TRAINING'),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                  child: GridView.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: [
                      customCard('TOEIC READING', ''),
                      //customCard('TOEIC LISTENING', ''),
                      customCard('TOEIC VOCABULARY', ''),
                      //customCard('REVISION', ''),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
