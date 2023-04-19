import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cpu/openai/constants.dart';

Future<String> generateResponse(String prompt) async {
  const apiKey = key1+key2+key3+key4+key5;
  print(apiKey);

  var url = Uri.https("api.openai.com", "/v1/completions");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $apiKey"
    },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      'temperature': 0,
      'max_tokens': 2000,
      'top_p': 1,
      'frequency_penalty': 0.0,
      'presence_penalty': 0.0,
    }),
  );

  // if (response.statusCode != 200) {
  //   print(response.statusCode);
  //   throw Exception('Failed to fetch data from API');
    
  // }

  // Do something with the response
  Map<String, dynamic> newresponse = jsonDecode(response.body);
  //print(newresponse);

  // if (newresponse['choices'] == null || newresponse['choices'].isEmpty) {
  //   throw Exception('Invalid API response');
  // }

  return newresponse['choices'][0]['text'];
}
