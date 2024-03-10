import 'package:flutter/material.dart';
import 'package:si_bagus/pages/login.dart';
import 'package:si_bagus/pages/group.dart';
import 'package:si_bagus/pages/oddeven.dart';
import 'package:si_bagus/pages/sumsub.dart';
import 'package:si_bagus/searchbar.dart';
import 'package:si_bagus/util/mainmenuitem.dart';

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
          child: Column(children: [
            _heading(context),
            const SearchBarApp(),
            _mainmenu(context)
          ]),
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

  Widget _mainmenu(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
          title: "Group Members",
          icon: Icons.group,
          page: const GroupMembers(),
          color: const Color.fromARGB(255, 128, 255, 210)),
      MenuItem(
          title: "Odd or Even",
          icon: Icons.pin,
          page: const OddEvenPage(),
          color: const Color.fromARGB(255, 151, 238, 255)),
      MenuItem(
          title: "Sum & Sub",
          icon: Icons.calculate,
          page: const SumSubPage(),
          color: const Color.fromARGB(255, 255, 247, 140))
    ];

    return Expanded(
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 4),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final item in menuItems)
                _mainmenuitem(
                    context, item.title, item.icon, item.page, item.color)
            ],
          )),
    );
  }

  Widget _mainmenuitem(BuildContext context, String? title, IconData? icon,
      Widget? page, Color? color) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page!),
          );
        },
        child: Container(
            // margin: EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: color!,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title!,
                    style: const TextStyle(fontSize: 18),
                  ),
                  Icon(icon!)
                ])),
      ),
    );
  }
}
