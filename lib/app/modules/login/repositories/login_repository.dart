import 'dart:convert';
import 'package:http/http.dart' as http;
class LoginRepository {
  final baseURL = "http://jsonplaceholder.typicode.com";
  Future<bool> login({required String userName, required String name, required String email}) async {
  
   var url = Uri.parse(
      '$baseURL/users',
    );
    final response = await http.post(
    url,
    body: {userName: userName, name: name, email: email},
    );
    print(response.statusCode);
    if(response.statusCode == 200) {
      print(jsonDecode(response.body)['token']);
      return true;
    } else {
      print(jsonDecode(response.body));
      return false;
    }
  }
}