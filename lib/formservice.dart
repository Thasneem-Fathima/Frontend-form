import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormService {
  Dio dio = new Dio();

  submit(name, email, num, password) async {
    try {
      return await dio.post('https://backend-form-xg0n.onrender.com/adduser',
          data: {
            "name": name,
            "password": password,
            "num": num,
            "email": email,   
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
        msg: e.response?.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 221, 74, 123),
        textColor: Colors.white,
        fontSize: 16
      );
    }
  }
}
