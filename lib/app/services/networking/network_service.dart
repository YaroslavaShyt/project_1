import 'package:dio/dio.dart';
import 'package:project_1/app/services/networking/endpoints.dart';
import 'package:project_1/domain/networking/inetwork_service.dart';

class NetworkService implements INetworkService {
  late Dio dio;

  @override
  void init() {
    dio = Dio(BaseOptions(
      baseUrl: urlBase,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) {
        print('Network error: $error');
        handler.next(error);
      },
    ));
  }

  @override
  Future delete({required String endpoint}) async {
    try {
      final response = await dio.delete(endpoint);
      return response.data;
    } catch (error) {
      return error.toString();
    }
  }

  @override
  Future get({required String endpoint}) async {
    try {
      final response = await dio.get(endpoint);
      return response.data;
    } catch (error) {
      return error.toString();
    }
  }

  @override
  Future post({required String endpoint, required dynamic data}) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return response.data;
    } catch (error) {
      return error.toString();
    }
  }

  @override
  Future put({required String endpoint, required dynamic data}) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return response.data;
    } catch (error) {
      return error.toString();
    }
  }

  @override
  Future update({required String endpoint, required dynamic data}) async {
    try {
      final response = await dio.patch(endpoint, data: data);
      return response.data;
    } catch (error) {
      return error.toString();
    }
  }
}
