import 'package:dio/dio.dart';

class DioHelper{

static late Dio dio;

static init(){
  dio = Dio(
    BaseOptions(
      baseUrl: "https://themealdb.com/api/",
      receiveDataWhenStatusError: true
    )
  );
}

static Future<Response> GetData({

 required String url,
})async{
  
  return await dio.get(url);
  
}



}