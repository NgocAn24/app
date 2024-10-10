import 'package:education/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:education/widgets/circle_button.dart';
import 'package:education/models/api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  bool inProgress = false;
  ResponseModel? responseModel;
  String noDataText = "Welcome , Start searching";
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
                      Row(
                        children: [
                          Text(
                          'Từ điển \n thực hành',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        ],
                      ),

                      CircleButton(
                        icon: Icons.notifications,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  _buildSearchWidget(),
                ],
              ),
            ),

            const SizedBox(height: 12),
            if (inProgress)
              const LinearProgressIndicator()
            else if (responseModel != null)
              Expanded(child: _buildResponseWidget())
            else
              _noDataWidget(),
          ],
        ),
      ),
    );
  }



  _buildSearchWidget(){
    return SearchBar(
      hintText: "Vocabulary",
      onSubmitted: (value){
        _getMeaningFromApi(value);
      },
    );
  }

  _getMeaningFromApi(String word) async {
    setState(() {
      inProgress = true;
    });
    try {
      responseModel = await API.fetchMeaning(word);
      setState(() {});
    } catch (e) {
      responseModel = null;
      noDataText = "Meaning cannot be fetched";
    }finally{
      setState(() {
        inProgress = false;
      });
    }
  }

  _buildResponseWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        Text(
          responseModel!.word!,
          style: TextStyle(
            color: Colors.purple.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(responseModel!.phonetic ?? ""),
        const SizedBox(height: 16),
        Expanded(
            child: ListView.builder(
              itemBuilder: (context, index){
                return _buildMeaningWidget(responseModel!.meanings![index]);
              },
              itemCount: responseModel!.meanings!.length,
            )
        )],
    );
  }

  _noDataWidget() {
    return SizedBox(
      height: 100,
      child: Center(
        child: Text(
          noDataText,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  _buildMeaningWidget( Meanings meanings){
    String definitionList ="";
    meanings.definitions?.forEach(
            (element) {
          int index = meanings.definitions!.indexOf(element);
          definitionList += "\n${index + 1}. ${element.definition}\n";
        });
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meanings.partOfSpeech!,
              style: TextStyle(
                color: Colors.orange.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Định nghĩa : ",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(definitionList),
            _buildSet("Từ đồng nghĩa", meanings.synonyms),
            _buildSet("Từ trái nghĩa", meanings.antonyms),


          ],
        ),
      ),
    );
  }

  _buildSet(String title , List<String>? setList) {
    if (setList?.isNotEmpty ?? false) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$title : ",
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(setList!
              .toSet()
              .toString()
              .replaceAll("{", "")
              .replaceAll("}", "")
          ), const SizedBox(height: 10),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }


}
