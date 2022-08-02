import 'package:colors/list_item.dart';
import 'package:flutter/material.dart';

class ShadesPage extends StatelessWidget {
  final MaterialAccentColor color;

  ShadesPage({required this.color});

  @override
  Widget build(BuildContext context) {
    final List<Color> accentShades = [
      color.shade100,
      color.shade200,
      color.shade400,
      color.shade700
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        centerTitle: true,
        title: const Text('Shades'),
      ),
      body: ListView.builder(
        itemCount: accentShades.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(color: accentShades[index]);
        },
      ),
    );
  }
}
