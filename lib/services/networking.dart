import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  void performGetRequest(
      String url, completion(var response), failure(String error)) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      completion(jsonDecode(response.body));
    } else {
      failure('${response.statusCode}: ${response.reasonPhrase}');
    }
  }
}
