
import 'package:education/constants/icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
  }

class _SettingsState extends State<Settings>{

  final user=FirebaseAuth.instance.currentUser;

  signout()async{
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xff6849ef),
        title: Text('Tài khoản'),
        titleTextStyle:Theme.of(context).textTheme.titleLarge,
          centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              /// -- IMAGE
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(image: AssetImage(icuser)), // Đường dẫn ảnh
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(

                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('${user!.email}', style: Theme.of(context).textTheme.headlineMedium),
              Text('Học viên', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() =>()), // Điều hướng đến màn hình cập nhật hồ sơ
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff6849ef),
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Chỉnh sửa hồ sơ', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              ProfileMenuWidget(title: "Cài đặt", icon: Icons.settings, onPress: () {}),
              ProfileMenuWidget(title: "Chi tiết Thanh toán", icon: Icons.account_balance_wallet, onPress: () {}),
              ProfileMenuWidget(title: "Quản lý Người dùng", icon: Icons.group, onPress: () {}),
              const Divider(),
              const SizedBox(height: 10),
              ProfileMenuWidget(title: "Thông tin", icon: Icons.info, onPress: () {}),
              ProfileMenuWidget(title: "Đăng xuất", icon: Icons.logout, onPress:  ()=>signout(),),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPress;
  final Color? textColor;
  final bool endIcon;

  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor,
    this.endIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onPress(),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      leading: Icon(icon, color: textColor ?? Colors.black),
      title: Text(title, style: TextStyle(color: textColor ?? Colors.black)),
      trailing: endIcon ? Icon(Icons.arrow_forward_ios, color: Colors.black) : null,
    );
  }
}

