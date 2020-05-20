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

final List<Widget> demoItems = List.from([
  Container(height: 10),
  DemoItemWidget("1.WidgetDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => WidgetDemoAbc()));
  }),
  DemoItemWidget("2.ButtonDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ButtonDemoAbc()));
  }),
  DemoItemWidget("3.ImageDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ImageDemoAbc()));
  }),
  DemoItemWidget("4.CheckDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => CheckDemoAbc()));
  }),
  DemoItemWidget("5.EditDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => EditDemoAbc()));
  }),
  DemoItemWidget("6.IndicatorDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => IndicatorDemoAbc()));
  }),
  DemoItemWidget("7.ScaffoldDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ScaffoldDemoAbc()));
  }),
  DemoItemWidget("8.TabDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => TabDemoAbc()));
  }),
  DemoItemWidget("9.ClipDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ClipDemoAbc()));
  }),
  DemoItemWidget("10.GridDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => GridDemoAbc()));
  }),
  DemoItemWidget("11.StaggeredDemo", (context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => StaggeredDemoAbc()));
  }),
]);

/// 主页面
class DemoMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        drawer: Drawer(
          child: ListView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            children: <Widget>[
              FlutterLogo(size: 120),
              WellItemWidget(
                child: Text("浏览Github"),
                onPressed: () {
                  browseUrl(context, GITHUB_URL);
                },
              ),
              WellItemWidget(
                child: Text("打开Github"),
                onPressed: () {
                  launcher(GITHUB_URL);
                },
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: demoItems.length,
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemBuilder: (ctx, index) {
              return demoItems[index];
            }));
  }
}

///主页面 item widget
class DemoItemWidget extends StatelessWidget {
  DemoItemWidget(this.itemText, this.onTap, {Key key}) : super(key: key);

  final String itemText;
  final Function(BuildContext) onTap;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

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
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 50),
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: FlutterLogo(),
                        ),
                        Expanded(
                          child: Text(
                            itemText,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: themeData.accentColor,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
