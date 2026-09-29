import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:natham_college/utils/dio_client.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioClient.create();
});