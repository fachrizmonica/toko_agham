
import 'package:flutter/material.dart';

class Infoaplikasi extends StatefulWidget {
  @override
  _InfoaplikasiState createState() => _InfoaplikasiState();
}

class _InfoaplikasiState extends State<Infoaplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Info Aplikasi"),
      ),
      body: Column(
        children: <Widget>[
          Image.network('https://1.bp.blogspot.com/-fLpUTx3CQM4/XhB3xT3u30I/AAAAAAAAArY/dEKJhnhwLogQyR9BZl71DVHXjMhP_SGCgCLcBGAsYHQ/s320/toko.png', height: 200),
          SizedBox(
            height: 60,
          ),
          Text(
            'Software for Android',
            style: TextStyle(fontSize: 14, fontFamily: "Calibri")
            ),
          SizedBox(
              height: 20,
          ),  
          Text(
            'Versi Aplikasi : Beta',
            style: TextStyle(fontSize: 20, fontFamily: "Calibri")
            ),
          //   SizedBox(
          //   height: 20,
          // ),
            // Text(
            // 'TOKO AGHAM',
            // style: TextStyle(fontSize: 20, fontFamily: "Calibri")
            // ),
            SizedBox(
            height: 350,
          ),
            Text(
            'Copyright 2020 AGHAM Shop.',
            style: TextStyle(fontSize: 14, fontFamily: "Calibri")
            ),
        ],
      ),
    );
  }
}