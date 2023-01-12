import 'package:dio/dio.dart';
import 'package:fullstack_todo/constants/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThirdPartyModules {
  @lazySingleton
  Dio get dio => Dio(BaseOptions(baseUrl: kBaseUrl));
}
