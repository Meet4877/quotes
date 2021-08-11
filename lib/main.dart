import 'package:flutter/material.dart';

import 'package:flutter/services.dart' as rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quotes/quot.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: quotes1(),
    );
  }
}

class quotes1 extends StatefulWidget {
  const quotes1({Key? key}) : super(key: key);

  @override
  _quotes1State createState() => _quotes1State();
}

class _quotes1State extends State<quotes1> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // fetchdata();
    print("2nd");
  }

  var url = Uri.parse(
      "https://raw.githubusercontent.com/skolakoda/programming-quotes-api/master/backup/quotes.json");
  // late quot Quots;
  //
  get data => null;

  // fetchdata() async {
  //   var res = await http.get(url);
  //   var decodedJson = jsonDecode(res.body);
  //
  //   Quots = quot.fromJson(decodedJson);
  //
  //   print(res);
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes with api"),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<quot>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                          ),
                          Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(
                                        items[index].en.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Text(items[index].en.toString()),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
Future<List<quot>> ReadJsonData() async {
  //read json file
  final jsondata =
      await rootBundle.rootBundle.loadString('assets/quotees.json');
  //decode json data as list
  final list = json.decode(jsondata) as List<dynamic>;

  //map json and initialize using DataModel
  return list.map((e) => quot.fromJson(e)).toList();
}
