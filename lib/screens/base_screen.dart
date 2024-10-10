import 'package:education/screens/controller/routes.dart';
import 'package:flutter/material.dart';
class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // Sử dụng routes để lấy widget tương ứng với route được chọn
        child: Routes.getRoutes(context)[
          '/${_selectedIndex == 0 ?
          'home' : _selectedIndex == 1 ?
          'my_learning' : _selectedIndex == 2 ?
          'expand' : _selectedIndex == 3 ?
          'settings'  : 'default'}']!(context),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Từ điển',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'My Learning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.expand_more),
            label: 'Mở rộng',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Tài khoản',
          ),

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
