import '../app.dart';

class TabDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabDemoAbcState();
}

class _TabDemoAbcState extends State<TabDemoAbc>
    with SingleTickerProviderStateMixin {
  final List tabs = [tx(), tx(), tx(), tx(), tx(), tx()];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.toString()),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: tabs.map((e) => Text(e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) => Text(e)).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: icon(),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), //中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),

//        child: BottomNavigationBar(
//          currentIndex: navigationIndex,
//          items: [
//            BottomNavigationBarItem(icon: icon(), title: text()),
//            BottomNavigationBarItem(icon: icon(), title: text()),
//            BottomNavigationBarItem(icon: icon(), title: text())
//          ],
//          onTap: onBottomNavigationChange,
//        ),
      ),
    );
  }

  int navigationIndex = 0;

  void onBottomNavigationChange(int value) {
    setState(() {
      navigationIndex = value;
    });
  }
}
