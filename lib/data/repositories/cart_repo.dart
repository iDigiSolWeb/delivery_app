import 'dart:convert';

import 'package:delivery_app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    var time = DateTime.now().toString();

    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });

    sharedPreferences.setStringList(AppConstants.cartList, cart);
    print(sharedPreferences.getStringList(AppConstants.cartList));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstants.cartList)) {
      carts = sharedPreferences.getStringList(AppConstants.cartList)!;
      print('inside cartlist' + carts.toString());
      print(carts.length);
    }

    List<CartModel> cartList = [];
    carts.forEach((element) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.cart_history_list)) {
      cartHistory = [];
      cartHistory = sharedPreferences.getStringList(AppConstants.cart_history_list)!;
    }
    List<CartModel> cartmioodellist = [];

    cartHistory.forEach((element) {
      cartmioodellist.add(CartModel.fromJson(jsonDecode(element)));
    });

    return cartmioodellist;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.cart_history_list)) {
      cartHistory = sharedPreferences.getStringList(AppConstants.cart_history_list)!;
    }

    for (int i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }
    removeCart();
    cart = [];
    sharedPreferences.setStringList(AppConstants.cart_history_list, cartHistory);
  }

  void removeCart() {
    sharedPreferences.remove(AppConstants.cartList);
  }

  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstants.cart_history_list);
  }
}
