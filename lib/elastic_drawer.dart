import 'package:animated_drawers/collapse_drawer.dart';
import 'package:animated_drawers/curved_drawer.dart';
import 'package:flutter/material.dart';
import 'package:elastic_drawer/elastic_drawer.dart';

class ElasticDrawerPage extends StatefulWidget {
  const ElasticDrawerPage({Key? key}) : super(key: key);

  @override
  _ElasticDrawerPageState createState() => _ElasticDrawerPageState();
}

class _ElasticDrawerPageState extends State<ElasticDrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.next_plan),
              color: Colors.black,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CurvedDrawerPage(),
                  )),
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CollapseDrawer(),
                )),
          ),
          title: Text('Elastic Drawer',
              style: Theme.of(context).textTheme.headline5),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: ElasticDrawer(
          mainColor: Colors.white,
          drawerColor: const Color(0xff3C3F41),
          mainChild: const Center(
            child: Text(
              'MAIN page',
              style: TextStyle(color: Colors.black54, fontSize: 30),
            ),
          ),
          drawerChild: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                      MaterialPageRoute(
                          builder: (context) => const YellowPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'YELLOW page',
                    style: TextStyle(
                        color: Color(0xfff4c20d),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                      MaterialPageRoute(
                          builder: (context) => const GreenPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'GREEN page',
                    style: TextStyle(
                        color: Color(0xff3cba54),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  ElasticDrawerKey.drawer.currentState
                      ?.closeElasticDrawer(context);
                  ElasticDrawerKey.navigator.currentState?.push(
                      MaterialPageRoute(builder: (context) => const RedPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'RED page',
                    style: TextStyle(
                        color: Color(0xffdb3236),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pop()),
        color: const Color(0xff3cba54));
  }
}

class YellowPage extends StatelessWidget {
  const YellowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pop()),
        color: const Color(0xfff4c20d));
  }
}

class RedPage extends StatelessWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
            icon: Icon(Icons.home),
            onPressed: () => Navigator.of(context).pop()),
        color: const Color(0xffdb3236));
  }
}
