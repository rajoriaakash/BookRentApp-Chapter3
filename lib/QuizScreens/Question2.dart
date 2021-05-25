import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/QuizScreens/Question1.dart';
import 'package:test_app/QuizScreens/Question3.dart';
import 'package:test_app/QuizScreens/QuizResult.dart';
import 'package:test_app/model/QuizDataModel.dart';

class Question2 extends StatefulWidget {

  QuizData quizData = QuizData();
  Question2({this.quizData});

  @override
  _Question2State createState() => _Question2State();

  int hppa = 0;
  int tug = 0;
  int pfo = 0;
  int tgdt = 0;

}

class _Question2State extends State<Question2> {

  String chosen;
  bool answered = false;
  String option1 = 'Fancy restaurant';
  String option2 = 'Backpacking through Europe';
  String option3 = 'An adventurous date in a fantasy world';
  String option4 = 'Pizza date with fav true crime podcasts';

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
                    'Question 2',
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
                    'Where would you like to go on a date?',
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
                              widget.tug += 1;
                              widget.quizData.tug += widget.tug;
                            });
                            print(widget.quizData.tgdt);
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
                              widget.pfo += 1;
                              widget.quizData.pfo += widget.pfo;
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
                                widget.quizData.tug -= 1;
                              }
                              else if (chosen == option2) {
                                widget.quizData.pfo -= 1;
                              }
                              else if (chosen == option3) {
                                widget.quizData.hppa -= 1;
                              }
                              else if (chosen == option4) {
                                widget.quizData.tgdt -= 1;
                              }
                              chosen = '';
                              answered = false;
                              widget.tgdt = 0;
                              widget.pfo = 0;
                              widget.hppa = 0;
                              widget.tug = 0;
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
                              Question3(
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

      ),
    );
  }
}
