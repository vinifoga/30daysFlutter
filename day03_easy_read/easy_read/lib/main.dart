import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyState();
}

class _MyState extends State<MyApp> {
  double _fontSize = 40;
  List<bool> _selection = [true, false];
  Color color = Colors.white;
  Color textColor = Colors.black;
  Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: color,
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: textColor,
                    ),
                    maxLines: null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Slider(
                          value: _fontSize,
                          onChanged: (newSize) {
                            setState(() => _fontSize = newSize);
                          },
                          min: 30,
                          max: 200,
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: ToggleButtons(
                          children: [
                            Icon(Icons.light_mode),
                            Icon(Icons.dark_mode)
                          ],
                          isSelected: _selection,
                          onPressed: updateSelection,
                          color: iconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
      if (selectedIndex == 1) {
        color = Colors.black;
        textColor = Colors.white;
        iconColor = Colors.white;
      } else if (selectedIndex == 0) {
        color = Colors.white;
        textColor = Colors.black;
        iconColor = Colors.black;
      }
    });
  }
}
