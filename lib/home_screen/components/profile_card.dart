import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {

  final String text, amount;
  const ProfileCard({Key key, this.text, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Text(text, style: TextStyle(color: Colors.white, fontSize: 12),),
            SizedBox(height: 5,),
            Text("Rp"+amount, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
