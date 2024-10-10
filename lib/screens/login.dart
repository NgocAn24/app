import 'package:education/constants/icons.dart';
import 'package:education/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


import 'forgot.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> signIn() async {
    try {
      // Đăng nhập với email và mật khẩu
      await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // Xử lý đăng nhập thành công, ví dụ chuyển sang trang chính
      print("Đăng nhập thành công!");
      Get.snackbar(
        "Thành công",
        "Đăng nhập thành công!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'Không tìm thấy người dùng với email này.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Sai mật khẩu.';
      } else {
        errorMessage = ' Vui lòng điền đầy đủ thông tin}';
      }
      // Hiển thị thông báo lỗi bằng Snackbar
      Get.snackbar(
        "Lỗi đăng nhập",
        errorMessage,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 2.9,
                child: Image.asset(iclogin),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFedf0f8),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        hintText: 'Nhập email',
                        prefixIcon: Icon(Icons.email,color: Colors.black45,),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: password,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0xFFedf0f8),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2,color: Colors.blue),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        hintText: 'Nhập mật khẩu',
                        prefixIcon: Icon(Icons.lock,color: Colors.black45),
                      ),
                      obscureText: true, // Ẩn mật khẩu
                    ),
                    SizedBox(height: 5),
                    GestureDetector(

                      onTap: () {
                        Get.to(() => Forgot());
                      },

                      child: Padding(
                          padding: EdgeInsets.all(10),
                        child: Container(
                        alignment: Alignment.centerRight,
                          child: Text(
                            "Quên mật khẩu?",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent) ,
                          ),
                      ) ,)
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // Màu nền của nút
                      ),
                      onPressed: signIn,
                      child: Padding(padding: EdgeInsets.all(0),
                        child: Container(




                        alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.white
                            ),

                          ),
                      ),),
                    ),
                    SizedBox(height: 20),


                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Chưa có tài khoản?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                        ),),

                        GestureDetector(
                          onTap: () {
                            Get.to(() => Signup());
                          },
                          child: Text(
                            " Đăng ký",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black,),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
