import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NavRails Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NavRail(),
    );
  }
}

class NavRail extends StatefulWidget {
  @override
  _NavRailState createState() => _NavRailState();
}

class _NavRailState extends State<NavRail> {
  int selectedIndex = 0;

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          NavigationRail(
            labelType: NavigationRailLabelType.all,
            selectedIconTheme: IconThemeData(color: Colors.green),
            unselectedIconTheme: IconThemeData(color: Colors.blueGrey),
            selectedLabelTextStyle: TextStyle(color: Colors.green),
            unselectedLabelTextStyle: TextStyle(color: Colors.blueGrey),
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeIn);
              });
            },
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.info),
                label: Text('About'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.message),
                label: Text('Feedback'),
              ),
            ],
          ),
          Expanded(
              child: PageView(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.indigo,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
