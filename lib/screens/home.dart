import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset("images/youtubelogo.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget> [
          Align(
            alignment: Alignment.center,
            child: Text("0"),
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            color: Colors.red,
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
