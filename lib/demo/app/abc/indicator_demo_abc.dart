import '../app.dart';

class IndicatorDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndicatorDemoAbcState();
}

class IndicatorDemoAbcState extends State<IndicatorDemoAbc> {
  double progress = 0.1;

  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      this,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(4),
          child: LinearProgressIndicator(
            value: progress,
          ),
        ),
        CircularProgressIndicator(
          value: progress,
        ),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.lightGreenAccent,
        ),
        CircularProgressIndicator(
          value: progress,
        ),
        CircularProgressIndicator(
          value: progress,
          backgroundColor: Colors.deepOrange,
          strokeWidth: 2,
        ),
        CircularProgressIndicator(
          value: null,
        ),
        LinearProgressIndicator(
          value: null,
          backgroundColor: Colors.lightGreenAccent,
          valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
        ),
        RefreshProgressIndicator(
          value: progress,
        ),
        ColorProgressIndicator(
          isCircle: false,
        ),
        ColorProgressIndicator(
          isCircle: true,
        ),
        Slider(value: progress ?? 0, onChanged: onSliderChange)
      ],
    );
  }

  void onSliderChange(double value) {
    setState(() {
      progress = value;
    });
  }
}

class ColorProgressIndicator extends StatefulWidget {
  final bool isCircle;

  const ColorProgressIndicator({Key key, this.isCircle = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ColorProgressIndicatorState();
}

class _ColorProgressIndicatorState extends State<ColorProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget result;
    if (widget.isCircle) {
      result = CircularProgressIndicator(
        value: _animationController.value,
        valueColor:
            ColorTween(begin: Colors.pinkAccent, end: Colors.lightBlueAccent)
                .animate(_animationController),
      );
    } else {
      result = LinearProgressIndicator(
        value: _animationController.value,
        valueColor:
            ColorTween(begin: Colors.pinkAccent, end: Colors.lightBlueAccent)
                .animate(_animationController),
      );
    }

    return result;
  }
}
