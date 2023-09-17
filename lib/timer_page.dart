import 'dart:async';
import 'quiz_page.dart';
import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Duration _remainingTime =
      const Duration(seconds: 10); 
  bool _timerExpired = false; 

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= Duration(seconds: 1);
        } else {
          timer.cancel();
          _timerExpired = true; // Set timerExpired to true when the timer ends
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF6C4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png'),
            const SizedBox(height: 20),
            const Text(
              'SHAURYA',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xFFF18403),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Excellence through competition\nCompete to win rewards and recognition',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4D3E29),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'Quiz begins in',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4D3E29),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _timerExpired
                ? ElevatedButton(
                    onPressed: () {
                      // Navigate to the QuizPage when the "Start Quiz" button is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const QuizPage(), // Replace with your QuizPage widget
                        ),
                      );
                    },
                    child: const Text("Start Quiz"),
                  )
                : Text(
                    _formatDuration(_remainingTime),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4D3E29),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
