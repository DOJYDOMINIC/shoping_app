import 'package:flutter/material.dart';

void Main (){
  runApp(MyWidget());
}
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Map<String, dynamic>> items = [
    {'itmname': 'Apple', 'itmprice': 10.99},
    {'itmname': 'Orange', 'itmprice': 19.99},
    {'itmname': 'Pinaple', 'itmprice': 7.99},
    {'itmname': 'Grapes', 'itmprice': 14.99},
    {'itmname': 'Mango', 'itmprice': 16.99},
  ];

  String selectedItem = 'Apple';
  double itemPrice = 10.99;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = itemPrice.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            DropdownButton(
              value: selectedItem,
              items: items.map((item) {
                return DropdownMenuItem(
                  child: Text(item['itmname']),
                  value: item['itmname'],
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value.toString();
                  itemPrice = items.firstWhere((item) => item['itmname'] == value)['itmprice'];
                  _controller.text = itemPrice.toString();
                });
              },
            ),
            TextField(
              controller: _controller,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
