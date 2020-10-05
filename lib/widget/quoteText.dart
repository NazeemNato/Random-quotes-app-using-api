import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteWidget extends StatelessWidget {
  final Map qts;
  const QuoteWidget({Key key,@required this.qts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${qts['quoteText']}\n\n${qts['quoteAuthor']}'.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.anton(
          fontSize: 30,
          color: Colors.black87
        ),
      ),
    );
  }
}
