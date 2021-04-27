
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:test_app/Screens/Loading.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/Screens/NavBar.dart';
import 'package:test_app/Utility/auth.dart';
import 'package:test_app/main.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/Screens/LoginPage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test_app/provider/user.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({
    this.toggleView
  });
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  //Santos
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  //UserServices _userServices = UserServices();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  String email = '';
  String password = '';
  String error = '';
  String name = '';
  bool hidePass = true;
  String userImageUrl = '';
  File _imageFile;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double _screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Colors.yellow,
      key: _key,
      appBar: AppBar(
        title: Text(
            "Register",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.brown[300],
        elevation: 0,
        leading: Icon(Icons.person_add_alt_1,color: Colors.black,),
      ),
      body: user.status == Status.Authenticating ? Loading() : Scaffold(
        backgroundColor: Colors.white,
        body: Center(
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                      child: Column(
                        children: [
                          Text(
                            'Welcome to \nChapter 3',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontFamily: 'NewTegomin',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                // CircleAvatar(
                                //   radius: 70,
                                //   backgroundImage: user.userModel.userImage == ''
                                //       ? Icon(Icons.add_photo_alternate)
                                //       : NetworkImage(user.userModel.userImage),
                                // ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                Container(
                                  width: _screenWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0),
                                  child: TextFormField(
                                    controller: _nameTextController,
                                    decoration: InputDecoration(
                                      hintText: 'Enter your Name',
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.blue)),
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter a name' : null,
                                    textAlignVertical: TextAlignVertical.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: _screenWidth,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0),
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
                                    validator: (val) =>
                                        val.isEmpty ? 'Enter an email' : null,
                                    textAlignVertical: TextAlignVertical.center,
                                    // net ninja
                                    onChanged: (val) {
                                      setState(() {
                                        email = val;
                                      });
                                    },
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
                                    contentPadding: EdgeInsets.all(8),
                                    title: TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Enter your password',
                                        border: InputBorder.none,
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            borderSide: BorderSide(color: Colors.blue)),
                                        prefixIcon: Icon(Icons.vpn_key_rounded),
                                      ),
                                      controller: _passwordTextController,
                                      validator: (val) => val.length < 6
                                          ? 'Enter a password 6+ chars long'
                                          : null,
                                      textAlignVertical: TextAlignVertical.center,
                                      obscureText: hidePass,
                                      // net ninja
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
                                Container(
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(0.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: new BorderRadius.circular(10.0)
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Confirm your password',
                                      border: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          borderSide: BorderSide(color: Colors.blue)),
                                      prefixIcon: Icon(Icons.vpn_key_sharp),
                                    ),
                                    controller: _confirmPasswordController,
                                    validator: (val) => val.length < 6
                                        ? 'Enter a password 6+ chars long'
                                        : null,
                                    textAlignVertical: TextAlignVertical.center,
                                    obscureText: true,
                                    //onChanged: (val) {
                                    //setState(() {
                                    //password = val;
                                    //});
                                    //},
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
                                    // net ninja
                                    //if (_formKey.currentState.validate()) {

                                    if (_formKey.currentState.validate()) {
                                      if (!await user.signUp(
                                          _nameTextController.text,
                                          _emailTextController.text,
                                          _passwordTextController.text)) {
                                        _key.currentState.showSnackBar(SnackBar(
                                            content: Text("Sign up failed")));
                                        return;
                                      }
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (c) => NavBar()));
                                    }

                                    //Random
                                    //uploadAndSaveData();

                                    /* net ninja
                                                  dynamic result = await registerWithEmailAndPassword(
                                                      email, password);
                                                  if (result == null) {
                                                    setState(() {
                                                      error = 'please suppy a valid email';
                                                    });
                                                  }*/
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),

                                /*RaisedButton(
                                              onPressed: () async {
                                                Auth auth = Auth();
                                                User user = await auth.googleSignIn();
                                                if (user == null) {
                                                  _userServices.createUser({
                                                    "name": user.displayName,
                                                    "photo": user.photoUrl,
                                                    "email": user.email,
                                                    "userId": user.uid
                                                  });
                                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
                                                }
                                              },
                                              child: Text(
                                                  'Google SignIn'
                                              ),
                                            ),*/
                                SizedBox(
                                  height: 15,
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.toggleView();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5.0),
                                    color: Colors.blueGrey.withOpacity(0.03),
                                    child: Text(
                                      'I already have an account',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 15
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  error,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  /*Santos
  Future validateForm() async{
    Register register = Register();
    user = await firebaseAuth.currentUser;
    Map value = {
      "username": user.displayName,
      "email": user.email,
      "userId": user.uid,

    };
    if(user == null){
      await firebaseAuth.createUserWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text).then((u) async => {
            _userService.createUser(user.uid.toString(), value),
      }).catchError((e) {
        print(e.toString());
      });

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NavBar()));
    }
  }*/


  //Random video
  /*Future _selectImage(Future<File> pickImage) async {
    File tempImg = await pickImage;
    setState(() => _imageFile = tempImg );

  }

  Widget _displayChild1() {
    if (_imageFile == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(Icons.add, color: Colors.grey,),
      );
    } else {
      return Image.file(_imageFile, fit: BoxFit.fill, width: double.infinity,);
    }
  }

  Future<void> uploadAndSaveData() async {
    if(_imageFile == null) {
      print('all the images must be provided');
    }
    else {
      if(_formKey.currentState.validate()) {
        if(_passwordTextController.text == _confirmPasswordController.text) {
          await uploadToStorage();
        }
      }
    }
  }

  /*displayDialogue(String error) {
    showDialog(context: context,
        builder: (c) {
          return AlertDialog(
            content: Text(
                error
            ),
          );
        });
  }*/

 // String url;

  uploadToStorage() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    final String picture = "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
    Reference reference = storage.ref().child(picture);
    await reference.putFile(_imageFile);

    userImageUrl = await reference.getDownloadURL();
    registerUser();

    //FirebaseAuth _auth = FirebaseAuth.instance;
    //void _registerUser() async{
    //User user;
    //}
  }

  FirebaseAuth _auth = FirebaseAuth.instance;


  //registration
  void registerUser() async {
    User firebaseUser;
    await _auth.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text
    ).then((auth) {
      firebaseUser = auth.user;
    }).catchError((error) {
      Navigator.pop(context);
      print(error.toString());
    });

    if (firebaseUser != null) {
      saveUserInfoToFireStore(firebaseUser).then((value){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => NavBar()));
      });
    }
  }

  Future saveUserInfoToFireStore(User user) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("users").doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "name": _nameTextController.text,
      "url": userImageUrl,
      BookApp.userCartList: ["garbageValue"],
    });

    await BookApp.sharedPreferences.setString(BookApp.userUID, user.uid);
    await BookApp.sharedPreferences.setString(BookApp.userEmail, user.email);
    await BookApp.sharedPreferences.setString(BookApp.userName, _nameTextController.text);
    await BookApp.sharedPreferences.setString(BookApp.userPhotoUrl, userImageUrl);
    await BookApp.sharedPreferences.setStringList(BookApp.userCartList, ["garbageValue"]);
  }*/


