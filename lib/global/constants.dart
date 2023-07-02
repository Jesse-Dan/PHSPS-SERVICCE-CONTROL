// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static const String BASE_URL = 'https://api1.phsps.com/api';

  static const Map<String, String> endPoints = {
    'get_costumers': '/customer',
    'search': '/search',
    'get_monthly_subs': '/month',
    'get_total_monthly_subs_annully': '/sum ',
    'login': '/login',
    'reg': '/register'
  };
  static Size size(context) {
    return MediaQuery.of(context).size;
  }

  static const kdefaultpadding = 16.0;
  
}
