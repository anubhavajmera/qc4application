import 'package:flutter/cupertino.dart';

class SliderAmount extends ChangeNotifier{
  double amount = 0.0;
  double getAmount() => amount;

  updateAmount(value){
    amount = value;
    notifyListeners();
  }
}