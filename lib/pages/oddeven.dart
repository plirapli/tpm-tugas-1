import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  State<OddEvenPage> createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  String result = "-";
  String number = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Odd or Even"),
          backgroundColor: const Color.fromARGB(255, 121, 233, 255),
        ),
        body: Container(
          color: const Color.fromARGB(255, 219, 241, 255),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(children: [_heading(), _main()]),
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
              "Odd or Even  🔢",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 34, 47)),
            ),
            Text(
              "Identify whether a number is odd or even",
              style:
                  TextStyle(fontSize: 16, color: Color.fromARGB(150, 0, 0, 0)),
            ),
          ],
        ));
  }

  Widget _main() {
    return Container(
        margin: const EdgeInsets.only(top: 72),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [_inputField(), _calcButton(context), _result()],
        ));
  }

  Widget _inputField() {
    return TextField(
      onChanged: (value) {
        number = value;
      },
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*(\.[0-9]*)?')),
        // Formatter yang berfungsi untuk menetapkan inputan dari userr
        // User dapat menginputkan angka-angka, dan juga opsional satu titik (angka desimal)
      ],
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget _calcButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 14, bottom: 6),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 121, 233, 255),
            foregroundColor:
                Theme.of(context).colorScheme.onPrimary, // foreground
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
        onPressed: () {
          double? inputNumber = double.tryParse(number);
          setState(() {
            result = (inputNumber == null || inputNumber.isNaN)
                ? "😵"
                : (inputNumber % 2 == 0)
                    ? "EVEN"
                    : "ODD";
          });
        },
        child: const Text(
          'Check',
          style: TextStyle(color: Color.fromARGB(255, 23, 34, 47)),
        ),
      ),
    );
  }

  Widget _result() {
    return Container(
      margin: EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Result",
            style: TextStyle(fontSize: 18, height: 0.75),
          ),
          Text(
            result,
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
