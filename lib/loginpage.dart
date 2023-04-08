
import 'package:flutter/material.dart';
import 'constant.dart';
import 'shoplist.dart';


class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State {
  var formkey = GlobalKey<FormState>();
  bool showpass = true;
  final TextEditingController appusername = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Image(
                  width: 100,
                  height: 100,
                  image: AssetImage('assets/images/shop.png'))
              // Text("LoginPage",style: TextStyle(
              //     fontWeight: FontWeight.bold, fontSize: 30,color: Color.fromARGB(255, 97, 61, 230)),),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: appusername,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_box_sharp,),
                    labelText: 'UserName',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: ShopButton),
                        borderRadius:BorderRadius.circular(30))),
                // textInputAction: TextInputAction.next,

                validator: (uname) {
                  if (uname!.isEmpty ) {
                    return 'Enter a valid UserName';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: showpass,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.key,),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if(showpass){
                            showpass = false;
                          }else{
                            showpass = true;

                          }
                        });
                      },
                      icon: Icon(showpass == true ? Icons.visibility_off : Icons.visibility,),),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5),
                        borderRadius: BorderRadius.circular(30))
                ),
                textInputAction: TextInputAction.done,
                validator: (password) {
                  if (password!.isEmpty) {
                    return 'Enter a valid password , length  should be greater than 6';
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: () {
                final valid = formkey.currentState!.validate();
                if (valid) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShopListScreen()));
                } else {
                  return null;
                }
              },
              child: Container(
                height: 60,
                  width: MediaQuery.of(context).size.width/1.1,
                  decoration: BoxDecoration(color: ShopButton,borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Login",style:TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),))),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create your account'),
                TextButton(onPressed: (){}, child: Text('Sign Up'))
              ],
            )
          ],
        ),
      ),
    );
  }
}