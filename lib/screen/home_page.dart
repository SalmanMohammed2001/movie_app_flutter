import 'package:flutter/material.dart';
import 'package:movie_app/service/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: () {
              ApiServices().getPopularMovies();
            }, child: Text("Get Popular Movie"))

          ],
        ),
      ),
    );
  }
}
