import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostAPI extends StatefulWidget {
  const PostAPI({super.key});

  @override
  State<PostAPI> createState() => _PostAPIState();
}

class _PostAPIState extends State<PostAPI> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passwordCon = TextEditingController();
  var _data;

 dynamic Registration({String? email, password}) async {
    try {
      String url = 'https://reqres.in/api/register';
      http.Response response = await http
          .post(Uri.parse(url), body: {"email": email, "password": password});
      //
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        _data = data;
        debugPrint(data!['token']);
        return _data;
        debugPrint('successfully');
      } else {
        debugPrint('fail');
        return _data;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text(
          'Post API',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    // color: Colors.lightBlue,
                    border: Border.all(width: 2, color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: emailCon,
                  decoration: const InputDecoration(
                    hintText: 'Email...',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    // color: Colors.lightBlue,
                    border: Border.all(width: 2, color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: passwordCon,
                  decoration: const InputDecoration(
                    hintText: 'Password...',
                    hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async {
                 _data = Registration(
                      email: emailCon.text.toString(),
                      password: passwordCon.text.toString());

                },

                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.lightGreen)),
                  child: const Center(
                    child: Text(
                      'Click Registration',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _data == null
                  ? const CircularProgressIndicator(
                color: Colors.lightBlue,
                strokeWidth: 4,
              )
                  : Container(
                height: 56,
                decoration: BoxDecoration(
                  // color: Colors.lightBlue,
                  border: Border.all(width: 2, color: Colors.lightBlue),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('${_data['token']}')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
