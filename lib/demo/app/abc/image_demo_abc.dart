import '../app.dart';

class ImageDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      this,
      scroll: true,
      children: <Widget>[
        image(width: 100),
        image(height: 100),
        image(width: 150, height: 150),
        image(color: Colors.lightGreenAccent.withAlpha(100)),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
        image(),
      ],
    );
  }
}
