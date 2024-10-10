import 'package:education/constants/icons.dart';
import 'package:flutter/material.dart';

class Truyen1 extends StatefulWidget {
  @override
  _Truyen1State createState() => _Truyen1State();
}

class _Truyen1State extends State<Truyen1> {
  bool isHidden1 = true; // Track the visibility of the first hidden box
  bool isHidden2 = true; // Track the visibility of the second hidden box
  bool isHidden3 = true;
  bool isHidden4 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Story Screen'),
      ),
      body: SingleChildScrollView( // Sử dụng SingleChildScrollView để bọc nội dung
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Con ngựa gọi điện',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(icHorse
              ),
              SizedBox(height: 70),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the visibility of the first hidden box
                    isHidden1 = !isHidden1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'A woman snuck up behind her husband while he was'
                        'enjoying his morning coffee and slapped him on the back of the head.',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !isHidden1,
                child: Container(
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.only(bottom:15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Text(

                        'Một bà vợ đi đến phía sau chồng và vỗ vào sau đầu ông ta'
                            'đang uống cà phê sáng.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Toggle the visibility of the first hidden box when its button is pressed
                            isHidden1 = !isHidden1;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the visibility of the second hidden box
                    isHidden2 = !isHidden2;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '"I found a piece of paper in your trouser pocket with the name Marylou '
                        'written on it,"\n \n she said, furious. "You\'d better have an explanation."'
                        '\n "Calm down, dear," the man replied',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !isHidden2,
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '"Tôi tìm thấy một mảnh giấy trong quần ông ta có cái tên là Mary,"\n \n'
                            'bà ta nói 1 cách giận dữ"Ông nên giải thích ."\n'
                            '"Bình tĩnh nào em yêu." ông ta giải thích',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Toggle the visibility of the second hidden box when its button is pressed
                            isHidden2 = !isHidden2;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                        ),


                      ),

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the visibility of the second hidden box
                    isHidden3 = !isHidden3;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '"Remember last week when I was at the races?'
                        ' That was the name of the horse I backed"',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !isHidden3,
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '"Em có nhớ tuần qua anh xem đua ngựa không?'
                            '\n Đó là tên con ngựa anh đánh cược"',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Toggle the visibility of the second hidden box when its button is pressed
                            isHidden3 = !isHidden3;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                        ),


                      ),

                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    // Toggle the visibility of the second hidden box
                    isHidden4 = !isHidden4;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'The next morning, his wife whacked him again. "What was that for?"'
                        ' he groaned. '
                        '\n "Your horse called last night," she said',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !isHidden4,
                child: Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Sáng hôm sau, bà vợ lại phát mạnh ông ta 1 cái.'
                            '"Tại sao em lại làm thế?" ông ta rên rỉ.'
                            '\n "Con ngựa của ông gọi tối qua," bà ta nói',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // Toggle the visibility of the second hidden box when its button is pressed
                            isHidden4 = !isHidden4;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.zero,
                        ),


                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
