import 'package:abc/demo/app/demo_main_app.dart';

import '../app.dart';

class ScaffoldDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaffoldDemoAbcState();
  }
}

class _ScaffoldDemoAbcState extends State<ScaffoldDemoAbc> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: AppBar(
        title: Text("ScaffoldDemoAbc"),
        actions: <Widget>[icon(), icon()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: icon(),
      ),
      drawer: Drawer(
        child: ListView(
          children: demoItems,
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: demoItems,
        ),
      ),
      body: ListView(
        children: demoItems,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: icon(), title: text()),
          BottomNavigationBarItem(icon: icon(), title: text()),
          BottomNavigationBarItem(icon: icon(), title: text()),
          BottomNavigationBarItem(icon: icon(), title: text()),
        ],
        currentIndex: index,
        onTap: onBottomNavigationChange,
      ),
    );
  }

  void onBottomNavigationChange(int value) {
    setState(() {
      index = value;
    });
  }
}
