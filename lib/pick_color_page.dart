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

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => {
                    Navigator.of(context).pop(),
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              content: Row(
                                children: [
                                  const Text('You have picked '),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentRGBValue),
                                  )
                                ],
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Okay'),
                                  child: const Text('Okay'),
                                ),
                              ],
                            ))
                  }),
        ],
      ),
    );
    ;
  }
}
