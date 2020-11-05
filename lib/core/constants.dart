import 'package:dio/dio.dart';

const kBaseUrl = 'https://www.breakingbadapi.com/api/';

final kDioOptions = BaseOptions(
  baseUrl: kBaseUrl,
  contentType: 'application/json; charset=utf-8',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);