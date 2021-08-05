import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final amount = TextEditingController();

  List<bool> _selection = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total Amount'),
              SizedBox(
                width: 100.00,
                child: TextField(
                  controller: amount,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(hintText: '\$100.00'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: ToggleButtons(
                  children: [Text('10%'), Text('15%'), Text('20%')],
                  isSelected: _selection,
                  onPressed: updateSelection,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Calculate Tip'),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selectionIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectionIndex == i;
      }
    });
  }
}
