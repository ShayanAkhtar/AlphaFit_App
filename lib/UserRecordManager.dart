import 'package:flutter/material.dart';

class UserRecords{
  static final UserRecords _records = UserRecords._internal();

  String? Userid;
  String? Username;
  String? Useremail;

  factory UserRecords(){
    return _records;
  }

  UserRecords._internal(){

  }

}