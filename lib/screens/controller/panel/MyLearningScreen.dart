import 'package:education/models/lesson.dart';

import 'package:flutter/material.dart';

class MyLearningScreen extends StatefulWidget {
  static List<String> items = ['Unit 1', 'Unit 2','Unit 3'];
  @override
  State<MyLearningScreen> createState() => _MyLearningScreenState();
}

class _MyLearningScreenState extends State<MyLearningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff6849ef),
        title: Text('Bài học'),
        titleTextStyle:Theme.of(context).textTheme.titleLarge,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: units.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color(0xff886ff2), // Màu của mỗi mục
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      units[index].title,
                      style: TextStyle(color: Colors.white),
                    ),

                  ],
                ),
              ),
            ),

            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UnitDetailScreen(unit: units[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}