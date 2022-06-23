import 'package:delivery_app/controllers/cart_controller.dart';
import 'package:delivery_app/data/repositories/popular_product_repo.dart';
import 'package:delivery_app/models/products_model.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoadeed = false;
  bool get isLoaded => _isLoadeed;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoadeed = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkquantity(_quantity + 1);
    } else {
      _quantity = checkquantity(_quantity - 1);
    }

    update();
  }

  int checkquantity(int quantity) {
    if (inCartItems + quantity < 0) {
      Get.snackbar('Item Count', 'Cannot go below zero',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if (inCartItems + quantity > 20) {
      Get.snackbar('Item Count', 'Cannot go over 20',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("The id is ${value.id.toString()}. The Quantity is ${value.quantity}");
    });

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
