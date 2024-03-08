import 'package:flutter/material.dart';
// import 'package:si_bagus/util/groupitem.dart';

class GroupMembers extends StatelessWidget {
  const GroupMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Group Members"),
          backgroundColor: Color.fromARGB(255, 128, 255, 210),
        ),
        body: Container(
          color: Color.fromARGB(255, 219, 255, 242),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(children: [_heading(), _groupContainer()]),
        ),
      ),
    );
  }

  Widget _heading() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Teams 🧑🏻‍💻",
              style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 47, 39)),
            ),
            const Text(
              "Meet our teams.",
              style:
                  TextStyle(fontSize: 16, color: Color.fromARGB(150, 0, 0, 0)),
            ),
          ],
        ));
  }

  Widget _groupContainer() {
    // List<GroupItem> menuItems = [
    //   GroupItem(
    //       title: "",
    //       icon: Icons.group,
    //       page: const GroupMembers(),
    //       color: const Color.fromARGB(255, 128, 255, 210)),
    //   MenuItem(
    //       title: "Odd or Even",
    //       icon: Icons.pin,
    //       page: const GroupMembers(),
    //       color: Color.fromARGB(255, 151, 238, 255)),
    //   MenuItem(
    //       title: "Sum & Sub",
    //       icon: Icons.calculate,
    //       page: const GroupMembers(),
    //       color: Color.fromARGB(255, 255, 247, 140))
    // ];

    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 4),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_groupMenuItem()],
        ));
  }

  Widget _groupMenuItem() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Container(
          child: Column(children: [
        Container(
            height: 320,
            margin: EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                    image: AssetImage('assets/images/rapli.jpg'),
                    fit: BoxFit.cover))),
        Container(
          alignment: Alignment.centerLeft,
          // decoration: BoxDecoration(color: Colors.amber),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Muhammad Rafli",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: Text(
                      "123210078",
                      style: TextStyle(
                          fontSize: 18, color: Color.fromARGB(150, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(
                    minimumSize: const Size(48, 48),
                    foregroundColor: Color.fromARGB(255, 23, 47, 39),
                    backgroundColor: const Color.fromARGB(255, 128, 255, 210),
                    // minimumSize: Size(48, 48),
                    // maximumSize: Size(48, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6))),
                onPressed: () {},
                icon: const Icon(Icons.phone),
              )
            ],
          ),
        )
      ])),
    );
  }
}
