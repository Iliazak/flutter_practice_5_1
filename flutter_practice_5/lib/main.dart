import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _controller;

  void toggleBottomSheet() {
    if (_controller == null) {
      _controller = scaffoldKey.currentState!.showBottomSheet(
        (context) => Container(
          height: 180,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.wallet),
                  Text('Сумма'),
                  Text('200 руб'),
                ],
              ),
              SizedBox(
                height: 28,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text('Оплатить'),
                  style: TextButton.styleFrom(
                      primary: Colors.black, backgroundColor: Colors.grey))
            ],
          ),
        ),
      );
    } else {
      _controller!.close();
      _controller = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Home Page',
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Flutter Demo Home Page'),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.person)),
            )
          ],
        ),
        endDrawer: Drawer(
          child: Center(
            child: DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Ilia Zakurdaev"),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                  child: Text('Ilia Zak'),
                ),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                title: Text("Profile"),
                leading: Icon(Icons.perm_contact_calendar_sharp),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                title: Text("Images"),
                leading: Icon(Icons.image_sharp),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 400, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {},
                      child: Text('Выход'),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {},
                      child: Text('Регистрация'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: BottomNavigationBar(
              elevation: 1,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Photo'),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.album), label: 'Albums'),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            toggleBottomSheet();
          },
        ),
      ),
    );
  }
}
