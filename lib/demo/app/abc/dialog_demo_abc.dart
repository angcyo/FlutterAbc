import 'package:abc/demo/app/demo_main_app.dart';
import 'package:flutter/cupertino.dart';

import '../app.dart';

class DialogDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DialogDemoAbcState();
}

class _DialogDemoAbcState extends State<DialogDemoAbc> {
  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      "DialogDemoAbc",
      children: <Widget>[
        RaisedButton(
          onPressed: _alertDialog,
          child: Text("AlertDialog"),
        ),
        RaisedButton(
          onPressed: _alertDialog2,
          child: Text("AlertDialog2"),
        ),
        RaisedButton(
          onPressed: _simpleDialog,
          child: Text("SimpleDialog"),
        ),
        RaisedButton(
          onPressed: _dialog,
          child: Text("Dialog"),
        ),
        RaisedButton(
          onPressed: _dialog2,
          child: Text("Dialog2"),
        ),
        RaisedButton(
          onPressed: _generalDialog,
          child: Text("GeneralDialog"),
        ),
        RaisedButton(
          onPressed: _aboutDialog,
          child: Text("AboutDialog"),
        ),
        RaisedButton(
          onPressed: _modalBottomSheet,
          child: Text("ModalBottomSheet"),
        ),
        RaisedButton(
          onPressed: _bottomSheet,
          child: Text("BottomSheet"),
        ),
        RaisedButton(
          onPressed: _cupertinoDialog,
          child: Text("CupertinoDialog"),
        ),
        RaisedButton(
          onPressed: _loadingDialog,
          child: Text("LoadingDialog"),
        ),
        RaisedButton(
          onPressed: _datePicker,
          child: Text("DatePicker"),
        ),
        RaisedButton(
          onPressed: _datePicker2,
          child: Text("DatePicker2"),
        ),
      ],
    );
  }

  void _alertDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("title"),
            content: Text("content"),
            actions: <Widget>[
              FlatButton(
                onPressed: _back,
                child: text(),
              ),
              FlatButton(
                onPressed: _back,
                child: text(),
              ),
            ],
          );
        });
  }

  void _alertDialog2() async {
    final result = await showDialog(
        context: context,
        barrierDismissible: false, //点击对话框外, 是否关闭对话框
        builder: (ctx) {
          return AlertDialog(
            title: Text("title"),
            content: Text("content"),
            actions: <Widget>[
              FlatButton(
                onPressed: _back,
                child: text(),
              ),
              FlatButton(
                onPressed: () {
                  _back(DateTime.now());
                },
                child: text(),
              ),
            ],
          );
        });
    toast("$result");
  }

  void _back([Object result]) {
    Navigator.of(context).pop(result);
  }

  void _simpleDialog() async {
    final result = await showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: text(),
            children: <Widget>[
              SimpleDialogOption(
                child: text(),
              ),
              SimpleDialogOption(
                child: text(),
              ),
              SimpleDialogOption(
                child: text(),
              ),
              SimpleDialogOption(
                child: text(),
              ),
              SimpleDialogOption(
                child: text(),
              ),
              SimpleDialogOption(
                child: text(),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _back("last");
                },
                child: text(),
              ),
            ],
          );
        });
    toast("$result");
  }

  void _dialog() async {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            backgroundColor: Colors.deepPurple,
            clipBehavior: Clip.antiAlias,
            child: UnconstrainedBox(
              child: text(),
            ),
          );
        });
  }

  void _dialog2() async {
    showDialog(
        context: context,
        builder: (ctx) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 280, maxHeight: 200),
              child: Material(
                child: text(),
                type: MaterialType.card,
              ),
            ),
          );
        });
  }

  void _generalDialog() async {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.deepOrange,
        transitionDuration: Duration(milliseconds: 150),
        transitionBuilder: (ctx, a1, a2, child) {
          // 使用缩放动画
          return ScaleTransition(
            scale: CurvedAnimation(
              parent: a1,
              curve: Curves.easeOut,
            ),
            child: child,
          );
        },
        pageBuilder: (ctx, a1, a2) {
          return Material(
            child: Container(
              child: text(),
            ),
          );
        });
  }

  void _aboutDialog() async {
    showAboutDialog(
        context: context,
        applicationName: "applicationName",
        applicationVersion: "applicationVersion",
        applicationIcon: FlutterLogo(),
        applicationLegalese: "applicationLegalese",
        children: <Widget>[text(), text()]);
  }

  void _modalBottomSheet() async {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        builder: (ctx) {
          return demoListView();
        });
  }

  void _bottomSheet() async {
    showBottomSheet(
        context: context,
        builder: (ctx) {
          return demoListView();
        });
  }

  void _cupertinoDialog() async {
    showCupertinoDialog(
        context: context,
        builder: (ctx) {
          return demoListView();
        });
  }

  _loadingDialog() async {
    showDialog(
        context: context,
        builder: (ctx) {
          return UnconstrainedBox(
            constrainedAxis: Axis.vertical,
            child: SizedBox(
              width: 200,
              child: AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: text(),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  _datePicker() async {
    final result = await showDatePicker(
        context: context,
        //locale: Locale('zh', 'CN'),
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 31)));

    showToast("$result");
  }

  _datePicker2() async {
    final result = await showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 200,
            child: CalendarDatePicker(
                initialDate: now(),
                firstDate: now(),
                lastDate: now().add(Duration(days: 30)),
                onDateChanged: (value) {
                  showToast("$value");
                }),
          );
        });

    showToast("$result");
  }
}
