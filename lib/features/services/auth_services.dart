import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_clone/constants/global_variables.dart';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: '',
          email: '',
          password: '',
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            'Accept': '*/*'
          });

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
              context,
              'Account created! Login with the same credentials!',
            );
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
