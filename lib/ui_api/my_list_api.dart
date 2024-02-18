import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handle_api/api_model/myApiModel.dart';

class MyApiUi extends StatelessWidget {
  const MyApiUi({super.key});

  Future<MYAPIMODEL?> loadApiFromAsset() async {
    var loadDataFromAsset = await rootBundle.loadString("json_api/myapi.json");
    var convertJsonToDart = await json.decode(loadDataFromAsset);
    MYAPIMODEL mpm = MYAPIMODEL.MyJson(convertJsonToDart);
    return mpm;
  }

  @override
  Widget build(BuildContext context) {
    loadApiFromAsset();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                        'Subject 5th Semester',
                        style:  TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: loadApiFromAsset(),
        builder: ((BuildContext context, AsyncSnapshot<MYAPIMODEL?> snapshot) {
          return Column(
            children: [
              ...List.generate(snapshot.data!.sub.length, (index) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        border: Border.all(width: 3, color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                          child: Text(
                        '${snapshot.data!.sub[index]}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                  ),
                );
              })
            ],
          );
        }),
      ),
    );
  }
}
