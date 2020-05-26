import '../app.dart';

class ClipDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic avatar =
        Image.network("https://avatar.csdnimg.cn/0/8/8/3_angcyo.jpg");

    dynamic avatar2 = SizedBox.fromSize(
        size: Size(100, 100),
        child:
            Image.network("https://portrait.gitee.com/uploads/avatars/user/47/143008_angcyo_1578919345.png"));

    return BaseDemoAbc(
      "ClipDemoAbc",
      children: <Widget>[
        avatar,
        avatar2,
        ClipOval(
          child: avatar,
        ),
        ClipOval(
          child: avatar2,
        ),
        ClipRect(
          child: avatar,
        ),
        ClipRect(
          child: avatar2,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(250),
          child: avatar,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: avatar2,
        ),
      ],
    );
  }
}
