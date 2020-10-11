import 'package:flutter/material.dart';
import 'package:qc4application/home_screen/components/bottom_sheet.dart';

class IconBar extends StatefulWidget {
  @override
  _IconBarState createState() => _IconBarState();
}

class _IconBarState extends State<IconBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.7,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconItem(icon: Icons.account_balance_wallet_rounded, iconName: "Top Up", press: (){},),
          IconItem(icon: Icons.send_rounded, iconName: "Transfer", press: (){},),
          IconItem(icon: Icons.payment_rounded, iconName: "Payment", press: (){
            showModalBottomSheet(context: context, shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            ), builder: (BuildContext context) => BottomSheetScreen());
          },)
        ],
      ),
    );
  }
}

class IconItem extends StatelessWidget {
  final String iconName;
  final IconData icon;
  final Function press;
  const IconItem({Key key, this.iconName, this.icon, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        children: [
          Icon(icon, color: Colors.deepPurpleAccent, size: 20,),
          SizedBox(height: 5,),
          Text(iconName, style: TextStyle(color: Colors.black, fontSize: 10),)
        ],
      ),
    );
  }
}

