import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc4application/home_screen/models/slider_amount.dart';

class BottomSheetScreen extends StatefulWidget {
  @override
  _BottomSheetScreenState createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen> {
  TextEditingController amountController = TextEditingController();
  String amount;
  double val = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select Payment Amount",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            "Move the slider to set up your payment amount",
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(
            height: 40,
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Builder(builder: (context) {
                return Text(
                  '    Rp    ',
                  style: TextStyle(color: Colors.black45),
                );
              }),
              TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.grey,
                onSaved: (newValue) => amount = newValue,
                controller: amountController,
                decoration: InputDecoration(
                  hintText: "120000",
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixText: "Rp   ",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  prefixStyle: TextStyle(color: Colors.transparent),
                  contentPadding: EdgeInsets.only(left: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Slider(
            value: val,
            min: 0.0,
            max: 10000.0,
            onChanged: (double value) {
              setState(() {
                val = value;
              });
              var sliderAmount =
                  Provider.of<SliderAmount>(context, listen: false);
              sliderAmount.updateAmount(value);
            },
            activeColor: Colors.deepPurpleAccent,
            inactiveColor: Colors.grey[500],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Balance", style: TextStyle(color: Colors.grey),),
              Consumer<SliderAmount>(
                builder: (context, data, child){
                  var value = data.getAmount();
                  var valShort = double.parse(value.toStringAsFixed(3));
                  return Text("Rp "+ valShort.toString(), style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
