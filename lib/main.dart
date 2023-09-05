import 'package:bottonm_navigation/Home.dart';
import 'package:bottonm_navigation/Profile.dart';
import 'package:flutter/material.dart';

import 'Add.dart';
import 'Search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int selectedIndex=0;
  // List<Widget> widgets=[
  //   Text("Home"),
  //   Text("Search"),
  //   Text("Add"),
  //   Text("Profile"),
  // ];
  PageController pageController=PageController();

  void onTapped(int index){
    setState(() {
      selectedIndex=index;
    });
    pageController.jumpToPage(index);  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        items:const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,),label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,),label: "Add"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded,),label: "Profile"),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
      // body: Center(child: Container(
      //   color: Colors.blue,
      //     width: 200,
      //     height: 200,
      //     child: Center(child: widgets.elementAt(selectedIndex))))
      body: PageView(
        controller: pageController,
        children: [
          Home(),
          Search(),
          Add(),
          Profile(),
        ],
      ),
    );
  }
}
