import 'dart:convert';

bool logoutModelFromJson(String str) => json.decode(str);

String logoutModelToJson(bool data) => json.encode(data);
