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

  final storyList=[story([userTxt("assets/images/s1.png"),
  userTxt("assets/images/s2.png"),
  userTxt("assets/images/s3.png")],
  "assets/images/stonks.png")];
  
  @override
  State<storyPage> createState() => _storyPageState();
}

class _storyPageState extends State<storyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: const BackButton(color: Colors.black,),
      title: Text("Risk", style: TextStyle(color: Colors.black,fontSize: 30),),
      backgroundColor:Color.fromARGB(255, 208,236,252),
      elevation: 0,
      //shadowColor:Color.fromARGB(0, 255, 255, 255) ,
      ),
      body: Container(
        child: StoryPageView(
          itemBuilder:((context, pageIndex, storyIndex) {
            final userNo = widget.storyList[pageIndex];
            final storyNo = userNo.number[storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(color:Color.fromARGB(255, 208,236,252)),
                ),
                Positioned.fill(
                  child: Image.asset(storyNo.text),
                ),
              ],
            );
          }
          ),
          pageLength: widget.storyList.length,
          storyLength: (int pageIndex) {
            return widget.storyList[pageIndex].number.length;
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

// Column(
//         children:<Widget> [
//           Container(
//             color: Color.fromARGB(255, 208,236,252),
//             margin: EdgeInsets.fromLTRB(0, 63, 0, 0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [         
//               Container(child: Icon(Icons.chevron_left),width: 11.47, height: 19.92,),
//               Container(child:Text("Risk",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),margin: EdgeInsets.only(left: 72),),
//             ],
//           ),
//           ),