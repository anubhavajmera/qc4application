import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qc4application/home_screen/components/profile_card.dart';
import 'package:qc4application/home_screen/models/slider_amount.dart';
import 'components/icons_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<String> categoryList = ["All", "Food", "Shopping", "Rent"];
  List<Map> expenseList = [
    {
      "icon": Icons.car_repair,
      "title": "Coffee Latte",
      "subtitle": "Today, 10:00 am",
      "amount": "-Rp25.000",
      "color": Colors.redAccent,
    },
    {
      "icon": Icons.car_repair,
      "title": "Online Taxi",
      "subtitle": "Today, 10:00 am",
      "amount": "-Rp25.000",
      "color": Colors.greenAccent,
    },
    {
      "icon": Icons.car_repair,
      "title": "Lunch",
      "subtitle": "Today, 10:00 am",
      "amount": "-Rp25.000",
      "color": Colors.redAccent,
    },
    {
      "icon": Icons.car_repair,
      "title": "Bank Transfer",
      "subtitle": "Today, 10:00 am",
      "amount": "-Rp25.000",
      "color": Colors.redAccent,
    }
  ];
  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
      BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart), title: Text("Graphics")),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_alert), title: Text("Alert")),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings), title: Text("Settings")),
    ];
  }

  void bottomTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                color: Colors.deepPurpleAccent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Total Balance",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Consumer<SliderAmount>(
                              builder: (context, data, child) {
                                var value = data.getAmount();
                                var valShort =
                                    double.parse(value.toStringAsFixed(3));
                                return Text(
                                  "Rp " + valShort.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            )
                          ],
                        ),
                        Spacer(),
                        CircleAvatar(
                          child: Icon(Icons.person),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        ProfileCard(
                          text: "Monthly Income",
                          amount: "200.000",
                        ),
                        Spacer(),
                        ProfileCard(
                          text: "Monthly Spendings",
                          amount: "200.000",
                        )
                      ],
                    )
                    //bottomContent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.318,
                left: MediaQuery.of(context).size.width * 0.15),
            child: IconBar(),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.41,
                left: MediaQuery.of(context).size.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's Transaction",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView.builder(
                      itemCount: categoryList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Chip(
                            label: Text(categoryList[index]),
                          ),
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.08),
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Card(
                    child: ListView.builder(
                      itemCount: expenseList.length,
                      itemBuilder: (context, index){
                        return ExpensesItem(icon: expenseList[index]["icon"], title: expenseList[index]["title"], subtitle: expenseList[index]["subtitle"], color: expenseList[index]["color"], amount: expenseList[index]["amount"],);
                      }
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: buildBottomNavBarItems(),
        onTap: (index) {
          bottomTapped(index);
        },
        selectedItemColor: Colors.greenAccent,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        unselectedItemColor: Colors.black26,
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),
    );
  }
}

class ExpensesItem extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title, subtitle, amount;
  const ExpensesItem({Key key, this.color, this.icon, this.title, this.subtitle, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1, color: Colors.grey))),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.all(Radius.circular(10)),
              color: color),
          child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
        ),
        title: Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        subtitle: Text(subtitle),
        trailing: Text(amount, style: TextStyle(color: color),),
      ),
    );
  }
}

