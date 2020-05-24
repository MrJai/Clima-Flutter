import 'package:http/http.dart' as http;

class Networking {
  void performGetRequest(String url, completion(String response),
      failure(String error)) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      completion(response.body);
    } else {
      failure('${response.statusCode}: ${response.reasonPhrase}');
    }
  }
}
