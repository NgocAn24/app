import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quên mật khẩu"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 15),
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
            SizedBox(height: 30),
            ElevatedButton(onPressed: (()=>reset()), child: Text("Xác nhận"))

          ],
        ),
      ),

    );
  }
}
