import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_app/Screens/AdminPage.dart';
import 'package:test_app/Screens/LoginPage.dart';

class AdminSignIn extends StatefulWidget {
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        toolbarHeight: 60.0,
        title: Text(
            'Admin!',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 50,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                      'Welcome Home (☞ ͡° ͜ʖ ͡°)☞ ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'NewTegomin',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
                      child: TextFormField(
                        controller: _emailTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Email ID',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        textAlignVertical: TextAlignVertical.bottom,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 4.0),
                      child: TextFormField(
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.vpn_key_sharp),
                        ),
                        validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                        textAlignVertical: TextAlignVertical.bottom,
                        obscureText: true,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white30,
                      elevation: 0.5,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {

                        loginAdmin();

                        /*setState(() {
                        loading = true;
                      });
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() {
                          error = 'could not find these credentials';
                          loading = false;
                        });
                      }*/
                      }
                    },
                    child:  Text(
                        'Sign In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => LoginPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.blueAccent.withOpacity(0.06),
                      child: Text(
                        'I am a user',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:34.0),
                  Image.asset(
                      'images/contactchapter3.jpg',
                      height: 250.0

                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  loginAdmin() {

    FirebaseFirestore.instance.collection('admins').get().then((value){
      value.docs.forEach((element) {
        if(element.data()['id'] != _emailTextController.text){
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Wrong ID')));
        }
        else if(element.data()['password'] != _passwordTextController.text){
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Wrong password')));
        }
        else{
          setState(() {
            _emailTextController.text = '';
            _passwordTextController.text = '';
          });
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => AdminPage()));
        }
      });
    });


  }
}
