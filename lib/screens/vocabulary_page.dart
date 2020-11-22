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
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              vocabTopic("Contract", "contract"),
              vocabTopic("Marketing", 'marketing'),
              vocabTopic("Warranty", 'warranty'),
              vocabTopic("Business\nPlanning", 'business'),
              vocabTopic("Conferences", 'conference'),
              vocabTopic("  Computer\nthe Internet", 'computer'),
              vocabTopic("  Office \nTechnology", 'office'),
              vocabTopic("  Office \nProcedure", 'procedure'),
              vocabTopic("Electronics", 'electronic'),
              vocabTopic("Correspondence", 'correspondence'),
              vocabTopic("  Job Ads & \nRecruitment", 'recruitment'),
              vocabTopic("  Apply and \nInterviewing", 'interview'),
              vocabTopic("  Hiring and \n    Training", 'training'),
              vocabTopic("  Salaries &\n    Benefit", 'salary'),
              vocabTopic("  Promotion &\n     Awards", 'promotion'),
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
    );
  }
}
