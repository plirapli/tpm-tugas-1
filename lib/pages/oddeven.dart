import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OddEvenPage extends StatefulWidget {
  const OddEvenPage({super.key});

  @override
  State<OddEvenPage> createState() => _OddEvenPageState();
}

class _OddEvenPageState extends State<OddEvenPage> {
  TextEditingController num = TextEditingController();
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
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: const Color.fromARGB(255, 219, 241, 255),
          child: ListView(scrollDirection: Axis.vertical, children: [
            const SizedBox(height: 20),
            _heading(),
            _main(),
            const SizedBox(height: 20)
          ]),
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
                  fontSize: 24,
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
      controller: num,
      onChanged: (value) {
        if (value.isNotEmpty && value.length > 1) {
          if (value.characters.characterAt(0) == Characters("0")) {
            // we need to remove the first char
            num.text = value.substring(1);

            // we need to move the cursor
            num.selection = TextSelection.collapsed(offset: num.text.length);
          } else if (value.characters.characterAt(0) == Characters("-") &&
              value.characters.characterAt(1) == Characters("0")) {
            num.text = value.substring(2, 2);
          }
        }
      },
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 32),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*')),
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
          if (num.text.isNotEmpty && num.text != "-") {
            double? inputNumber = double.parse(num.text[num.text.length - 1]);
            setState(() {
              result = (inputNumber % 2 == 0) ? "EVEN" : "ODD";
            });
          } else {
            setState(() {
              result = "😵";
            });
          }
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
      margin: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Result",
            style: TextStyle(fontSize: 18, height: 0.75),
          ),
          Text(
            result,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
