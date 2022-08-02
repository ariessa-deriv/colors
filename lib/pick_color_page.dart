import 'package:flutter/material.dart';

class PickColorPage extends StatefulWidget {
  const PickColorPage({Key? key}) : super(key: key);

  @override
  State<PickColorPage> createState() => _PickColorPageState();
}

class _PickColorPageState extends State<PickColorPage> {
  double currentRedValue = 0;
  double currentGreenValue = 0;
  double currentBlueValue = 0;
  Color currentRGBValue = const Color.fromRGBO(0, 0, 0, 1);
  int currentSavedIndex = 0;

  List<Color> savedColors =
      List.filled(8, const Color.fromRGBO(255, 255, 255, 0));

  void saveColorToSwatch(Color colorToSave) {
    // Check if color swatch is full or not
    if (currentSavedIndex > 7) {
      setState(() {
        print(currentSavedIndex);
        currentSavedIndex = 0;
        savedColors[currentSavedIndex] = colorToSave;
      });
    }
    // Check the current index of color swatch
    else {
      if (currentSavedIndex == 0) {
        setState(() {
          savedColors[currentSavedIndex] = colorToSave;
          currentSavedIndex += 1;
        });
      } else {
        setState(() {
          savedColors[currentSavedIndex] = colorToSave;
          currentSavedIndex += 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int indexToSaveColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your color'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Slider(
              value: currentRedValue,
              max: 255,
              onChanged: (double value) {
                setState(() {
                  currentRedValue = value;
                  currentRGBValue = Color.fromRGBO(currentRedValue.toInt(),
                      currentGreenValue.toInt(), currentBlueValue.toInt(), 1);
                });
              }),
          Slider(
              value: currentGreenValue,
              max: 255,
              onChanged: (double value) {
                setState(() {
                  currentGreenValue = value;
                  currentRGBValue = Color.fromRGBO(currentRedValue.toInt(),
                      currentGreenValue.toInt(), currentBlueValue.toInt(), 1);
                });
              }),
          Slider(
              value: currentBlueValue,
              max: 255,
              onChanged: (double value) {
                setState(() {
                  currentBlueValue = value;
                  currentRGBValue = Color.fromRGBO(currentRedValue.toInt(),
                      currentGreenValue.toInt(), currentBlueValue.toInt(), 1);
                });
              }),
          const SizedBox(height: 50),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 8,
              children: List.generate(savedColors.length, (index) {
                return Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: savedColors[index],
                      shape: BoxShape.rectangle,
                      border: Border.all(width: 2, color: Colors.grey)),
                );
              }),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            'Selected color',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey.shade700),
          ),
          const SizedBox(height: 40),
          Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: currentRGBValue),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
              child: const Text('Select this color'),
              onPressed: () => {saveColorToSwatch(currentRGBValue)}),
        ],
      ),
    );
    ;
  }
}
