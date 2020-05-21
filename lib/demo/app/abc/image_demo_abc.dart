import '../app.dart';

class ImageDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ImageDemoAbcState();
}

class _ImageDemoAbcState extends State<ImageDemoAbc> {
  ScrollController scrollController;

  String title = "ImageDemoAbc";
  double offset;

  List items = <Widget>[
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
  ];

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      info(scrollController.offset);
      warn(scrollController.position);
      error(scrollController.positions);
      setState(() {
        offset = scrollController.offset;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      "$title ${offset?.toStringAsFixed(2) ?? ''}",
      scroll: true,
      scrollBar: true,
      scrollController: scrollController,
      children: items,
    );
  }
}
