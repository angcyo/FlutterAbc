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
  DemoItemWidget("1.WidgetDemo", WidgetDemoAbc()),
  DemoItemWidget("2.ButtonDemo", ButtonDemoAbc()),
  DemoItemWidget("3.ImageDemo", ImageDemoAbc()),
  DemoItemWidget("4.CheckDemo", CheckDemoAbc()),
  DemoItemWidget("5.EditDemo", EditDemoAbc()),
  DemoItemWidget("6.IndicatorDemo", IndicatorDemoAbc()),
  DemoItemWidget("7.ScaffoldDemo", ScaffoldDemoAbc()),
  DemoItemWidget("8.TabDemo", TabDemoAbc()),
  DemoItemWidget("9.ClipDemo", ClipDemoAbc()),
  DemoItemWidget("10.GridDemo", GridDemoAbc()),
  DemoItemWidget("11.StaggeredDemo", StaggeredDemoAbc()),
  DemoItemWidget("12.CustomScrollDemo", CustomScrollDemoAbc()),
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
            child: Container(
          color: themeData.backgroundColor,
          child: ListView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            children: <Widget>[
              FlutterLogo(size: 120),
              WhiteListTile(
                title: Text("浏览Github"),
                onTap: () {
                  browseUrl(context, GITHUB_URL);
                },
              ),
              WhiteListTile(
                title: Text("打开Github"),
                onTap: () {
                  launcher(GITHUB_URL);
                },
              ),
              WellItemWidget(
                child: Text("WellItemWidget Test"),
                onPressed: () {
                  toast("${DateTime.now()}");
                },
              ),
              Expanded(
                  child: Align(
                heightFactor: 5,
                child: Text(DateTime.now().toString()),
              ))
            ],
          ),
        )),
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
  DemoItemWidget(
    this.itemText,
    this.route, {
    Key key,
    this.onTap,
  })  : assert(route != null || onTap != null),
        super(key: key);

  final String itemText;
  final Widget route;
  final Function(BuildContext) onTap;

  void onPress(BuildContext context) {
    if (onTap != null) {
      onTap(context);
    } else if (route != null) {
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => route));
    }
  }

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
                  onPress(context);
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
