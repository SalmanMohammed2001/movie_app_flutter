import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiServices {
  final apiKey = 'api_key=ce6ab78f71cbebfb39e13333eedcd31a';
  final popularMovies = 'https://api.themoviedb.org/3/movie/popular?';

  Future<void> getPopularMovies() async {
    final response = await http.get(Uri.parse('$popularMovies$apiKey'));
    if(response.statusCode == 200){
      Map<String,dynamic> body= jsonDecode(response.body);

      List<dynamic> result=body['results'];

      Logger().f(result.length);

    }else{
      Logger().e('Error -${response.statusCode}');
    }

  }
}
