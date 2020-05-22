import '../app.dart';

class WidgetDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      showToast("WidgetDemoAbc Build.");
    });
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              share(GITHUB_URL);
            },
          )
        ],
        title: Text("WidgetDemoAbc"),
      ),
      body: Center(
        child: Text(tx()),
      ),
    );
  }
}
