import 'package:flutter/material.dart';
import 'package:flutter_wattsapp_clone/pages/calls_screen.dart';
import 'package:flutter_wattsapp_clone/pages/camera_screen.dart';
import 'package:flutter_wattsapp_clone/pages/chats_screen.dart';
import 'package:flutter_wattsapp_clone/pages/status_screen.dart';
import 'package:flutter_wattsapp_clone/theme_bloc.dart';
import 'package:flutter_wattsapp_clone/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(_handleTabIndex);
    themeBloc.changeTheme(Themes.whapsapp);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: new AppBar(
          title: new Text("WhatsApp Clone"),
          elevation: 0.7,
          backgroundColor:  new Color(0xff075E54),
          bottom: new TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.camera_alt)),
              new Tab(text: "CHATS"),
              new Tab(text: "STATUS"),
              new Tab(text: "CALLS"),
            ],
          ),
          actions: <Widget>[
            new Icon(Icons.search),
            new Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
            ),
            new Icon(Icons.more_vert),
          ],
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            new CameraScreen(),
            new ChatsScreen(),
            new StatusScreen(),
            new CallsScreen(),
          ],
        ),
        floatingActionButton: _bottomButtons());

  }
  void _handleTabIndex() {
    setState(() {});
  }

  Widget _bottomButtons() {
    switch (_tabController.index) {
      case 1:
        {
          return new FloatingActionButton(
            backgroundColor: new Color(0xff25D366),
            child: new Icon(Icons.message, color: Colors.white),
            onPressed: () => print('Hola!!'),
          );
        }
      case 2:
        {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: new FloatingActionButton(
                  backgroundColor: Colors.grey[200],
                  child: new Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () => print('Hola!!'),
                ),
              ),
              new FloatingActionButton(
                backgroundColor: new Color(0xff25D366),
                child: new Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                onPressed: () => print('Hola!!'),
              ),
            ],
          );
        }
      case 3:
        {
          return new FloatingActionButton(
            backgroundColor: new Color(0xff25D366),
            child: new Icon(Icons.add_call, color: Colors.white),
            onPressed: () => print('Hola!!'),
          );
        }
      default:
        return null;
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    themeBloc.changeTheme(Themes.light);
    super.dispose();
  }
}
