import 'package:angcyo_flutter_app/angcyo_flutter_app.dart';

import '../app.dart';

///const FlatButton({
///  ...
///  @required this.onPressed, ///按钮点击回调
///  this.textColor, ///按钮文字颜色
///  this.disabledTextColor, ///按钮禁用时的文字颜色
///  this.color, ///按钮背景颜色
///  this.disabledColor,///按钮禁用时的背景颜色
///  this.highlightColor, ///按钮按下时的背景颜色
///  this.splashColor, ///点击时，水波动画中水波的颜色
///  this.colorBrightness,///按钮主题，默认是浅色主题
///  this.padding, ///按钮的填充
///  this.shape, ///外形
///  @required this.child, ///按钮的内容
///})
class ButtonDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      this,
      children: <Widget>[
        MaterialButton(
          highlightColor: Colors.blue[200], //按下去的颜色
          splashColor: Colors.blue, //ripple的颜色, flutter里面叫做 splash
          onPressed: () {
            toast("MaterialButton");
          },
          child: Text("MaterialButton"),
        ),
        RaisedButton(
          color: Colors.deepOrange,
          onPressed: () {
            toast("RaisedButton");
          },
          child: Text("RaisedButton"),
        ),
        RaisedButton.icon(
            onPressed: () {
              toast("RaisedButton");
            },
            icon: icon(),
            label: text()),
        RaisedButton(
          colorBrightness: Brightness.dark,
          color: Colors.deepOrange,
          onPressed: () {
            toast("RaisedButton");
          },
          child: Text(
            "RaisedButton",
            style: TextStyle(color: Colors.deepPurple),
          ),
        ),
        FlatButton(
          onPressed: () {
            toast("FlatButton");
          },
          child: Text("FlatButton"),
        ),
        FlatButton(
          color: Colors.deepOrange,
          colorBrightness: Brightness.dark,
          onPressed: () {
            toast("FlatButton dark");
          },
          child: Text("FlatButton"),
        ),
        FlatButton.icon(
            onPressed: () {
              toast("FlatButton");
            },
            icon: icon(),
            label: text()),
        OutlineButton(
          onPressed: () {
            toast("OutlineButton");
          },
          child: Text("OutlineButton"),
        ),
        OutlineButton.icon(
            onPressed: () {
              toast("OutlineButton");
            },
            icon: icon(),
            label: text()),
        IconButton(
          onPressed: () {
            toast("IconButton1");
          },
          icon: Text("IconButton"),
        ),
        IconButton(
          onPressed: () {
            toast("IconButton2");
          },
          icon: Icon(Icons.add_circle),
        ),
        InkWell(
          child: IconButton(
            onPressed: () {
              toast("IconButton3");
            },
            icon: Icon(Icons.add_circle),
          ),
        )
      ],
    );
  }
}
