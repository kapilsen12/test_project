import 'package:http/http.dart' as http;

class NetWorkHelper {
  NetWorkHelper({required this.url});
  final String url;
  Future<String> getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'error';
    }
  }
}
