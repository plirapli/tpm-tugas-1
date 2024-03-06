import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(children: [
            _heading(),
            _mainmenu(),
            // _passwordField(),
            // _loginButton(context),
            // _registerButton(context)
          ]),
        ),
      ),
    );
  }

  Widget _heading() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Rafli  👋🏻",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lorem ipsum dolor sit amet.",
                  // style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton.filled(
              style: IconButton.styleFrom(
                  minimumSize: Size(48, 48),
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromARGB(66, 124, 124, 124),
                  // minimumSize: Size(48, 48),
                  // maximumSize: Size(48, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              onPressed: () {},
              icon: const Icon(Icons.logout),
            )
          ],
        ));
  }

  Widget _mainmenu() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Rafli  👋🏻",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lorem ipsum dolor sit amet.",
                  // style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton.filled(
              style: IconButton.styleFrom(
                  minimumSize: Size(48, 48),
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromARGB(66, 124, 124, 124),
                  // minimumSize: Size(48, 48),
                  // maximumSize: Size(48, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              onPressed: () {},
              icon: const Icon(Icons.logout),
            )
          ],
        ));
  }
}
