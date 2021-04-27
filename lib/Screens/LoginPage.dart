import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_app/Screens/AdminSignIn.dart';
import 'package:test_app/Screens/Loading.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Screens/Register.dart';
import 'package:test_app/database.dart';
import 'package:test_app/Screens/Register.dart';
import 'package:test_app/provider/user.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {



  bool showSignIn = true;



  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }


  @override
  Widget build(BuildContext context) {


    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }else {
      return Register(toggleView: toggleView);
    }

  }
}

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({
    this.toggleView
});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

/*  //santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;*/

  //final AuthService _auth = AuthService();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool loading = false;
  bool hidePass = true;

  String email = '';
  String password = '';
  String error = '';


/*  //santos
  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    User user = await firebaseAuth.currentUser;
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavBar()));
    }

    setState(() {
      loading = false;
    });
  }

//  Future handleSignIn() async {
//    setState(() {
//      loading = true;
//    });
//  }*/

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body:user.status == Status.Authenticating ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Sign In"),
        backgroundColor: Colors.red[300],
        elevation: 0,
        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(
                  Icons.person_add,
                color: Colors.white,
              ),
              label: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 30,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                    'Welcome back to \nChapter 3',
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
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(color: Colors.blue)),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
                      textAlignVertical: TextAlignVertical.center,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
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
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      title: TextFormField(
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color: Colors.blue)),
                          prefixIcon: Icon(Icons.vpn_key_rounded),
                        ),
                        validator: (val) => val.length < 6 ? 'Enter a password of more than 6 characters' : null,
                        textAlignVertical: TextAlignVertical.center,
                        obscureText: hidePass,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                      trailing: IconButton(
                          focusColor: Colors.red,
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: () {
                            setState(() {
                              hidePass = !hidePass;
                            });
                          }),
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
                      if(!await user.signIn(_emailTextController.text, _passwordTextController.text)) {
                        _key.currentState.showSnackBar(SnackBar(content: Text(
                            "Sign in failed")));
                      }
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => NavBar()));

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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => AdminSignIn()));

                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.redAccent.withOpacity(0.08),
                    child: Text(
                      'I am an Admin',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15
                      ),
                    ),
                  ),
                ),
                Text(
                  error,
                  style:  TextStyle(
                    color: Colors.red,
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
      )
      ),
    );
  }

  /*FirebaseAuth _auth = FirebaseAuth.instance;

  void loginUser() async{
    User user;
    await _auth.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text
    ).then((authUser){
      user = authUser.user;
    }).catchError((error){
      print(error.toString());
    });
    if(user != null)
      {
        await readData(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => NavBar()));
      }
  }

  Future readData(User user) async{
    FirebaseFirestore.instance.collection("users").doc(user.uid).get().then((value) async {
      await BookApp.sharedPreferences.setString(BookApp.userUID, value.data()[BookApp.userUID]);
      await BookApp.sharedPreferences.setString(BookApp.userEmail, value.data()[BookApp.userEmail]);
      await BookApp.sharedPreferences.setString(BookApp.userName, value.data()[BookApp.userName]);
      await BookApp.sharedPreferences.setString(BookApp.userPhotoUrl, value.data()[BookApp.userPhotoUrl]);

      List<String> cartList = value.data()[BookApp.userCartList].cast<String>();
      await BookApp.sharedPreferences.setStringList(BookApp.userCartList, cartList);
    });
  }*/
}







