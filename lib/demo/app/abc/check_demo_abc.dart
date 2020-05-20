import '../app.dart';

class CheckDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckDemoAbcState();
}

enum RadioValue { a, b, c, d, e }

class _CheckDemoAbcState extends State<CheckDemoAbc> {
  bool check = false;

  void onChange(bool value) {
    setState(() {
      check = value;
    });
  }

  RadioValue radio = RadioValue.a;

  void onRadioChange(RadioValue value) {
    setState(() {
      radio = value;
    });
  }

  double slider = 0.5;

  void onSliderChange(double value) {
    setState(() {
      slider = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      widget,
      children: <Widget>[
        Switch(
          value: check,
          onChanged: onChange,
        ),
        Checkbox(
          value: check,
          onChanged: onChange,
        ),
        Checkbox(
          value: check,
          tristate: false,
          onChanged: onChange,
        ),
        text(),
        Radio(
          value: RadioValue.a,
          groupValue: radio,
          onChanged: onRadioChange,
        ),
        Radio(
          value: RadioValue.b,
          groupValue: radio,
          onChanged: onRadioChange,
        ),
        Radio(
          value: RadioValue.c,
          groupValue: radio,
          onChanged: onRadioChange,
        ),
        text(),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(tx() + " $slider"),
        ),
        Slider(value: slider, onChanged: onSliderChange)
      ],
    );
  }
}
