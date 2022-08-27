// ignore_for_file: deprecated_member_use

import 'package:cryptocase/models/userTxt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:story/story_page_view/story_page_view.dart';
import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCase',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 208,236,252),
        title: Text("Cryptocase",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        
        ),
        floatingActionButtonLocation :FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return storyPage();
            },
          )
        );
      },
      child: Icon(Icons.ac_unit_sharp,color: Color.fromARGB(255, 208,236,252),),
    ),
    );
  }
}

class storyPage extends StatefulWidget {

  final userList=[user([userTxt("Story1"),userTxt("Story2"),userTxt("Story3")],"user1"),
    user([userTxt("Story1"),userTxt("Story2")],"user2")
  ];
  
  @override
  State<storyPage> createState() => _storyPageState();
}

class _storyPageState extends State<storyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Risk",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold ),),backgroundColor: Color.fromARGB(255, 208,236,252),elevation: 0),
      body: Container(
        child: StoryPageView(
          itemBuilder:((context, pageIndex, storyIndex) {
            final userNo = widget.userList[pageIndex];
            final storyNo = userNo.text[storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(color: Color.fromARGB(255, 208,236,252)),
                ),
                Positioned.fill(
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        padding: EdgeInsets.all(50),
                        child:Text(userNo.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 200,),
                      Container(
                        height: 300,
                        child:Text(storyNo.text,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
                ],
            );
            
          }
          ),
          pageLength: widget.userList.length,
          storyLength: (int pageIndex) {
            return widget.userList[pageIndex].text.length;
            return 0;
          },
          onPageLimitReached: () {
           Navigator.pop(context); 
          }
          
    ),
        )
    );
  }
}

// Column(
//         children:[
        // Container(
        // child: Image.asset("assets/images/wallpaper.png"),
        // height: 800,
        // ),]
//         )