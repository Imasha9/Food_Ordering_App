import 'dart:core';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_app/models/cart_item.dart';
import 'package:ticket_app/models/food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/burgers/burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/burgers/burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/burgers/burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/burgers/burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/burgers/burger1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),

    //salads
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/sides/side1.jpg",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: " Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/sides/side2.jpg",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Chicken Burger",
      description:
          " ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/sides/side3.jpg",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Bacon burger",
      description:
          " flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/sides/side4.jpg",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Vegie Cheeseburger",
      description:
          " is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/sides/side1.jpg",
      price: 0.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),

    //sides

    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/salads/salad1.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/salads/salad2.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/salads/salad4.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/salads/salad3.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),

    //Drinks
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/salads/salad2.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/salads/salad1.jpg",
      price: 0.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/drinks/drink1.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/drinks/drink1.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/drinks/drink1.jpg",
      price: 0.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),

    //Desserts
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/desert/desert1.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/desert/desert2.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/desert/desert3.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/desert/desert1.jpg",
      price: 0.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Cheeseburger",
      description:
          "Indulge in the ultimate cheeseburger experience! Our juicy, flame-grilled beef patty is perfectly seasoned and topped with a slice of melted cheddar cheese, crisp lettuce, ripe tomatoes, and tangy pickles",
      imagePath: "lib/images/desert/desert3.jpg",
      price: 0.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avacado", price: 2.99),
      ],
    ),
  ];


  //user cart
  final List<CartItem> _cart = [];


  //delivery address(which can change/update)
  String _deliveryAddress='99 Hollywoood Blv';

  /* GETTERS


    */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress=>_deliveryAddress;

/*
OPERATIONS
 */



//add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //set if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the lists of selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if item already exists,increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise add a new cart item to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }

//remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

//get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

//get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

//clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress=newAddress;
    notifyListeners();
  }

/* HELPERS
 */
//generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("here's your receipt.");
    receipt.writeln();

    //format the date to include up to second only
    String formattedDate=DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------");


    for(final cartItem in _cart){
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
      );
      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("Add-ons:${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("-------------");
    receipt.writeln();
    receipt.writeln("Total Items:${getTotalItemCount()}");
    receipt.writeln("Total price:${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to:$deliveryAddress");

    return receipt.toString();
  }

//format double value into money
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

//format list of addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name}(${_formatPrice(addon.price)})")
        .join(",");
  }
}
