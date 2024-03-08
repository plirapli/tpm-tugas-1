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
          backgroundColor: const Color.fromARGB(255, 255, 244, 94),
        ),
        body: Container(
          color: const Color.fromARGB(255, 251, 255, 219),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(children: [_heading(), _main(context)]),
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

  Widget _main(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 72),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _inputField(),
            _operationButtonLayout(context),
            _calcButton(context),
            _result()
          ],
        ));
  }

  Widget _inputField() {
    return const TextField(
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 32),
      decoration: InputDecoration(
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
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          _plusButton(context),
          const SizedBox(
            width: 8,
          ),
          _minButton(context)
        ],
      ),
    );
  }

  Widget _plusButton(BuildContext context) {
    return Expanded(
      child: Container(
        child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color.fromARGB(255, 255, 244, 94),
              foregroundColor:
                  Theme.of(context).colorScheme.onPrimary, // foreground
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {},
          child: const Text(
            '+',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 23, 34, 47)),
          ),
        ),
      ),
    );
  }

  Widget _minButton(BuildContext context) {
    return Expanded(
      child: Container(
        child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: const Color.fromARGB(255, 255, 244, 94),
              foregroundColor:
                  Theme.of(context).colorScheme.onPrimary, // foreground
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: () {},
          child: const Text(
            '-',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 23, 34, 47)),
          ),
        ),
      ),
    );
  }

  Widget _calcButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            foregroundColor:
                Theme.of(context).colorScheme.onPrimary, // foreground
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
        onPressed: () {},
        child: const Text(
          'Calculate',
          style: TextStyle(color: Color.fromARGB(255, 251, 255, 219)),
        ),
      ),
    );
  }

  Widget _result() {
    return Container(
      margin: const EdgeInsets.only(top: 36),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result",
            style: TextStyle(fontSize: 18, height: 0.75),
          ),
          Text(
            "123123123123123123123812381838.12",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
