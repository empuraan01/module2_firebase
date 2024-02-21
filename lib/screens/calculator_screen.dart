import 'package:flutter/material.dart';

import "package:function_tree/function_tree.dart";

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.black,
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _output = '0';
  double _resultFontSize = 48.0;
  double _expressionFontSize = 24.0;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _output = '0';
      } else if (buttonText == '=') {
        _output = _input.interpret().toString();
      } else {
        _input += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _input,
                style: TextStyle(fontSize: _expressionFontSize),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _output,
                style: TextStyle(
                    fontSize: _resultFontSize, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          _buildButtonRow(['7', '8', '9', '/']),
          _buildButtonRow(['4', '5', '6', '*']),
          _buildButtonRow(['1', '2', '3', '-']),
          _buildButtonRow(['C', '0', '=', '+']),
        ],
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.map((buttonText) {
          return _buildButton(buttonText);
        }).toList(),
      ),
    );
  }

  Widget _buildButton(String buttonText) {
    return Expanded(
      child: InkWell(
        onTap: () => _onButtonPressed(buttonText),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          margin: EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
