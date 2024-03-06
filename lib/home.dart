import 'package:flutter/material.dart';
import 'package:si_bagus/login.dart';
import 'package:si_bagus/searchbar.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(
              children: [_heading(context), const SearchBarApp(), _mainmenu()]),
        ),
      ),
    );
  }

  Widget _heading(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, $username  👋🏻",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Lorem ipsum dolor sit amet.",
                  // style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton.filled(
              style: IconButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(66, 124, 124, 124),
                  // minimumSize: Size(48, 48),
                  // maximumSize: Size(48, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6))),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.logout),
            )
          ],
        ));
  }

  Widget _mainmenu() {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 4),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_mainmenuitem(), _mainmenuitem(), _mainmenuitem()],
        ));
  }

  Widget _mainmenuitem() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: () {},
        child: Container(
            // margin: EdgeInsets.only(top: 12),
            padding: EdgeInsets.all(18),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.circular(4.0),
              color: Color.fromARGB(16, 0, 0, 0),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Daftar Kelompok",
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(Icons.group)
                ])),
      ),
    );
  }
}
