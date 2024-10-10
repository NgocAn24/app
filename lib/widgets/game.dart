

import 'package:flutter/material.dart';

import '../models/ExpandScreen/GameScreen.dart';
// Import trang GameScreen để restart trò chơi

class ResultScreen extends StatelessWidget {
  final int correctAnswers;

  ResultScreen({required this.correctAnswers});

  void restartQuiz(BuildContext context) {
    // Navigate back to GameScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulations!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Bạn đã ôn tập được $correctAnswers câu hỏi hôm nay.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                restartQuiz(context); // Gọi hàm restartQuiz
              },
              child: Text('Play Again'),
            ),
          ],
        ),
      ),
    );
  }
}
