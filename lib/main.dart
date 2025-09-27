import 'package:flutter/cupertino.dart';
import 'package:wan_flutter/app.dart';
import 'package:wan_flutter/http/dio_instance.dart';

void main() {
  DioInstance.instance().initDio(baseUrl: "https://www.wanandroid.com/");
  runApp(const MyApp());
}
