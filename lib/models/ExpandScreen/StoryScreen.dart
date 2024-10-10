
import 'package:education/models/ExpandScreen/truyen/truyen.dart';
import 'package:education/models/ExpandScreen/truyen/truyen1.dart';
import 'package:education/models/ExpandScreen/truyen/truyen2.dart';
import 'package:flutter/material.dart';


class StoryScreen extends StatelessWidget {
  static List<String> items = ['Bức tranh của họa sĩ','Lãng mạn','Con ngựa gọi điện',];

  // List of screens to navigate to for each item
  static List<Widget> screens = [
    Truyen2(),
    Truyen(),
    Truyen1(),
    // Add other screens here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Truyện'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: Color(0xff886ff2), // Color of each item
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30, top: 30, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      items[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              // Navigate to the corresponding screen from the screens list
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => screens[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
