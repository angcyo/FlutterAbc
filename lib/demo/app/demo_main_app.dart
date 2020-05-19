import 'package:angcyo_flutter_app/angcyo_flutter_app.dart';

import 'app.dart';
import 'demo.dart';

const String title = "FlutterAbc Demo";

/// 主程序入口
class DemoMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Color(0xFFF4F4F4)),
      home: DemoMainWidget(),
    );
  }
}

/// 主页面
class DemoMainWidget extends StatelessWidget {
  final List<Widget> demoItems = List.from([
    DemoItemWidget("1.Test" * 2, (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => WidgetDemoAbc()));
    }),
    DemoItemWidget("2.Test" * 20, (context) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => ButtonDemoAbc()));
    }),
  ]);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView(
        children: demoItems,
      ),
    );
  }
}

///主页面 item widget
class DemoItemWidget extends StatelessWidget {
  DemoItemWidget(this.itemText, this.onTap, {Key key}) : super(key: key);

  final String itemText;
  final Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 1),
        child: GestureDetector(
          onTap: () {
            debug(context);
            info(context);
            warn(context);
            error(context);
          },
          child: Material(
            child: Ink(
              child: InkWell(
                onTap: () {
                  onTap(context);
                },
                child: Container(
                  padding:
                      EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FlutterLogo(),
                      Expanded(
                        child: Text(
                          itemText,
                        ),
                      ),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
