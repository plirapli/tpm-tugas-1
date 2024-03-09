import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SumSubPage extends StatefulWidget {
  const SumSubPage({super.key});

  @override
  State<SumSubPage> createState() => _SumSubPageState();
}

class _SumSubPageState extends State<SumSubPage> {
  TextEditingController num = TextEditingController();
  String firstNum = "", secondNum = "";
  String operand = "";
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sum and Sub"),
          backgroundColor: const Color.fromARGB(255, 255, 244, 94),
        ),
        body: Container(
          color: const Color.fromARGB(255, 251, 255, 219),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(
              children: [_heading(), _calcLayout(context), _main(context)]),
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

  Widget _calcLayout(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(top: 64),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              firstNum,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              operand,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Text(
              secondNum,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }

  Widget _main(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _inputField(),
        _operationButtonLayout(context),
        _resetResultLayout(context),
        _result()
      ],
    );
  }

  Widget _inputField() {
    return TextField(
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 32),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      controller: num,
      onChanged: (value) {
        setState(() {
          if (operand == "") {
            firstNum = value;
          } else {
            secondNum = value;
          }
        });
      },
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

  Widget _operationButtonLayout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          _plusButton(context),
          const SizedBox(
            width: 12,
          ),
          _minButton(context)
        ],
      ),
    );
  }

  Widget _resetResultLayout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          _resetButton(context),
          const SizedBox(
            width: 12,
          ),
          _calcButton(context)
        ],
      ),
    );
  }

  Widget _plusButton(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: (operand == "" && firstNum != "")
                ? const Color.fromARGB(255, 255, 244, 94)
                : const Color.fromARGB(24, 0, 0, 0),
            foregroundColor:
                Theme.of(context).colorScheme.onPrimary, // foreground
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: (operand == "" && firstNum != "")
            ? () {
                // print("tes");
                setState(() {
                  operand = "+";
                  num.text = "";
                });
              }
            : null,
        child: Text(
          '+',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: (operand == "" && firstNum != "")
                  ? const Color.fromARGB(255, 23, 34, 47)
                  : const Color.fromARGB(64, 0, 0, 0)),
        ),
      ),
    );
  }

  Widget _minButton(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: (operand == "" && firstNum != "")
                ? const Color.fromARGB(255, 255, 244, 94)
                : const Color.fromARGB(24, 0, 0, 0),
            foregroundColor:
                Theme.of(context).colorScheme.onPrimary, // foreground
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: (operand == "" && firstNum != "")
            ? () {
                // print("tes");
                setState(() {
                  operand = "-";
                  num.text = "";
                });
              }
            : null,
        child: Text(
          '-',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: (operand == "" && firstNum != "")
                  ? const Color.fromARGB(255, 23, 34, 47)
                  : const Color.fromARGB(64, 0, 0, 0)),
        ),
      ),
    );
  }

  Widget _resetButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          backgroundColor: const Color.fromARGB(255, 255, 195, 195),
          foregroundColor:
              Theme.of(context).colorScheme.onPrimary, // foreground
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      onPressed: () {
        setState(() {
          firstNum = "";
          secondNum = "";
          operand = "";
          num.text = "";
          result = "0";
        });
      },
      child: const Text(
        "AC",
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 169, 5, 5)),
      ),
    );
  }

  Widget _calcButton(BuildContext context) {
    return Expanded(
      // width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: (secondNum != "")
                ? const Color.fromARGB(255, 0, 0, 0)
                : const Color.fromARGB(24, 0, 0, 0),
            foregroundColor:
                Theme.of(context).colorScheme.onPrimary, // foreground
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        onPressed: (secondNum != "")
            ? () {
                double first = double.parse(firstNum);
                double second = double.parse(secondNum);

                setState(() {
                  result = (operand == "+")
                      ? (first + second).toString()
                      : (first - second).toString();
                  firstNum = "";
                  secondNum = "";
                  operand = "";
                  num.text = "";
                });
              }
            : null,
        child: Text(
          '=',
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: (secondNum != "")
                  ? const Color.fromARGB(255, 251, 255, 219)
                  : const Color.fromARGB(64, 0, 0, 0)),
        ),
      ),
    );
  }

  Widget _result() {
    return Container(
      margin: const EdgeInsets.only(top: 36),
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
