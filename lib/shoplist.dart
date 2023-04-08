
import 'package:flutter/material.dart';
import 'package:shoping_app/shop_model.dart';

import 'AddRequirementsScreen.dart';
import 'constant.dart';

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController shopName = TextEditingController();
    final TextEditingController shopId = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: ShopButton),
                  currentAccountPicture: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                          radius: 33,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'))),
                  accountName: Text(
                    'appusername',
                    style: fontsize1,
                  ),
                  accountEmail: Text('')),
              ListTile(
                title: ListTile(
                  leading: Icon(Icons.home),
                  title: Text(
                    'Home',
                    style: fontsize2,
                  ),
                ),
                onTap: () {
                  // do something
                },
              ),
              ListTile(
                title: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    'Settings',
                    style: fontsize2,
                  ),
                ),
                onTap: () {
                  // do something
                },
              ),
              ListTile(
                title: ListTile(
                  leading: Icon(Icons.help),
                  title: Text(
                    'Help & support',
                    style: fontsize2,
                  ),
                ),
                onTap: () {
                  // do something
                },
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                height: 65,
                color: ShopButton,
                child: ListTile(
                  title: ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    // do something
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ShopButton,
          onPressed: () => showModalBottomSheet(
            isScrollControlled: true,
            shape: const RoundedRectangleBorder(
              // <-- SEE HERE
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            context: context,
            builder: (context) => Container(
              child: Padding(
                padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      height: 100,
                        width: 100,
                        "assets/images/add_cart.png"),
                    SizedBox(
                      height: 10,
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
                        hintText: 'Enter Shop name',
                      ),
                      controller: shopName,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
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

                        hintText: 'Enter Shop Id',
                      ),
                      controller: shopId,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 120,
                      height: 55,
                      color: ShopButton,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.red.withOpacity(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(2),
                              ),
                              side: BorderSide(color: Colors.white)),
                        ),
                        onPressed: () {
                          shopsList.add({
                            'name': shopName.text,
                            'id': shopId.text,
                            'Requirements': [],
                          });
                          print(shopsList);
                          setState(() {});

                          Navigator.pop(context);
                        },
                        child: Text('Add shop'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              // snap: false,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    "SHOPS",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ), //Text
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/hi_there.png'))),
                  ) //Images.network
              ), //FlexibleSpaceBar
              expandedHeight: 220,
              backgroundColor:ShopButton,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return SizedBox(
                    height: 130,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddRequirementsScreen(
                              shopIndex: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 245, 245),
                            border: Border.all(color: ShopButton),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Image.asset('assets/images/shopin.png'),
                            title: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text('${shopsList[index]['name']}',
                                  style: fontsize1),
                            ),
                            subtitle: Text(
                              'Shop Id : ${shopsList[index]['id']}',),
                            trailing: Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 30,
                              color: ShopButton,
                            ),
                            //       trailing: Text(
                            // '$totalItemRate' ,style: TextStyle(fontSize: 20) ,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: shopsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
