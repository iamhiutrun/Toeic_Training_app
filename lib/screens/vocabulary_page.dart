import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/certain_vocab_page.dart';

class VocaBularyPage extends StatefulWidget {
  @override
  _VocaBularyPageState createState() => _VocaBularyPageState();
}

class _VocaBularyPageState extends State<VocaBularyPage> {
  vocabTopic(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      GetsJson(category: title.toLowerCase())));
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset("assets/vocab/$imagePath.jpg"),
              ),
            ),
            Text(title,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.backgroundTest,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            children: [
              vocabTopic("Contract", "contract"),
              vocabTopic("Assurance", 'assurance'),
              // vocabTopic(),
              // vocabTopic(),
            ],
          ),
        ),
      ),
    );
  }
}
