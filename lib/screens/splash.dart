import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:splash/components/splashComp.dart';
import 'package:splash/components/textComp.dart';

import 'login.dart';
class splash extends StatefulWidget {
 
  
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  PageController _controller=PageController();
  bool lastSplash=false;
  int counter=0;

  List<String>mainTextList=[
  ' Welcome to',
  ' Buy Quality\nDairy Products',
  'Buy Premium\nQuality Fruits',
  ' Get Discounts\nOn All Products'
  ];
     
     String desTextList='Lorem ipsum dolor sit amet, consetetur\n  sadipscing elitr, sed diam nonumy';
  // List<String>desTextList=[
  // 'Lorem ipsum dolor sit amet, consetetur\n  sadipscing elitr, sed diam nonumy',
  // 'Lorem ipsum dolor sit amet, consetetur\n  sadipscing elitr, sed diam nonumy',
  // 'Lorem ipsum dolor sit amet, consetetur\n  sadipscing elitr, sed diam nonumy',
  // 'Lorem ipsum dolor sit amet, consetetur\n  sadipscing elitr, sed diam nonumy'
  // ];
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Stack(
        children: [
          
          PageView(
            onPageChanged: (value) {
              setState(() {
                counter=value;
                lastSplash= value==3;
              });
            },
            controller: _controller,
            children: [
              splashComp(pic: 'assets/pic1.jpg', color: Color.fromARGB(255,238,238,234),),
              splashComp(pic: 'assets/pic2.jpg'),
              splashComp(pic: 'assets/pic3.jpg',color: Color.fromARGB(255,215,212,210),),
              splashComp(pic: 'assets/pic4.jpg'),
            ],

          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          
                          GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(0);
                              
                            },
          
                            child: Text('Back' ,style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),),
                            
          
                          ),
                          SizedBox(width: 40,),

                          lastSplash?
                          GestureDetector(
                            onTap: () {
                            Navigator.push(context, 
                            MaterialPageRoute(
                               builder: (context) {
                                 return login();
                               },
                            ));
                            },
                            
                            child: Text('Next' ,style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),),
          
          
                          )
                          :
                          GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                duration: Duration(milliseconds: 500),
                                 curve: Curves.easeIn);
                            },
                            
                            child: Text('Next' ,style: TextStyle(
                              fontSize: 16,
                              color: Colors.green,
                            ),),
          
          
                          ),
                          //main and description Text

                          
                        ],
                      ),
                      SizedBox(height: 24,),
                      textComp(mainText: mainTextList[counter], descriptionText: desTextList)
                          
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 64),
            child: Container(
              
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(controller: _controller,count: 4,
              effect: SlideEffect(
                    activeDotColor: Colors.green,
                    dotHeight: 10,
                    dotColor: Colors.grey,
                    dotWidth: 10,
                  ), ),
            ),
          )
        ],
      )
    );
  }
}