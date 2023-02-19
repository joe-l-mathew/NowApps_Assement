import 'package:dio/dio.dart';

import '../models/product_model.dart';

class GetProducts {
  var dio = Dio(BaseOptions());
  Future<ProductModel?> fetchApi() async {
    Response res = await dio.get('https://www.jsonkeeper.com/b/YIDG');
    if (res.statusCode != 200) {
      return null;
    }

    ProductModel? model = ProductModel.fromJson(res.data);
    print(model.data!.products![1].prodImage!);
    return model;
  }
}
