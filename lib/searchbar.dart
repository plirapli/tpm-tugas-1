import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        // padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            enabled: true,
            // onChanged: (tes) {},
            decoration: InputDecoration(
                hintText: 'Search your menu',
                prefixIcon: const Icon(Icons.search, color: Colors.black87),
                filled: true,
                fillColor: const Color.fromARGB(0, 0, 0, 0),
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(width: 100)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.75, color: Color.fromARGB(80, 0, 0, 0))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.75, color: Color.fromARGB(80, 0, 0, 0))))));
    //   ), suggestionsBuilder:
    //           (BuildContext context, SearchController controller) {
    //     return List<ListTile>.generate(5, (int index) {
    //       final String item = 'item $index';
    //       return ListTile(
    //         title: Text(item),
    //         onTap: () {
    //           setState(() {
    //             controller.closeView(item);
    //           });
    //         },
    //       );
    //     });
    //   }),
    // );
  }
}
