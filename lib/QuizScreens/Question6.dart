import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/Question7.dart';
import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/model/QuizDataModel.dart';

class Question6 extends StatefulWidget {

  QuizData quizData = QuizData();
  Question6({this.quizData});

  @override
  _Question6State createState() => _Question6State();

  int aad = 0;
  int ts = 0;
  int kr = 0;
  int tgdt = 0;

}

class _Question6State extends State<Question6> {

  String chosen;
  bool answered = false;
  String option1 = 'Sweden';
  String option2 = 'A lavish castle in a dystopian world';
  String option3 = 'Afghanistan';
  String option4 = 'Vatican City ';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(15,25,15,20),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Question 6',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      // fontFamily:
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: Text(
                    'Where will you spend your vacation?',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (!answered) {
                            setState(() {
                              chosen = option1;
                              answered = true;
                              widget.tgdt += 1;
                              widget.quizData.tgdt += widget.tgdt;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(10),
                                color: chosen == option1 ?
                                Colors.blueAccent :
                                Colors.white,
                              ),
                              child: Row(
                                  children: [
                                    Text(
                                      'A.  ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        option1,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20
                                        ),
                                      ),
                                    )
                                  ]
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTap: () {
                          if (!answered) {
                            setState(() {
                              chosen = option2;
                              answered = true;
                              widget.ts += 1;
                              widget.quizData.ts += widget.ts;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(10),
                                color: chosen == option2 ?
                                Colors.blueAccent :
                                Colors.white,
                              ),
                              child: Row(
                                  children: [
                                    Text(
                                      'B.  ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        option2,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20
                                        ),
                                      ),
                                    )
                                  ]
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTap: () {
                          if (!answered) {
                            setState(() {
                              chosen = option3;
                              answered = true;
                              widget.kr += 1;
                              widget.quizData.kr += widget.kr;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(10),
                                color: chosen == option3 ?
                                Colors.blueAccent :
                                Colors.white,
                              ),
                              child: Row(
                                  children: [
                                    Text(
                                      'C.  ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        option3,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20
                                        ),
                                      ),
                                    )
                                  ]
                              )
                          ),
                        )
                    ),
                    GestureDetector(
                        onTap: () {
                          if (!answered) {
                            setState(() {
                              chosen = option4;
                              answered = true;
                              widget.aad += 1;
                              widget.quizData.aad += widget.aad;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(10),
                                color: chosen == option4 ?
                                Colors.blueAccent :
                                Colors.white,
                              ),
                              child: Row(
                                  children: [
                                    Text(
                                      'D.  ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        option4,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20
                                        ),
                                      ),
                                    )
                                  ]
                              )
                          ),
                        )
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              if (chosen == option1) {
                                widget.quizData.tgdt -= 1;
                              }
                              else if (chosen == option2) {
                                widget.quizData.ts -= 1;
                              }
                              else if (chosen == option3) {
                                widget.quizData.kr -= 1;
                              }
                              else if (chosen == option4) {
                                widget.quizData.aad -= 1;
                              }
                              chosen = '';
                              answered = false;
                              widget.tgdt = 0;
                              widget.ts = 0;
                              widget.kr = 0;
                              widget.aad = 0;
                            });
                          },
                          child: Text('Reset'),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (c) =>
                              Question7(
                                quizData: widget.quizData,
                              )));
                        },

                      )
                    ],
                  ),
                ),
              ],
            ),
          )
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   iconTheme: IconThemeData(
          //       color: Colors.black
          //   ),
          //   actions: [
          //     IconButton(
          //       icon: Icon(Icons.navigate_next_rounded),
          //       onPressed: () {
          //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question7(
          //           quizData: widget.quizData,
          //         )));
          //       },
          //     )
          //   ],
          // ),
          // body: Column(
          //   children: [
          //     Row(
          //       children: [
          //         Text(
          //           'Question 6',
          //           style: TextStyle(
          //               fontSize: 20,
          //               color: Colors.black
          //           ),
          //         )
          //       ],
          //     ),
          //     SizedBox(
          //       height: 30,
          //     ),
          //     Row(
          //       children: [
          //         Text(
          //           'Where will you spend your vacation?',
          //           style: TextStyle(
          //               fontSize: 20,
          //               color: Colors.black
          //           ),
          //         ),
          //       ],
          //     ),
          //     SizedBox(
          //       height: 20,
          //     ),
          //     Column(
          //       children: [
          //         GestureDetector(
          //             onTap: () {
          //               if (!answered) {
          //                 setState(() {

          //                 });
          //               }
          //             },
          //             child: Container(
          //                 color: chosen == option1 ?
          //                 Colors.blueAccent :
          //                 Colors.white,
          //                 child: Row(
          //                     children: [
          //                       Text(
          //                         'A',
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: 40,
          //                       ),
          //                       Text(
          //                         option1,
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       )
          //                     ]
          //                 )
          //             )
          //         ),
          //         GestureDetector(
          //             onTap: () {
          //               if (!answered) {
          //                 setState(() {

          //                 });
          //               }
          //             },
          //             child: Container(
          //                 color: chosen == option2 ?
          //                 Colors.blueAccent :
          //                 Colors.white,
          //                 child: Row(
          //                     children: [
          //                       Text(
          //                         'B',
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: 40,
          //                       ),
          //                       Text(
          //                         option2,
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       )
          //                     ]
          //                 )
          //             )
          //         ),
          //         GestureDetector(
          //             onTap: () {
          //               if (!answered) {
          //                 setState(() {

          //                 });
          //               }
          //             },
          //             child: Container(
          //                 color: chosen == option3 ?
          //                 Colors.blueAccent :
          //                 Colors.white,
          //                 child: Row(
          //                     children: [
          //                       Text(
          //                         'C',
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: 40,
          //                       ),
          //                       Text(
          //                         option3,
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       )
          //                     ]
          //                 )
          //             )
          //         ),
          //         GestureDetector(
          //             onTap: () {
          //               if (!answered) {
          //                 setState(() {

          //                 });
          //               }
          //             },
          //             child: Container(
          //                 color: chosen == option4 ?
          //                 Colors.blueAccent :
          //                 Colors.white,
          //                 child: Row(
          //                     children: [
          //                       Text(
          //                         'D',
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: 40,
          //                       ),
          //                       Text(
          //                         option4,
          //                         style: TextStyle(
          //                             color: Colors.black,
          //                             fontSize: 20
          //                         ),
          //                       )
          //                     ]
          //                 )
          //             )
          //         )
          //       ],
          //     ),
          //     SizedBox(height: 100,),
          //     MaterialButton(
          //       onPressed: () {
          //         setState(() {

          //         });
          //       },
          //       child: Text('Reset'),
          //     ),
          //   ],
          // )
      ),
    );
  }
}