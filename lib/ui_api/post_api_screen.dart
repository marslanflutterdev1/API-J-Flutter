import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:handle_api/api_model/post_upload_api_model.dart';
import 'package:http/http.dart' as http;

class PostAPIScreen extends StatefulWidget {
  const PostAPIScreen({super.key});

  @override
  State<PostAPIScreen> createState() => _PostAPIScreenState();
}

class _PostAPIScreenState extends State<PostAPIScreen> {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  PostUploadAPIModel? _pm;

  Future<PostUploadAPIModel> postUploadAPI(String name, job) async {
    String url = 'https://reqres.in/api/users';
    PostUploadAPIModel? postmodel;

    http.Response response = await http.post(
      Uri.parse(url),
      body: {"name": name, "job": job},
    );
    var data = jsonDecode(response.body);
    postmodel = PostUploadAPIModel.fromJson(data);

    return postmodel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text('Post Upload API',style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 22,
            fontWeight: FontWeight.normal),),
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
                  controller: emailC,
                  decoration: const InputDecoration(
                    hintText: 'Email...',
                    hintStyle:   TextStyle(
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
                  controller: passwordC,
                  decoration: const InputDecoration(
                    hintText: 'Password...',
                    hintStyle:   TextStyle(
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
                  PostUploadAPIModel savedata =
                      await postUploadAPI(emailC.text, passwordC.text);

                  setState(() {
                    _pm = savedata;
                  });
                },
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.lightGreen)),
                  child: const Center(
                    child: Text('Upload Post Data', style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 22,
                        fontWeight: FontWeight.normal),),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _pm == null
                  ? const CircularProgressIndicator(
                      color: Colors.lightBlue,
                      strokeWidth: 4,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        // color: Colors.lightBlue,
                        border: Border.all(width: 2, color: Colors.lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                              child: Text(
                            'ID Number: ${_pm!.id}',
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            'User Name: ${_pm!.name}',
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            'Password: ${_pm!.job}',
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Successfully Create Data IN This Time: ${_pm!.createdAt}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
