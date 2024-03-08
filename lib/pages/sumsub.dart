import 'package:flutter/material.dart';

class SumSubPage extends StatefulWidget {
  const SumSubPage({super.key});

  @override
  State<SumSubPage> createState() => _SumSubPageState();
}

class _SumSubPageState extends State<SumSubPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sum and Sub"),
          backgroundColor: const Color.fromARGB(255, 255, 247, 140),
        ),
        body: Container(
          color: Color.fromARGB(255, 251, 255, 219),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(children: [_heading()]),
        ),
      ),
    );
  }

  Widget _heading() {
    return Container(
        alignment: Alignment.centerLeft,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sum and Sub  🧮",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 47, 46, 23)),
            ),
            Text(
              "Summation and Subtraction.",
              style:
                  TextStyle(fontSize: 16, color: Color.fromARGB(150, 0, 0, 0)),
            ),
          ],
        ));
  }
}
