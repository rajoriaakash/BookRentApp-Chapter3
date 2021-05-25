import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/model/QuizDataModel.dart';
import 'package:test_app/QuizScreens/Question8.dart';

class Question7 extends StatefulWidget {

  QuizData quizData = QuizData();
  Question7({this.quizData});

  @override
  _Question7State createState() => _Question7State();

  int aad = 0;
  int ts = 0;
  int kr = 0;
  int hppa = 0;

}

class _Question7State extends State<Question7> {

  String chosen;
  bool answered = false;
  String option1 = 'I love when books make my heart beat faster';
  String option2 = 'I love when the book keeps me guessing';
  String option3 = 'I love when the book makes me ugly cry';
  String option4 = 'I love when the protagonists fall in love and have a happy ending ';

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
                    'Question 7',
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
                    'What is your favorite part about a book?',
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
                              widget.hppa += 1;
                              widget.quizData.hppa += widget.hppa;
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
                              widget.ts += 1;
                              widget.quizData.ts += widget.ts;
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height * 0.13,
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
                                widget.quizData.hppa -= 1;
                              }
                              else if (chosen == option2) {
                                widget.quizData.aad -= 1;
                              }
                              else if (chosen == option3) {
                                widget.quizData.kr -= 1;
                              }
                              else if (chosen == option4) {
                                widget.quizData.ts -= 1;
                              }
                              chosen = '';
                              answered = false;
                              widget.hppa = 0;
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
                              Question8(
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
          //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => Question8(
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
          //           'Question 7',
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
          //           'What is your favorite part about a book?',
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