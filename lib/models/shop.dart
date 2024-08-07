import 'package:flutter/material.dart';

import 'medicine.dart';

class Shop extends ChangeNotifier {
  final List<Medicine> _medicineList = [
    Medicine(
      name: 'Vicks VapoRub',
      price: 99.0,
      imagePath: 'assets/images/medicines/vapor-rub.png',
      shortDescription: 'Cough and Cold Relief',
      longDescription:
          'Soft foam reinforcement, commonly used for bruised wounds, meets athletes\' needs. If you are looking for a waterproof plaster for knee and elbow injuries, we recommend the 3M Nexcare brand. This model, in particular, comes in a large size of up to 50 x 101 millimeters.',
    ),
    Medicine(
      name: 'Waterproof Cushioned Foam Bandages',
      price: 176.0,
      imagePath: 'assets/images/medicines/bandages.png',
      shortDescription: 'Waterproof Wound Care',
      longDescription:
          'Soft foam reinforcement, commonly used for bruised wounds, meets athletes\' needs. If you are looking for a waterproof plaster for knee and elbow injuries, we recommend the 3M Nexcare brand. This model, in particular, comes in a large size of up to 50 x 101 millimeters.',
    ),
    Medicine(
        name: 'Tigerplast LeoPovidone',
        price: 60.0,
        imagePath: 'assets/images/medicines/tigerplast.jpg',
        shortDescription: 'Fresh Wound Care',
        longDescription:
            'Soft foam reinforcement, commonly used for bruised wounds, meets athletes\' needs. If you are looking for a waterproof plaster for knee and elbow injuries, we recommend the 3M Nexcare brand. This model, in particular, comes in a large size of up to 50 x 101 millimeters.'),
  ];

  final List<Medicine> _orderHistoryList = [
    Medicine(
        name: 'Waterproof Cushioned Foam Bandages',
        price: 176.0,
        imagePath: 'assets/images/medicines/bandages.png',
        shortDescription: 'Waterproof Wound Care',
        longDescription:
            'Soft foam reinforcement, commonly used for bruised wounds, meets athletes\' needs. If you are looking for a waterproof plaster for knee and elbow injuries, we recommend the 3M Nexcare brand. This model, in particular, comes in a large size of up to 50 x 101 millimeters.'),
    Medicine(
        name: 'Tigerplast LeoPovidone',
        price: 60.0,
        imagePath: 'assets/images/medicines/tigerplast.jpg',
        shortDescription: 'Fresh Wound Care',
        longDescription:
            'Soft foam reinforcement, commonly used for bruised wounds, meets athletes\' needs. If you are looking for a waterproof plaster for knee and elbow injuries, we recommend the 3M Nexcare brand. This model, in particular, comes in a large size of up to 50 x 101 millimeters.'),
    Medicine(
        name: 'Unomint',
        price: 59.0,
        imagePath: 'assets/images/medicines/mint.jpg',
        shortDescription: 'Antacid Medicine',
        longDescription:
            'Soft foam reinforcement, commonly used for bruised wounds, meets athletes\' needs. If you are looking for a waterproof plaster for knee and elbow injuries, we recommend the 3M Nexcare brand. This model, in particular, comes in a large size of up to 50 x 101 millimeters.')
  ];

  final Map<Medicine, int> _cart = {};

  List<Medicine> get medicineList => _medicineList;
  List<Medicine> get orderHistoryList => _orderHistoryList;
  Map<Medicine, int> get cart => Map<Medicine, int>.from(_cart);

  void addToCart(Medicine medicineItem, int quantity) {
    if (_cart.containsKey(medicineItem)) {
      _cart[medicineItem] = _cart[medicineItem]! + quantity;
    } else {
      _cart[medicineItem] = quantity;
    }
    notifyListeners();
  }

  void removeFromCart(Medicine medicineItem) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cart.remove(medicineItem);
      notifyListeners();
    });
  }

  void updateQuantity(Medicine medicineItem, int newQuantity) {
    if (_cart.containsKey(medicineItem)) {
      _cart[medicineItem] = newQuantity;
      print(_cart[medicineItem]);
      if (_cart[medicineItem]! <= 0) {
        _cart.remove(medicineItem);
      }
      notifyListeners();
    }
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    _cart.forEach((medicineItem, quantity) {
      totalPrice += (medicineItem.price * quantity);
    });

    return totalPrice;
  }
}
