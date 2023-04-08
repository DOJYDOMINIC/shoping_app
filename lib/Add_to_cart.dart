import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'constant.dart';
import 'shoplist.dart';

class orderplaced extends StatefulWidget {
  const orderplaced({Key? key}) : super(key: key);

  @override
  State<orderplaced> createState() => _orderplacedState();
}

class _orderplacedState extends State<orderplaced> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
          ()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder:
            (context) =>
            ShopListScreen(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_o3kwwgtn.json',repeat: false)),
              Text("Order Placed",style: fontsize1,),
            ],
          ),
        ],
      ) ,
    );
  }
}


