import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 0;
  int gender = 0;//0 no choice, 1 male, 2 female
  int weight = 0;
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("BMI Calculator"),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: makeFirstRow(),
          ),
          Expanded(
            child: makeSecondRow(),
          ),
          Expanded(
            child: makeThirdRow(),
          ),
          Expanded(
            child: makeSubmitRow(),
          ),
        ]));
  }

  void maleButtonPressed() {
    //print("male");
    gender = 1; //male
  }

  void femaleButtonPressed() {
    //print("female");
    gender = 2; //female
  }

  void submitButtonPressed() {


    if (gender != 0 && height != 0 && weight != 0 && age != 0) {
      double bmi = weight / pow((height/100), 2);
      bmi = double.parse(bmi.toStringAsFixed(1));
      String msg;
      if (bmi < 18.5) {
        msg = "Your BMI is $bmi. You are underweight";
      } else if (bmi < 25) {
        msg = "Your BMI is $bmi. You are within normal weight range";
      } else if (bmi < 30) {
        msg = "Your BMI is $bmi. You are overweight";
      } else {
        msg = "Your BMI is $bmi. You are obese";
      }
      //print(bmi);
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(

              ),
              body: Container(
                alignment: Alignment(0,0),
                child:Text(msg, style: TextStyle(fontSize: 30), textAlign: TextAlign.center),


              )
            );
          },
        ),
      );
    }

  }

  Container makeFirstRow() {
    double p = 15.0;

    return Container(
        padding: EdgeInsets.all(p),
        color: Colors.white,
        child: Row(children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    maleButtonPressed();
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: gender == 1 ? Colors.blue : Colors.grey,
                      borderRadius: BorderRadius.circular(p),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male),
                          Text("Male"),
                        ]))),
          ),
          SizedBox(width: p),
          Expanded(
              child: GestureDetector(
            onTap: () {
              setState(() {
                femaleButtonPressed();
              });
            },
            child: Container(
                decoration: BoxDecoration(
                  color: gender == 2 ? Colors.blue : Colors.grey,
                  borderRadius: BorderRadius.circular(p),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.female),
                      Text("Female"),
                    ])),
          ))
        ]));
  }

  Container makeSecondRow() {
    return Container(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        color: Colors.white,
        child: Row(children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter Height (cms):"),
                      TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            print(value);
                            if (value != "") {
                              height = int.parse(value);
                            } else {
                              height = 0;
                            }
                          })
                    ])),
          ),
        ]));
  }

  Container makeThirdRow() {
    double p = 15.0;
    return Container(
        padding: EdgeInsets.all(p),
        color: Colors.white,
        child: Row(children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(p),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter Weight (kgs):"),
                      TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            print(value);
                            if (value != "") {
                              weight = int.parse(value);
                            } else {
                              weight = 0;
                            }
                          })
                    ])),
          ),
          SizedBox(width: p),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(p),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Enter Age:"),
                      TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            print(value);
                            if (value != "") {
                              age = int.parse(value);
                            } else {
                              age = 0;
                            }
                          })
                    ])),
          )
        ]));
  }

  Container makeSubmitRow() {
    return Container(
        color: Colors.red,
        child: Row(children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    submitButtonPressed();
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "Submit",
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                        ]))),
          ),
        ]));
  }
}
