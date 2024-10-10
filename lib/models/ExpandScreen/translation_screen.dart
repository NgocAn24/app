import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:translator_plus/translator_plus.dart';


class TranslationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  String translated = 'Translation';
  TextEditingController _textEditingController = TextEditingController();

  void translateText(String text) async {
    const apiKey = 'AIzaSyDGYTsgM0VGraBDhpbaBfGB41DnwP-evnM';
    const to = 'en';
    final url =  Uri.parse('https://translate.googleapis.com/language/translate/v2'
        '?q=$text&target=$to&key=$apiKey');
    final response = await http.post(url);
    if (response.statusCode == 200){
      final body = json.decode(response.body);
      final translations = body['data']['translations'] as List;
      final translation = HtmlUnescape().convert(
        translations.first['translatedText'],
      );
      setState(() {
        translated = translation;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dịch Văn Bản'),
      ),
      body:Column(
        children: [
          Expanded(
            child: Card(
              shadowColor: Colors.cyan,
              margin: const EdgeInsets.all(12),
              color: Colors.white,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  SizedBox(height: 8),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Nhập văn bản hoặc một cụm từ để dịch',
                    ),
                    onChanged: (text) {
                      translateText(text);
                    },
                    maxLines: 10,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(12),
              color: Colors.white70,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    translated,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Đổi màu văn bản thành màu đen để dễ đọc
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
