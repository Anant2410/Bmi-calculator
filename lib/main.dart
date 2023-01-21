import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  var bg;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Container(
        color: bg,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text('BMI',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
                const SizedBox(height: 21),
                TextField(
                  controller: wtController,
                  decoration: const InputDecoration(
                      label: Text('Enter your Weight in kg'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11),
                TextField(
                  controller: ftController,
                  decoration: const InputDecoration(
                      label: Text('Enter your height in feet'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 11),
                TextField(
                  controller: inchController,
                  decoration: const InputDecoration(
                      label: Text('Enter your height in inches'),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: () {
                      var wt = wtController.text.toString();
                      var ft = ftController.text.toString();
                      var inch = inchController.text.toString();
                      if (wt != "" && ft != "" && inch != "") {
                        var iWt = int.parse(wt);
                        var iFt = int.parse(ft);
                        var iInch = int.parse(inch);
                        var total = (iFt * 12) + iInch;
                        var ans = (total * 2.54) / 100;
                        var bmi = iWt / (ans * ans);
                        var msg = "";
                        if (bmi > 25) {
                          msg = "overweight";
                          bg = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "underweight";
                          bg = Colors.red.shade200;
                        } else {
                          msg = "healthy";
                          bg = Colors.green.shade600;
                        }
                        setState(() {
                          result = "  $msg \n your bmi is:  ${bmi.toStringAsFixed(2)}";
                        });
                      } else {
                        setState(() {
                          result = "please fill all the required balnks";
                        });
                      }
                    },
                    child: const Text('Calculate')),
                const SizedBox(height: 11),
                Text(result, style: const TextStyle(fontSize: 20))
              ],
            ),
          ),
        ),
      ),
      )
    );
  }
}
