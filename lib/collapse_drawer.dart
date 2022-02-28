import 'package:animated_drawers/elastic_drawer.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CollapseDrawer extends StatefulWidget {
  const CollapseDrawer({Key? key}) : super(key: key);

  @override
  _CollapseDrawerState createState() => _CollapseDrawerState();
}

class _CollapseDrawerState extends State<CollapseDrawer> {
  List<CollapsibleItem>? _item;
  String? head;

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
          text: 'Email',
          icon: Icons.email,
          onPressed: () {
            setState(() {
              head = 'Email';
            });
          },
          isSelected: true),
      CollapsibleItem(
          text: 'Password',
          icon: Icons.lock,
          onPressed: () {
            setState(() {
              head = 'Password';
            });
          }),
      CollapsibleItem(
          text: 'Home',
          icon: Icons.home_outlined,
          onPressed: () {
            setState(() {
              head = 'Home';
            });
          }),
      CollapsibleItem(
          text: 'Person',
          icon: Icons.person_outline_sharp,
          onPressed: () {
            setState(() {
              head = 'Person';
            });
          }),
    ];
  }

  @override
  void initState() {
    super.initState();
    _item = _generateItems;
    head = _item!.firstWhere((item) => item.isSelected).text;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.next_plan),
          color: Colors.black,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ElasticDrawerPage(),
              )),
        ),
        title: Text('Collapsible Drawer',
            style: Theme.of(context).textTheme.headline5),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey[50],
      ),
      body: SafeArea(
        child: CollapsibleSidebar(
          isCollapsed: true,
          items: _item!,
          title: 'Abdullah Khan',
          onTitleTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
          },
          body: _body(size, context),
          backgroundColor: Colors.black,
          selectedTextColor: Colors.lightBlueAccent,
          // textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
          titleStyle: const TextStyle(
              fontSize: 20,
              // fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          toggleTitleStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          sidebarBoxShadow: [],
        ),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 35, right: 20),
      height: double.infinity,
      width: double.infinity,
      color: Colors.blueGrey[50],
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 2,
          child: Transform.translate(
            offset: Offset(-size.height * 0.3, -size.width * 0.23),
            child: Text(
              head!,
              style: Theme.of(context).textTheme.headline1,
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ),
      ),
    );
  }
}
