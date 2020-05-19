import 'package:angcyo_flutter_app/angcyo_flutter_app.dart';

import '../app.dart';

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
        FlatButton(
          onPressed: () {
            toast("FlatButton");
          },
          child: Text("FlatButton"),
        ),
        OutlineButton(
          onPressed: () {
            toast("OutlineButton");
          },
          child: Text("OutlineButton"),
        )
      ],
    );
  }
}
