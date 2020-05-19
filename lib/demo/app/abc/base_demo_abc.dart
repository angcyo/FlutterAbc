import '../app.dart';

class BaseDemoAbc extends StatelessWidget {
  BaseDemoAbc(this.title, {this.child, this.children, this.scroll = false})
      : assert(child != null || children != null);

  final Widget child;
  final Object title;
  final List<Widget> children;
  final bool scroll;

  @override
  Widget build(BuildContext context) {
    Widget body;

    if (scroll) {
      body = ListView(children: children ?? <Widget>[child]);
    } else if (children != null) {
      body = Wrap(
        children: children,
      );
    } else {
      body = child;
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("$title"),
        ),
        body: body);
  }
}
