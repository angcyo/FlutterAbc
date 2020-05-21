import '../app.dart';

class TabDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabDemoAbcState();
}

class _TabDemoAbcState extends State<TabDemoAbc>
    with SingleTickerProviderStateMixin {
  final List<Widget> tabs = [text(), text(), text(), text(), text(), text()];

  final List<Widget> tabsPages = [
    TabPageWidget(),
    TabPageWidget(),
    TabPageWidget(),
    TabPageWidget(),
    TabPageWidget(),
    TabPageWidget()
  ];

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
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("TabDemoAbc"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        physics: absPhysics,
        controller: _tabController,
        children: tabsPages,
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
            IconButton(
              icon: navigationIndex == 0
                  ? Icon(
                      Icons.home,
                      color: themeData.primaryColor,
                    )
                  : Icon(Icons.home),
              onPressed: () {
                onBottomNavigationChange(0);
              },
            ),
            SizedBox(), //中间位置空出
            IconButton(
              icon: navigationIndex == 2
                  ? Icon(
                      Icons.business,
                      color: themeData.primaryColor,
                    )
                  : Icon(Icons.business),
              onPressed: () {
                onBottomNavigationChange(2);
              },
            ),
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

class TabPageWidget extends StatelessWidget {
  final Widget body = ListView.builder(
      key: PageStorageKey(random.nextInt(100)),
      physics: absPhysics,
      itemCount: random.nextInt(100),
      itemBuilder: (ctx, index) {
        return image();
      });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(child: body);
  }
}
