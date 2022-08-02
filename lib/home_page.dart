import 'package:colors/pick_color_page.dart';
import 'package:colors/shades_page.dart';
import 'package:flutter/material.dart';
import 'list_item.dart';
import 'shades_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  void navigateToPickColorPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return PickColorPage();
    }));
  }

  void navigateToShadesPageStatic(
      BuildContext context, MaterialAccentColor color) {
    Navigator.of(context).pushNamed('/shades', arguments: color);
  }

  void navigateToShadesPage(BuildContext context, MaterialAccentColor color) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ShadesPage(color: color);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Colors'),
      ),
      body: ListView.builder(
        itemCount: Colors.accents.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              navigateToShadesPageStatic(
                  context, Colors.accents.elementAt(index));
            },
            child: ListItem(color: Colors.accents.elementAt(index)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => navigateToPickColorPage(context),
          child: const Icon(Icons.edit)),
    );
    ;
  }
}
