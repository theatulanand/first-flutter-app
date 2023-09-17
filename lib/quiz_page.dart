import 'dart:async';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _remainingTime = 7200;
  late ValueNotifier<int> _timerNotifier;
  int _currentIndex = 0;
  int _selectedOptionIndex = -1;
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "What is question 1?",
      "options": ["OPTION 1", "OPTION 2", "OPTION 3", "OPTION 4"],
    },
    {
      "question": "What is question 2?",
      "options": ["OPTION 1", "OPTION 2", "OPTION 3", "OPTION 4"],
    },
    {
      "question": "What is question 3?",
      "options": ["OPTION 1", "OPTION 2", "OPTION 3", "OPTION 4"],
    },
    {
      "question": "What is question 4?",
      "options": ["OPTION 1", "OPTION 2", "OPTION 3", "OPTION 4"],
    },
    {
      "question": "What is question 5?",
      "options": ["OPTION 1", "OPTION 2", "OPTION 3", "OPTION 4"],
    }
  ];

  @override
  void initState() {
    super.initState();
    _timerNotifier = ValueNotifier<int>(_remainingTime);
    _startTimer();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
          _timerNotifier.value = _remainingTime;
        });
      } else {
        timer.cancel();

        // write logic to submit quiz
        _showQuizSubmittedDialog(context);
      }
    });
  }

  String _formatTime(int timeInSeconds) {
    final hours = (timeInSeconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((timeInSeconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (timeInSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOptionIndex = -1;
      });
    } else {
      setState(() {
      });
      _showQuizSubmittedDialog(context);
    }
  }

  void _showQuizSubmittedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 150,
          ),
          content: const Text(
            "You have completed the quiz\nResults will be published on\nxx - xx - xxxx",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set the desired color
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // You can add any additional actions here if needed.
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIndex + 1) / _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'SHAURYA QUIZ',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        backgroundColor: const Color(0xFFFFC177),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ValueListenableBuilder<int>(
            valueListenable: _timerNotifier,
            builder: (context, remainingTime, _) {
              return Container(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.timer,
                      size: 24,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 16),
                    Text(
                      _formatTime(remainingTime),
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              width: 275.0,
              height: 12.0,
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFFF9A22)),
                minHeight: 12.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                _questions[_currentIndex]["question"],
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(
                _questions[_currentIndex]["options"].length,
                (index) {
                  final option = _questions[_currentIndex]["options"][index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedOptionIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF808080),
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                          color: _selectedOptionIndex == index
                              ? Colors.green
                              : Colors.white,
                        ),
                        width: 350,
                        height: 37,
                        child: Center(
                          child: Text(
                            option,
                            style: TextStyle(
                              color: _selectedOptionIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: _nextQuestion,
                child: Text(
                  _currentIndex < _questions.length - 1 ? "Next" : "Finish",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timerNotifier.dispose();
    super.dispose();
  }
}
