import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dartz/dartz.dart';

final dioProvider = Provider(
  (ref) => Dio()
    ..options = BaseOptions(
      // baseUrl: 'https://646ccc017b42c06c3b2c0977.mockapi.io/api/contact',
      baseUrl:
          "https://64e5da0609e64530d17f2458.mockapi.io/api/contacts", // with sbs@gmail.com
      contentType: 'application/json',
    ),
);

final initializationProvider = FutureProvider<Unit>((ref) async {
  ref.watch(dioProvider);

  return unit;
});
