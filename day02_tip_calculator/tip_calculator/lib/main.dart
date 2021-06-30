import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  final people = TextEditingController();
  List<bool> _selection = [true, false, false];
  String tip = '';
  String totalBill = '';
  String billEach = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (tip != '')
              Padding(
                padding: EdgeInsets.all(2),
                child: Text(
                  totalBill,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            if (tip != '')
              Text(
                'Tip: $tip',
                style: TextStyle(fontSize: 20),
              ),
            if (billEach != '')
              Text(
                '\$$billEach each',
                style: TextStyle(fontSize: 20),
              ),
            Text('Total Amount'),
            SizedBox(
              width: 80,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '\$100.00'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Text('Split with'),
            ),
            SizedBox(
              width: 80,
              child: TextField(
                controller: people,
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: 'People'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ToggleButtons(
                  children: [Text('10%'), Text('15%'), Text('20%')],
                  isSelected: _selection,
                  onPressed: updateSelection),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    primary: Colors.white,
                    backgroundColor: Colors.green),
                onPressed: calculateTip,
                child: Text('Calculate Tip'))
          ],
        ),
      ),
    ));
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final qtdPeople = double.parse(people.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.1, 0.15, 0.2][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    final total =
        (totalAmount * tipPercentage + totalAmount).toStringAsFixed(2);

    final each = ((totalAmount * tipPercentage + totalAmount) / qtdPeople)
        .toStringAsFixed(2);

    setState(() {
      tip = '\$$tipTotal';
      totalBill = '\$$total';
      billEach = '$each';
    });
  }
}
