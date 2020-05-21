import '../app.dart';

class InheritedWidgetDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetDemoAbcState();
}

/// 数据共享Widget
class DataShareWidget extends InheritedWidget {
  double num;
  String msg;

  DataShareWidget({Widget child}) : super(child: child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static DataShareWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataShareWidget>();
  }

  @override
  bool updateShouldNotify(DataShareWidget oldWidget) {
    final result = oldWidget.num != num || oldWidget.msg != msg;
    warn("DataShareWidget updateShouldNotify this... $result");
    return result;
  }
}

class _InheritedWidgetDemoAbcState extends State<InheritedWidgetDemoAbc> {
  @override
  Widget build(BuildContext context) {
    return DataShareWidget(
      child: _InheritedWidgetTest(),
    );
  }

  @override
  void didChangeDependencies() {
    warn("_InheritedWidgetDemoAbcState didChangeDependencies this...");
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    super.didChangeDependencies();
  }
}

class _InheritedWidgetTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _InheritedWidgetTestState();
}

class _InheritedWidgetTestState extends State<_InheritedWidgetTest> {
  @override
  Widget build(BuildContext context) {
    final dataShare = DataShareWidget.of(context);

    return BaseDemoAbc(
      "InheritedWidgetAbc",
      scroll: true,
      children: <Widget>[
        DataShareWidget(
          child: Placeholder(),
        ),
        Text(dataShare.msg ?? "!null!"),
        FlatButton(
            onPressed: () {
              setState(() {
                dataShare.msg =
                    'change to->${DateTime.now().toIso8601String()}';
              });
              info(dataShare.msg);
            },
            child: Text("change it"))
      ],
    );
  }

  @override
  void didChangeDependencies() {
    warn("_InheritedWidgetTestState didChangeDependencies this...");
    super.didChangeDependencies();
  }
}
