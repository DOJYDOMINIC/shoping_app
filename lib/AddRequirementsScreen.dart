import 'package:flutter/material.dart';
import 'package:shoping_app/shop_model.dart';
import 'Add_to_cart.dart';
import 'Amount_Container.dart';
import 'constant.dart';
import 'models/requirements_model.dart';

class AddRequirementsScreen extends StatefulWidget {
  const AddRequirementsScreen({Key? key, required this.shopIndex,})
      : super(key: key);
  final int shopIndex;

  @override
  State<AddRequirementsScreen> createState() => _AddRequirementsScreenState();
}
class _AddRequirementsScreenState extends State<AddRequirementsScreen> {
  List<Map<String, dynamic>> items = [
    {'itmname': 'Apple', 'itmprice': 10.99},
    {'itmname': 'Orange', 'itmprice': 19.99},
    {'itmname': 'Pinaple', 'itmprice': 7.99},
    {'itmname': 'Grapes', 'itmprice': 14.99},
    {'itmname': 'Mango', 'itmprice': 16.99},
  ];

  String selectedItem = 'Apple';
  double itemPrice = 10.99;
  // TextEditingController itemRate = TextEditingController();
  num sum = 0.0;

  getTotaAmount() {
    var totalamount = 0.0;
    for (var i = 0; i < shopsList[widget.shopIndex]['Requirements'].length;i++) {
      totalamount = totalamount +
          (shopsList[widget.shopIndex]['Requirements'][i].rate *
              shopsList[widget.shopIndex]['Requirements'][i].qty);
    }
    setState(() {
      sum = totalamount;
      totalamount = 0.0;
      itemRate.text = itemPrice.toString();
    });
  }

  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemQty = TextEditingController();
  final TextEditingController itemRate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Requirements'),
          backgroundColor: ShopButton,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // TextField(
                          //   decoration: const InputDecoration(
                          //     focusedBorder: OutlineInputBorder(
                          //       borderSide:
                          //       BorderSide(color: Colors.blue, width: 2.0),
                          //     ),
                          //     enabledBorder: OutlineInputBorder(
                          //       borderSide: BorderSide(
                          //           color: Color.fromARGB(255, 97, 61, 230),
                          //           width: 2.0),
                          //     ),
                          //     hintText: 'Enter Your Item ',
                          //   ),
                          //   controller: itemName,
                          // ),
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
                                itemPrice = items
                                    .firstWhere((item) => item['itmname'] == value)['itmprice'];
                                itemRate.text = itemPrice.toString();
                              });
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 97, 61, 230),
                                    width: 2.0),
                              ),
                              hintText: 'Enter Your Quantity',
                            ),
                            keyboardType: TextInputType.number,
                            controller: itemQty,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 97, 61, 230),
                                    width: 2.0),
                              ),
                              hintText: 'Amount',
                            ),
                            keyboardType: TextInputType.number,
                            controller: itemRate,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 120,
                            height: 55,
                            color: ShopButton,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: Colors.red.withOpacity(0),
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                    side: BorderSide(color: Colors.white)),
                              ),
                              onPressed: () {
                                shopsList[widget.shopIndex]['Requirements'].add(
                                  RequirementsModel(
                                      itemName: itemName.text,
                                      qty: double.parse(itemQty.text),
                                      rate: double.parse(itemRate.text)),
                                );

                                // print("item added");
                                print(shopsList[widget.shopIndex]
                                ['Requirements']
                                    .length);
                                getTotaAmount();
                                setState(() {});
                                itemName.clear();
                                itemQty.clear();
                                itemRate.clear();
                                Navigator.pop(context);
                              },
                              child: Text('Add'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text('Name', style: fontsize1)),
                        Expanded(child: Text('Qty', style: fontsize1)),
                        Expanded(child: Text('Price', style: fontsize1)),
                        Expanded(child: Text('Total', style: fontsize1))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  itemCount: shopsList[widget.shopIndex]['Requirements'].length,
                  itemBuilder: (context, index) {
                    num totalItemRate = shopsList[widget.shopIndex]
                    ['Requirements'][index]
                        .qty *
                        shopsList[widget.shopIndex]['Requirements'][index].rate;
                    return SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.black.withOpacity(.1)),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    textDirection: TextDirection.ltr,
                                    ('$selectedItem'),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  textDirection: TextDirection.ltr,
                                  shopsList[widget.shopIndex]['Requirements']
                                  [index]
                                      .qty
                                      .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  textDirection: TextDirection.ltr,
                                  shopsList[widget.shopIndex]['Requirements']
                                  [index]
                                      .rate
                                      .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  textDirection: TextDirection.ltr,
                                  '$totalItemRate',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      AmountContainer(totalAmount: sum),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text('BUY'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ShopButton,
                          ),
                          onPressed: () {
                            if (sum == 0) {
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => orderplaced(),
                              ));
                              shopsList[widget.shopIndex]['Requirements']
                                  .clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
