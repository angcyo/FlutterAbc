import 'package:angcyo_flutter_app/angcyo_flutter_app.dart';

import 'app.dart';
import 'demo.dart';

const String title = "FlutterAbc Demo";

/// 主程序入口
class DemoMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        dismissOtherOnShow: true,
        position: ToastPosition.bottom,
        child: MaterialApp(
          title: title,
          theme: ThemeData(
              primarySwatch: Colors.blue, backgroundColor: Color(0xFFF4F4F4)),
          home: DemoMainWidget(),
        ));
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
  DemoItemWidget("13.InheritedWidgetDemo", InheritedWidgetDemoAbc()),
  DemoItemWidget("14.DialogDemo", DialogDemoAbc()),
  DemoItemWidget("15.AnimationDemo", AnimationDemoAbc()),
]);

Widget demoListView() => ListView.builder(
    physics: absPhysics,
    itemCount: demoItems.length,
    itemBuilder: (ctx, index) => demoItems[index]);

/// 主页面
class DemoMainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoMainWidgetState();
}

class _DemoMainWidgetState extends State<DemoMainWidget> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return WillPopScope(
        child: Scaffold(
            backgroundColor: themeData.backgroundColor,
            appBar: GradientAppBar(
              centerTitle: true,
              gradientStart: themeData.primaryColor,
              gradientEnd: themeData.primaryColorDark,
              title: Text(title),
            ),
            drawer: Drawer(
                child: Container(
              color: themeData.backgroundColor,
              child: ListView(
                physics: absPhysics,
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
            body: NotificationListener<ScrollNotification>(
                onNotification: (notification) {
                  info(notification);
                  return true;
                },
                child: ListView.builder(
                    itemCount: demoItems.length,
                    physics: absPhysics,
                    itemBuilder: (ctx, index) {
                      return demoItems[index];
                    }))),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            toast("再按一次退出");
            return false;
          }
          return true;
        });
  }
}

///主页面 item widget
class DemoItemWidget extends StatelessWidget {
  DemoItemWidget(
    this.itemText,
    this.routePage, {
    Key key,
    this.onTap,
  })  : assert(routePage != null || onTap != null),
        super(key: key);

  final String itemText;
  final Widget routePage;
  final Function(BuildContext) onTap;

  void onPress(BuildContext context) {
    if (onTap != null) {
      onTap(context);
    } else if (routePage != null) {
      //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => routePage));
      Navigator.of(context).push(Right2LeftRouter(targetPage: routePage));
      //Navigator.of(context).push(Bottom2UpRouter(targetPage: routePage));
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    final heroTag = itemText.substring(itemText.indexOf(".") + 1) + "Abc";

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
            type: MaterialType.canvas,
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
                        child: Hero(
                          tag: heroTag,
                          child: Text(
                            itemText,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
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
        ));
  }
}
