import 'package:education/constants/icons.dart';
import 'package:flutter/material.dart';

class Unit {
  final String title;

  final Widget customWidget;

  const Unit(this.customWidget,this.title);
}
class UnitDetailScreen extends StatefulWidget  {
  final Unit unit;

  const UnitDetailScreen({Key? key, required this.unit}) : super(key: key);

  @override
  State<UnitDetailScreen> createState() => _UnitDetailScreenState();
}

class _UnitDetailScreenState extends State<UnitDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.unit.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.unit.customWidget,
      ),
    );
  }


}




final List<Unit> units = [
  Unit(
    Container(
      child: PageView.builder(
        itemCount: 6, // Số lượng thẻ bạn muốn hiển thị
        itemBuilder: (context, index) {
          return Card(

            elevation: 5,
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            margin: EdgeInsets.only(
                left: 12, right: 12, bottom: 50, top: 40),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(0),
                  child: Image.asset(
                    _getImagePath(index), // Thay đổi tên hình ảnh tại đây
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
    'Unit 1',
  ),
  Unit(
    Container(
      child: PageView.builder(
        itemCount: 6, // Số lượng thẻ bạn muốn hiển thị
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.only(
                left: 12, right: 12, bottom: 35, top: 40),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(0),
                  child: Image.asset(
                    _getImagePath2(index), // Thay đổi tên hình ảnh tại đây
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
    'Unit 2',
  ),
  Unit(
    Container(
      child: PageView.builder(
        itemCount: 6, // Số lượng thẻ bạn muốn hiển thị
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.only(
                left: 12, right: 12, bottom: 35, top: 40),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(0),
                  child: Image.asset(
                    _getImagePath2(index), // Thay đổi tên hình ảnh tại đây
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
    'Unit 3',
  ),
  Unit(
    Container(
      child: PageView.builder(
        itemCount: 6, // Số lượng thẻ bạn muốn hiển thị
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.only(
                left: 12, right: 12, bottom: 35, top: 40),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(0),
                  child: Image.asset(
                    _getImagePath2(index), // Thay đổi tên hình ảnh tại đây
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
    'Unit 4',
  ),

  Unit(
    Container(
      child: PageView.builder(
        itemCount: 6, // Số lượng thẻ bạn muốn hiển thị
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.only(
                left: 12, right: 12, bottom: 35, top: 40),
            child: Column(
              children: [

                Padding(
                  padding: EdgeInsets.all(0),
                  child: Image.asset(
                    _getImagePath2(index), // Thay đổi tên hình ảnh tại đây
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
    'Unit 5',
  ),



  // Thêm các unit khác nếu cần
];

String _getImagePath(int index) {
  // Thay đổi logic để trả về tên hình ảnh tương ứng với index
  // Ví dụ: return 'assets/icons/image_$index.png';
  switch (index) {
    case 0:
      return a1;
    case 1:
      return a2;
    case 2:
      return a3;
    case 3:
      return a4;
    case 4:
      return a5;
    case 5:
      return a6;
    default:
      return ''; // Trả về tên hình ảnh mặc định hoặc rỗng
  }
}
String _getImagePath2(int index) {
  // Thay đổi logic để trả về tên hình ảnh tương ứng với index
  // Ví dụ: return 'assets/icons/image_$index.png';
  switch (index) {
    case 0:
      return b1;
    case 1:
      return b2;
    case 2:
      return b3;
    case 3:
      return b4;
    case 4:
      return b5;
    case 5:
      return b6;
    default:
      return ''; // Trả về tên hình ảnh mặc định hoặc rỗng
  }
}
