import 'package:flutter/material.dart';
import 'dart:math';

class BMIscreen extends StatefulWidget {
  const BMIscreen({super.key});

  @override
  State<BMIscreen> createState() => _SIPscreenState();
}

class _SIPscreenState extends State<BMIscreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  

  double _bmi = 0.0;
  
  double calculateBMI(double height, double weight) {
    
   return weight / pow(height / 100, 2) ;
    
  }

  

  void _calculate() {
    double height = double.parse(_heightController.text);
    double weight = double.parse(_weightController.text);
    

    setState(() {
      _bmi = calculateBMI(height, weight);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _heightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Your height (in cm.)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _weightController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepOrange,
                    ),
                  ),
                  hintText: "Your weight (in kgs)",
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 30),
           
            const SizedBox(height: 30),
            TextButton(
              onPressed: _calculate,
              child: const Text("Calculate my BMI"),
            ),
            const SizedBox(height: 30),
            Text('Your BMI: ${_bmi.toStringAsFixed(2)}'),
            const SizedBox(height: 30),
          
          
          ],
        ),
      ),
    );
  }
}
