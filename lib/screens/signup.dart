import 'package:education/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  signUp() async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
    Get.offAll(Wrapper());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Đăng kí"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20),
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
            ),SizedBox(height: 55),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Màu nền của nút
                ),


                onPressed: (()=>signUp()),
              child: Padding(padding: EdgeInsets.all(0),
                child: Container(

                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Text(
                    "Đăng kí",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white
                    ),

                  ),
                ),),),
          ],
        ),
      ),

    );
  }
}
