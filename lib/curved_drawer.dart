import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:flutter/material.dart';

import 'collapse_drawer.dart';

class CurvedDrawerPage extends StatefulWidget {
  const CurvedDrawerPage({Key? key}) : super(key: key);

  @override
  _CurvedDrawerPageState createState() => _CurvedDrawerPageState();
}

class _CurvedDrawerPageState extends State<CurvedDrawerPage> {
  int index = 0;
  double leftWidth = 75.0;
  int leftTextColor = 1;
  int leftBackgroundColor = 0;
  double rightWidth = 75.0;
  int rightTextColor = 1;
  int rightBackgroundColor = 0;
  final List<Color> colorPallete = <Color>[
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.blueAccent,
    Colors.red,
    Colors.redAccent,
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.lime,
    Colors.green
  ];
  List<DrawerItem> _drawerItems = <DrawerItem>[
    DrawerItem(icon: Icon(Icons.people), label: "People"),
    DrawerItem(icon: Icon(Icons.trending_up), label: "Trending"),
    DrawerItem(icon: Icon(Icons.tv)),
    DrawerItem(icon: Icon(Icons.work), label: "Work"),
    DrawerItem(icon: Icon(Icons.web)),
    DrawerItem(icon: Icon(Icons.videogame_asset)),
    DrawerItem(icon: Icon(Icons.book), label: "Book"),
    DrawerItem(icon: Icon(Icons.call), label: "Telephone")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CollapseDrawer(),
                    ));
              },
              icon: Icon(Icons.home))
        ],
        leading: IconButton(
          icon: Icon(Icons.next_plan),
          color: Colors.black,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CollapseDrawer(),
              )),
        ),
        title:
            Text('Curved Drawer', style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      drawer: SafeArea(
        child: CurvedDrawer(
          index: index,
          width: leftWidth,
          color: colorPallete[leftBackgroundColor],
          buttonBackgroundColor: colorPallete[leftBackgroundColor],
          labelColor: colorPallete[leftTextColor],
          items: _drawerItems,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
        ),
      ),
      endDrawer: SafeArea(
        child: CurvedDrawer(
          index: index,
          width: rightWidth,
          color: colorPallete[rightBackgroundColor],
          buttonBackgroundColor: colorPallete[rightBackgroundColor],
          labelColor: colorPallete[rightTextColor],
          isEndDrawer: true,
          items: _drawerItems,
          onTap: (newIndex) {
            setState(() {
              index = newIndex;
            });
          },
        ),
      ),
    );
  }
}
