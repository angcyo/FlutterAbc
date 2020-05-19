import 'package:angcyo_flutter_app/widget/widget.dart';

import '../app.dart';

class BaseDemoAbc extends StatelessWidget {
  BaseDemoAbc(this.title, {this.child, this.children});

  final Widget child;
  final Object title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (children != null) {
      body = MyFlowWidget(
        children: children,
      );
    } else {
      body = child;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("$title"),
        ),
        body: body);
  }
}
