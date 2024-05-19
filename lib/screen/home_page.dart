
import 'package:flutter/material.dart';
import 'package:movie_app/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FilledButton(onPressed: (){
          setState(() {
            ApiServices().getPopularMovie();
          });
        }, child: const Text("Get Populate Movie")),
      ),
    );
  }
}
