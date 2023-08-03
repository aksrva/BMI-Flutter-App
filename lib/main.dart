import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'BMI Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  var bgColors = Colors.blue[50];
  var calculatedBMI = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: bgColors,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter Height",
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter Weight",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: ElevatedButton(
                    onPressed: () {
                      var h = double.parse(heightController.text);
                      var w = double.parse(weightController.text);
                      var bmi = double.parse((w / (h * h)).toStringAsFixed(2));
                      print(bmi);
                      if (bmi <= 18.5) {
                        bgColors = Colors.amber[100];
                        calculatedBMI =
                            "Your BMI : $bmi. \nYou are Under Weight.";
                      } else if (bmi <= 24.9 && bmi > 18.5) {
                        bgColors = Colors.green[200];
                        calculatedBMI = "Your BMI : $bmi. \nYou are Healty.";
                      } else if (bmi <= 39.9 && bmi > 25.0) {
                        // 25.0 - 39.9
                        bgColors = Colors.deepOrange[200];
                        calculatedBMI =
                            "Your BMI : $bmi. \nYou are Over Weight.";
                      } else {
                        bgColors = Colors.red[300];
                        calculatedBMI = "Your BMI : $bmi. \nYou are Obese.";
                      }
                      setState(() {});
                    },
                    child: const Text("Calculate BMI"),
                  )),
              const SizedBox(height: 20),
              Text(
                calculatedBMI,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
