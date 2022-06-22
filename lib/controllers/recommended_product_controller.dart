import 'package:delivery_app/data/repositories/popular_product_repo.dart';
import 'package:delivery_app/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repositories/recommended_product_repo.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;
  bool _isLoadeed = false;
  bool get isLoaded => _isLoadeed;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();

    if (response.statusCode == 200) {
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoadeed = true;
      update();
    } else {}
  }
}
