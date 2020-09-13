import 'package:flutter/material.dart';
import 'file:///F:/flutter/lottie_flutter/lottie_flutter/lib/pages/FeaturePage.dart';
import 'file:///F:/flutter/lottie_flutter/lottie_flutter/lib/pages/PopularPage.dart';
import 'file:///F:/flutter/lottie_flutter/lottie_flutter/lib/pages/RecentPage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lottie flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'lottie flutter'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> pages = List<Widget>();

  @override
  void initState() {
    pages.add(RecentPage());
    pages.add(PopularPage());
    pages.add(FeaturePage());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: pages[_selectedIndex],),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            title: Text('Recent'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Popular'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            title: Text('Feature'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }
}