// Santos
/*class UserService{
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = 'users';

  createUser(String uid, Map value){
    _database.reference().child("$ref/$uid").set(
        value
    ).catchError((e) {
      print(e.toString());
    });
  }
}*/

//Santos
  /*Future validateForm() async {
    FormState formState = _formKey.currentState;
    UserServices _userServices = UserServices();

    if (formState.validate()) {
      User user = await firebaseAuth.currentUser;
      //if (user == null) {
        await firebaseAuth
            .createUserWithEmailAndPassword(
            email: _emailTextController.text,
            password: _passwordTextController.text)
            .then((user) =>
        {
          _userServices.createUser(
              {
                "username": _nameTextController.text,
                "email": _emailTextController.text,
                "userId": user.uid,

              }
          )
        }).catchError((err) => {print('error is: ' + err.toString())});

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      }
    //}
  }*/
}

class UserServices{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String collection = "users";

  void createUser(Map data) {
    _firestore.collection(collection).doc(data["userId"]).set(data);
  }
}



/* ========================== Net ninja =====================

final FirebaseAuth auth = FirebaseAuth.instance;
class AuthService{



  //create a user object based on User
  TheUser userFromTheUser(User user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<TheUser> get user {
    return auth.authStateChanges()
    //.map((User user) => _userFromTheUser(user));
        .map(userFromTheUser);
  }

  //sign in anom
  Future signInAnom() async{
    try{
      UserCredential result = await auth.signInAnonymously();
      User user = result.user;
      return userFromTheUser(user);
    } catch(e) {
      print(e.toString());
      return null;

    }
  }
  //registration
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return userFromTheUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

    //sign in
  Future signInWithEmailAndPassword(String email, String password) async{
    try{
      UserCredential result = await auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return userFromTheUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async{
    try{
      return await auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }

  }
}

class TheUser {

  final String uid;
  TheUser({
    this.uid,
  });
}*/
