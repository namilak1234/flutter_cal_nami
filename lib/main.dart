//IM2021/069-Namith Senanayake
import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';
import 'dart:math';

void main() {
  //main structure
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Modern Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(),
        fontFamily: 'GoogleSans',
      ),
      home: CalculatorHome(),
    );
  }
}

//calculator home screen
class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _input = '';
  String _result = '0';

//Button handling logic
  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _result = '0';
      } else if (buttonText == '←') {
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (buttonText == '√') {
        try {
          if (_input.isNotEmpty) {
            double value = double.parse(_input);
            if (value < 0) {
              _result = 'Invalid input';
            } else {
              _result = sqrt(value).toString();
              _input = _result;
            }
          }
        } catch (e) {
          _result = 'Error';
        }
      } else if (buttonText == '%') {
        try {
          if (_input.isNotEmpty) {
            double value = double.parse(_input);
            _result = (value / 100).toString(); // Calculate percentage
            _input = _result;
          }
        } catch (e) {
          _result = 'Error';
        }
      } else if (buttonText == '=') {
        try {
          if (_input.contains('/0')) {
            if (_input.contains('0/0')) {
              _result = 'Undefined';
            } else {
              _result = 'Cannot divide by zero';
            }
          } else {
            final expression = Expression.parse(_input);
            final evaluator = const ExpressionEvaluator();
            final result = evaluator.eval(expression, {});
            _result = result.toString();
          }
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _input += buttonText;
      }
    });
  }

  @override //Display section
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: _buildDisplay(),
            ),
            _buildButtonSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildDisplay() {
<<<<<<< HEAD
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      alignment: Alignment.bottomRight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1E1E1E),
            Color(0xFF2C2C2C),
=======
    double screenWidth = MediaQuery.of(context).size.width;
    double displayWidth = screenWidth * 0.94;

    return Center(
      child: Container(
        width: displayWidth,
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.tealAccent, // Border color
            width: 2.0,              // Border width
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust height dynamically
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              _input.isEmpty ? '0' : _input,
              style: TextStyle(fontSize: 28.0, color: Colors.tealAccent),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8.0),
            Text(
              _result,
              style: TextStyle(
                fontSize: 36.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
>>>>>>> 4e6816ae3a2a19d2e2b3249597ea512e11d1ad2d
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(
              _input.isEmpty ? '0' : _input,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white70,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            _result,
            style: TextStyle(
              fontSize: 48,
              color: const Color.fromARGB(255, 225, 223, 228),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
  Widget _buildButtonSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _buildButtonRow(['C', '√', '%', '←'], isSpecial: true),
          _buildButtonRow(['7', '8', '9', '*']),
          _buildButtonRow(['4', '5', '6', '-']),
          _buildButtonRow(['1', '2', '3', '+']),
          _buildButtonRow(['.', '0', '=', '/']),
        ],
      ),
=======


  Widget _buildButtonGrid() {
    return Column(
      children: [
        _buildButtonRow(['(', '^', '!', ')'], isRectangle: true),
        _buildButtonRow(['C', '√', '%', '←'], isRectangle: true),
        _buildButtonRow(['7', '8', '9', '*']),
        _buildButtonRow(['4', '5', '6', '-']),
        _buildButtonRow(['1', '2', '3', '+']),
        _buildButtonRow(['.', '0', '=', '/']),
      ],
>>>>>>> 4e6816ae3a2a19d2e2b3249597ea512e11d1ad2d
    );
  }

//Button section
  Widget _buildButtonRow(List<String> buttons, {bool isSpecial = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttons.map((buttonText) {
        return CalculatorButton(
          text: buttonText,
          onTap: () => _onButtonPressed(buttonText),
          isSpecial: isSpecial,
        );
      }).toList(),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSpecial;

  CalculatorButton({
    required this.text,
    required this.onTap,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isOperator = text == '/' || text == '*' || text == '-' || text == '+';
    bool isControl = text == 'C' || text == '←' || text == '%';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSpecial
              ? const Color.fromARGB(255, 244, 188, 19)
              : isOperator
                  ? const Color.fromARGB(255, 244, 188, 19)
                  : const Color.fromARGB(255, 106, 106, 105),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(3, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 28,
              color: isSpecial || isOperator ? Colors.white : Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
