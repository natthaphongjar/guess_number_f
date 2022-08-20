import 'package:flutter/material.dart';
import 'package:guess_number_f/Game.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _Controller = TextEditingController();
  final Game _game = Game();
  var _feedbackText = '';
  var _showTest = false;

  void ClickGuess() {
    setState(() {
      _showTest = !_showTest;
    });
    print('Button click \n${_Controller.text}');
    var guess = int.tryParse(_Controller.text);

    if (guess == null) {
      setState(() {
        _feedbackText = 'Input error plese try again';
      });
      print('Input error');
      _Controller.clear();
    } else {
      var result = _game.doGuess(guess);
      if (result == Result.tooHigh) {
        setState(() {
          _feedbackText = 'Too high';
        });
        print('Too high');
      } else if (result == Result.tooLow) {
        setState(() {
          _feedbackText = 'Too low';
        });
        print('Too low');
      } else {
        setState(() {
          _feedbackText = 'Correct';
        });
        print('Correct');
      }
      _Controller.clear();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.yellow,
        title: const Text('Guess the Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Please enter number 1 and 100'),
            TextField(
              controller: _Controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a number',
              ),
            ),
            ElevatedButton(
              onPressed: ClickGuess,
              child: const Text('GUESS'),
            ),
            Text(_feedbackText),
            Icon(
              _showTest ? Icons.print : Icons.access_time_outlined,
              color: Colors.yellow,
              size: 50.0,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.black,
                primary: _showTest ? Colors.white : Colors.yellow,
              ),
              onPressed: () {},
              child: Text('Test'),
            ),
          ],
        ),
      ),
    );
  }
}
