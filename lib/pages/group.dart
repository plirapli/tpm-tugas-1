import 'package:flutter/material.dart';
import 'package:si_bagus/util/groupitem.dart';

class GroupMembers extends StatelessWidget {
  const GroupMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Group Members"),
          backgroundColor: const Color.fromARGB(255, 128, 255, 210),
        ),
        body: Container(
          color: const Color.fromARGB(255, 219, 255, 242),
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 24,
          ),
          child: Column(children: [_heading(), _groupContainer(context)]),
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
              "Our Teams 🧑🏻‍💻",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 47, 39)),
            ),
            Text(
              "Meet our teams.",
              style:
                  TextStyle(fontSize: 16, color: Color.fromARGB(150, 0, 0, 0)),
            ),
          ],
        ));
  }

  Widget _groupContainer(BuildContext context) {
    List<GroupItem> members = [
      GroupItem(
          title: "Muhammad Rafli",
          subtitle: "123210078",
          img: "assets/images/rapli.png"),
      GroupItem(
          title: "Michel Pierce Tahya",
          subtitle: "123210103",
          img: "assets/images/micel.png")
    ];

    return Expanded(
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 4),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _groupMenuItem(context, members[0]),
              const SizedBox(width: 20),
              _groupMenuItem(context, members[1])
            ],
          )),
    );
  }

  Widget _groupMenuItem(BuildContext context, GroupItem member) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(children: [
        Container(
            height: 300,
            // width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                    image: AssetImage(member.img!), fit: BoxFit.cover))),
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
                    member.title!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    member.subtitle!,
                    style: const TextStyle(
                        fontSize: 14, color: Color.fromARGB(150, 0, 0, 0)),
                  ),
                ],
              ),
              IconButton.filled(
                style: IconButton.styleFrom(
                    minimumSize: const Size(40, 40),
                    foregroundColor: const Color.fromARGB(255, 23, 47, 39),
                    backgroundColor: const Color.fromARGB(255, 128, 255, 210),
                    // minimumSize: Size(48, 48),
                    // maximumSize: Size(48, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  // final Uri launchUri = Uri(
                  //   scheme: 'tel',
                  //   path: "085157724721",
                  // );
                  // launchUrl(launchUri);
                },
                icon: const Icon(Icons.phone),
              )
            ],
          ),
        )
      ]),
    );
  }
}
