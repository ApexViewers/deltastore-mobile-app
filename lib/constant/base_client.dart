// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;

import 'keys.dart';

class BaseClientClass {
  static const int TIME_OUT_DURATION = 30;

  static Future<dynamic> get(String url, String params) async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$consumerkey:$secretkey'))}';
    print('url: ${url + params}');
    http.Response response;
    try {
      response = await http.get(
        Uri.parse(url + params),
        headers: {
          "Content-Type": "application/json",
          'Authorization': basicAuth,
        },
      ).timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      return response;
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }

  static Future<dynamic> post(String url, data) async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$consumerkey:$secretkey'))}';
    print('Url: $url');
    print(data);
    http.Response response;
    try {
      response = await http
          .post(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              'Authorization': basicAuth,
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      return response;
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }

  static Future<dynamic> put(String url, data) async {
    print('Url: $url');
    print(data);
    http.Response response;
    try {
      response = await http
          .put(
            Uri.parse(url),
            body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              //  'Authorization': 'Bearer ${SessionController().token}',
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      return response;
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }
  static Future<dynamic> delete(String url,) async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$consumerkey:$secretkey'))}';
    print('Url: $url');
    // print(data);
    http.Response response;
    try {
      response = await http
          .delete(
            Uri.parse(url),
            // body: json.encode(data),
            headers: {
              "Content-Type": "application/json",
              'Authorization': basicAuth,
            },
            encoding: Encoding.getByName('utf-8'),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print('Got response');
      print('Status Code: ${response.statusCode}');
      print('Body: ${response.body}');
      return response;
    } on SocketException {
      print('No internet connection');
      return 'No internet connection';
    } on TimeoutException {
      print('Connection timed out');
      return 'Connection timed out';
    }
  }

  static Future<bool> isInternetConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
