import 'package:flutter/material.dart';
import 'package:handle_api/api_model/myapiModel.dart';
import 'package:handle_api/ui_api/api_main_page1.dart';
import 'package:handle_api/ui_api/my_list_api.dart';
import 'package:handle_api/ui_api/post_api_screen.dart';
import 'package:handle_api/ui_api/postapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PostAPI(),
    );
  }
}
