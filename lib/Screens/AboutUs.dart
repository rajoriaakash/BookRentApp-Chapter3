import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  
    List members = [
      {
        "imageUrl" : 'images/ProPic.jpeg',
        "name" : 'Name1',
        "bio" : 'Bio1'
      },
      {
        "imageUrl" : 'images/ProPic.jpeg',
        "name" : 'Name2',
        "bio" : 'Bio2',
      },
      {
        "imageUrl" : 'images/ProPic.jpeg',
        "name" : 'Name3',
        "bio" : 'Bio3',
      }
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          pauseAutoPlayOnTouch: true,
          aspectRatio: 2.0,
        ),
        items: members.map((member) {
          return Builder(
              builder: (BuildContext context){
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius:
                          new BorderRadius.circular(10.0)
                      ),

                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          child: Column(
                            children: [
                              Card(
                                // radius: 80,
                                child: Image.asset(member['imageUrl']),
                                // backgroundImage: AssetImage(member['imageUrl']),
                              ),
                              Divider(height: 30,),
                              Text(
                                member['name'],
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              SizedBox(height: 18,),
                              Text(
                                member['bio'],
                                style: TextStyle(
                                    fontSize: 15
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );


                // return Container(
                //   child: Text(member['name'].toString()),
                // );
              }

          );
        }).toList(),
        // items: [

        // ],
      ),

    );
  }
}
