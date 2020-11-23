import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/constants/theme_data.dart';
import 'package:quiz_app/screens/certain_vocab_page.dart';

class VocaBularyPage extends StatefulWidget {
  @override
  _VocaBularyPageState createState() => _VocaBularyPageState();
}

class _VocaBularyPageState extends State<VocaBularyPage> {
  vocabTopic(String title, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GetsJson(category: path)));
        },
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.white),
                  borderRadius: BorderRadius.circular(25)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/vocab/$path.jpg",
                  fit: BoxFit.cover,
                ),
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
    return Scaffold(
      backgroundColor: CustomColor.backgroundTest,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('CHỦ ĐỀ',
                  style: GoogleFonts.openSans(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
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
                      vocabTopic("Contract", "contract"),
                      vocabTopic("Marketing", 'marketing'),
                      vocabTopic("Warranty", 'warranty'),
                      vocabTopic("Business Planning", 'business'),
                      vocabTopic("Conferences", 'conference'),
                      vocabTopic("Computerthe Internet", 'computer'),
                      vocabTopic("Office Technology", 'office'),
                      vocabTopic("Office Procedure", 'procedure'),
                      vocabTopic("Electronics", 'electronic'),
                      vocabTopic("Correspondence", 'correspondence'),
                      vocabTopic("Job Ads & Recruitment", 'recruitment'),
                      vocabTopic("Apply and Interviewing", 'interview'),
                      vocabTopic("Hiring and Training", 'training'),
                      vocabTopic("Salaries & Benefit", 'salary'),
                      vocabTopic("Promotion & Awards", 'promotion'),
                      vocabTopic("Shopping", 'shopping'),
                      // vocabTopic("Ordering Supplies", 'order'),
                      // vocabTopic("Shipping", 'shipping'),
                      // vocabTopic("Invoices", 'invoice'),
                      // vocabTopic("Inventory", 'inventory'),
                      // vocabTopic(),
                      // vocabTopic(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
