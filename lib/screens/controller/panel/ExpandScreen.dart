
import 'package:education/constants/icons.dart';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/ExpandScreen/GameScreen.dart';
import '../../../models/ExpandScreen/StoryScreen.dart';
import '../../../models/ExpandScreen/translation_screen.dart';


class ExpandScreen extends StatelessWidget {
  static List<String> items = ['Truyện ngắn', 'Trò chơi', 'Dịch văn bản'];

  // Danh sách màn hình để điều hướng tới cho mỗi mục
  static List<Widget> screens = [
    StoryScreen(),
    GameScreen(),
    TranslationScreen(),
    // Thêm các màn hình khác ở đây nếu cần
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff886ff2),
                    Color(0xff6849ef),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Vừa học vừa chill'
                                '\nCàng học càng fun',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Ứng dụng ngay kiến '
                                'vừa học \nvào đọc và phản xạ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(icStu),
                    ],
                  ),
                ],
              ),
            ),

      const SizedBox(height: 20),
      Expanded(
        child: _buildListView(),
      ),]
        ),
      ),
    );
  }



  Widget _buildListView() {
    return ListView.builder(
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
              color: Color(0xff886ff2), // Màu của mỗi mục
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 50, left: 20, right: 20),
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
            // Điều hướng tới màn hình tương ứng từ danh sách màn hình
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => screens[index],
              ),
            );
          },
        );
      },
    );
  }
}
