import 'package:flutter/material.dart';

class SignUpBoody {
  String name;
  String phone;
  String email;
  String password;

  SignUpBoody({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['f_name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}
