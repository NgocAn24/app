import 'dart:convert';
import 'package:education/widgets/game.dart';
import 'package:flutter/material.dart';
import 'package:education/models/questions.dart';



class GameScreen extends StatefulWidget {


  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Questions> questionsList = [];
  int currentQuestionIndex = 0;
  bool showCorrectAnswer = false;
  bool quizCompleted = false;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadQuestions() async {
    // Load questions from JSON file
    String data = await DefaultAssetBundle.of(context).loadString('assets/data/question.json');
    List<dynamic> jsonData = json.decode(data);
    setState(() {
      questionsList = jsonData.map((e) => questionsFromJson(jsonEncode(e))).toList();
      // Shuffle questions
      questionsList.shuffle();
      // Start timer

    });
  }

  void checkAnswer(int selectedIndex) {
    setState(() {
      showCorrectAnswer = true;
      if (questionsList[currentQuestionIndex].correctAnswerIndex == selectedIndex) {
        print('Correct!');
      } else {
        print('Wrong!');
      }
    });
  }

  void nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questionsList.length - 1) {
        currentQuestionIndex++;
        showCorrectAnswer = false; // Reset showCorrectAnswer
        // Reset time for next question
      } else {
        // Quiz ends
        quizCompleted = true;
        // Navigate to result screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResultScreen(correctAnswers: calculateCorrectAnswers())),
        );
      }
    });
  }

  int calculateCorrectAnswers() {
    int correctCount = 0;
    if (questionsList.isNotEmpty) { // Kiểm tra xem danh sách có phần tử không
      for (var question in questionsList) {
        if (question.correctAnswerIndex == question.correctAnswerIndex) {
          correctCount++;
        }
      }
    }
    return correctCount;
  }


  List<Color> buttonColors = [
    Colors.redAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Quiz'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              questionsList.isEmpty ? 'Loading...' : questionsList[currentQuestionIndex].question,
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),

            SizedBox(height: 90.0),
          GridView.count(
            crossAxisCount: 2, // Số cột trong grid
            crossAxisSpacing: 10, // Khoảng cách giữa các cột
            mainAxisSpacing: 10, // Khoảng cách giữa các hàng
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Ngăn scroll view chứa grid
            children: List.generate(
              questionsList[currentQuestionIndex].answers.length,
                  (index) {
                String answer = questionsList[currentQuestionIndex].answers[index];
                return Container(

                  child: ElevatedButton(
                    onPressed: () {
                      if (!showCorrectAnswer) {
                        checkAnswer(index);
                      }
                    },
                    child: Text(
                      answer,
                      style: TextStyle(
                        fontSize: 17, // Kích thước của văn bản
                        color: Colors.white, // Màu của văn bản

                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), backgroundColor: showCorrectAnswer &&
                          index == questionsList[currentQuestionIndex].correctAnswerIndex
                          ? Colors.green
                          : showCorrectAnswer &&
                          index != questionsList[currentQuestionIndex].correctAnswerIndex
                          ? Colors.white
                          : buttonColors[index % buttonColors.length],
                      padding: EdgeInsets.all(10), // Khoảng cách giữa văn bản và viền của nút là 5 pixel
                    ),
                  )

                );
              },
            ),
          ),

            SizedBox(height: 20.0),
            if (showCorrectAnswer || currentQuestionIndex == questionsList.length - 1)
              ElevatedButton(
                onPressed: quizCompleted ? null : nextQuestion,
                child: Text(quizCompleted ? 'Finish' : 'Next'),
              ),
          ],
        ),

      ),
    );
  }
}
