import '../app.dart';

class WidgetDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.toString()),
      ),
      body: Center(
        child: Text(tx()),
      ),
    );
  }
}
