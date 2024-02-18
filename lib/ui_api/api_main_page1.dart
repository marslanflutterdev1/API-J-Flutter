import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handle_api/api_model/studentAPIModel1.dart';

class APIMainPage1 extends StatelessWidget {
  const APIMainPage1({super.key});

  Future<studentModel?> loadAsset() async {
    var loadAssetJson =
        await rootBundle.loadString("json_api/student_api.json");
    Map<String, dynamic> jsonDecoder = await json.decode(loadAssetJson);
    studentModel sd = studentModel.fromJson(jsonDecoder);
    return sd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'API WORKING',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: loadAsset(),
          builder:
              (BuildContext context, AsyncSnapshot<studentModel?> snapshot) {
            if (!snapshot.hasData) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Please! await await',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  CircularProgressIndicator(strokeWidth: 4,color: Colors.pink,)
                ],
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting ) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Please! await data in loading form',
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  CircularProgressIndicator(strokeWidth: 4,color: Colors.pink,)
                ],
              );
            }
            return Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.pink),
                      ),
                      child: Center(
                        child: Text(
                          'Name: ${snapshot.data!.name}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.pink),
                      ),
                      child: Center(
                        child: Text(
                          'RollNo: ${snapshot.data!.rollNo}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.pink),
                      ),
                      child: Center(
                        child: Text(
                          'Semester: ${snapshot.data!.semester}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: Colors.pink),
                      ),
                      child: Center(
                        child: Text(
                          'Degree: ${snapshot.data!.degree}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
