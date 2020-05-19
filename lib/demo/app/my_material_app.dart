import 'package:abc/demo/widget/tabs.dart';
import 'package:angcyo_flutter_app/angcyo_flutter_app.dart';

import 'app.dart';

class MyMaterialApp extends StatefulWidget {
  final List<Widget> tabs = <Widget>[Tab1(), Tab2(), Tab3()];

  @override
  _MyMaterialAppState createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {

  var _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: tx(),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 4,
            title: Text(tx()),
          ),
          body: widget.tabs[_index],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.print), title: Text(tx())),
              BottomNavigationBarItem(
                  icon: Icon(Icons.adb), title: Text(tx())),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_to_home_screen), title: Text(tx())),
            ],
            currentIndex: _index,
            onTap: (index) {
              setState(() {
                _index = index;
              });
            },
          )),
    );
  }
}
