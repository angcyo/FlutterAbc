import '../app.dart';

class CustomScrollDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomScrollDemoAbcState();
}

class _CustomScrollDemoAbcState extends State<CustomScrollDemoAbc>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = [text(), text(), text(), text(), text(), text()];

  TabController _tabController;

  int tabIndex = 0;

  @override
  void initState() {
    _tabController =
        TabController(initialIndex: tabIndex, length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        physics: absPhysics,
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            //继续上滑时 标题栏固定, 否则标题栏会滚动到屏幕外
            pinned: true,
            //继续下拉时 标题栏是否跟随下拉, 具有变高放大的效果. 否则固定不变. 此效果需要[physics]的支持
            stretch: true,
            //是否滚动时, 就优先滚动标题栏. 否则到了边界才会滚动标题栏
            floating: false,
            centerTitle: false,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('CustomScrollDemoAbc'),
              centerTitle: false,
              background: image(),
              collapseMode: CollapseMode.parallax,
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: tabs,
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  //创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),

          //List
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                //创建列表项
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 50, //50个列表项
            ),
          ),
        ],
      ),
    );
  }
}
