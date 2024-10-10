import 'package:education/constants/icons.dart';
import 'package:flutter/material.dart';

class Truyen2 extends StatefulWidget {
  @override
  _Truyen2State createState() => _Truyen2State();
}

class _Truyen2State extends State<Truyen2> {
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
                  'Bức tranh của họa sĩ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(icPahm
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
                    'Artist :"That, sir, is a painting of a cow grazing grass"'
                        '\nVisitor :"Where is the grass?'
                        '\nArtist :"The cow has eaten it',
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
                        'Họa sĩ : Bức tranh đó đang vẽ 1 con bò đang ăn cỏ đấy thưa ông.'
                            '\nKhách : Có thấy cỏ đâu ?'
                            '\nHọa sĩ : con bò ăn hết cỏ rồi',
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
                    'Vistor : "But where is the cow ?"'
                        '\nArtist : " You don\'t think it would be fool enough to stay there after'
                        'it had eaten all the grass, do you ?"',
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
                        'Khách :Thế còn con bò đâu ?'
                            '\nHọa sĩ : Chứ bộ ông tưởng con bò lại ngu đến mức đứng ỳ đó sau khi'
                            'đã ăn hết cỏ sao ông!',
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
            ],
          ),
        ),
      ),
    );
  }
}
