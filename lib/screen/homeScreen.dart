import 'package:flutter/material.dart';
import 'package:gitquotes/widget/quoteText.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future _response;
  var qtLength;
  var ranNum;
  @override
  void initState() {
    super.initState();
    _response = getQuotesFromUrl();
  }

  getQuotesFromUrl() async {
    final response = await http
        .get('http://run.mocky.io/v3/1649bd7b-1fb3-44fe-83a6-2c529afb112d');
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      setState(() {
        qtLength = json.length;
      });
      return json;
    } else {
      throw Exception('Failed to load qutoes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              child: FutureBuilder(
                future: _response,
                builder: (context, response) {
                  if (response.hasData) {
                    ranNum = Random().nextInt(qtLength - 1);
                    return QuoteWidget(qts: response.data[ranNum]);
                  } else if (response.hasError) {
                    return Text(
                      'Error',
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                      ),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Get Random Quotes',
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            ranNum = Random().nextInt(qtLength - 1);
          });
        },
      ),
    );
  }
}
