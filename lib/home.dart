import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pushable_button/button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text('Pushable Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 50,
                  width: 200,
                  child: Button(
                      onPress: () {}, color: Colors.red, caption: 'PUSH ME')),
              const SizedBox(height: 10),
              SizedBox(
                  height: 50,
                  width: 200,
                  child: Button(
                      onPress: () {},
                      color: Colors.green,
                      caption: 'ENROLL NOW')),
              const SizedBox(height: 10),
              SizedBox(
                  height: 50,
                  width: 200,
                  child: Button(
                      onPress: () {},
                      color: Colors.blue,
                      caption: 'ADD TO BASKET')),
            ],
          ),
        ),
      ),
    );
  }
}
