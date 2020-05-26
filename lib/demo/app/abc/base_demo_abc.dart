import '../app.dart';

class BaseDemoAbc extends StatelessWidget {
  BaseDemoAbc(
    this.title, {
    this.child,
    this.children,
    this.scroll = false,
    this.scrollBar = false,
    this.scrollController,
  }) : assert(child != null || children != null);

  final Widget child;
  final Object title;
  final List<Widget> children;
  final bool scroll;
  final bool scrollBar;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    Widget body;

    if (scroll) {
      List items = children ?? <Widget>[child];
      dynamic list = ListView.builder(
          physics: absPhysics,
          itemCount: items.length,
          controller: scrollController,
          itemBuilder: (ctx, index) {
            return items[index];
          });

      if (scrollBar) {
        body = Scrollbar(child: list);
      } else {
        body = list;
      }
    } else if (children != null) {
      body = Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: children,
      );
    } else {
      body = child;
    }

    return Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          title: Hero(
            tag: title,
            child: Text("$title"),
          ),
          gradientStart: themeData.primaryColor,
          gradientEnd: themeData.primaryColorDark,
        ),
        body: body);
  }
}
