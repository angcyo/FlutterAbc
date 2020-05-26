import 'package:flutter/scheduler.dart';

import '../app.dart';

class AnimationDemoAbc extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AnimationDemoAbcState();
}

class _AnimationDemoAbcState extends State<AnimationDemoAbc>
    with TickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> scaleAnimation;
  AnimationController animationController;
  AnimationController scaleAnimationController;

  @override
  void initState() {
    //动画控制器, 用于指定动画时长, 控制动画开始和结束. 内部就是一个Ticker
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 3000,
        ));

    scaleAnimationController = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 3000,
        ));

    //使用曲线, 类似于android的动画差值器
    final curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceInOut);

    //动画取值范围
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      animation = Tween(begin: 0.0, end: MediaQuery.of(context).size.width)
          .animate(curve);
      scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController);

      animationController.forward();
      scaleAnimationController.forward();

      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      "AnimationDemoAbc",
      scroll: true,
      children: animation != null
          ? <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.black12,
                child: _AnimatedWidgetDemo(
                  animation: animation,
                  imageUrl: img(),
                ),
              ),
              AnimatedBuilder(
                animation: animation,
                builder: (ctx, child) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.black26,
                    width: animation.value,
                    height: animation.value,
                    child: child,
                  );
                },
                child: image(),
              ),
              SizeTransition(
                sizeFactor: scaleAnimation,
                child: image(),
              ),
              ScaleTransition(
                scale: scaleAnimation,
                child: image(),
              ),
              FadeTransition(
                opacity: animation,
                child: image(),
              ),
            ]
          : [],
    );
  }
}

class _AnimatedWidgetDemo extends AnimatedWidget {
  _AnimatedWidgetDemo({
    Key key,
    @required Animation<double> animation,
    @required this.imageUrl,
  }) : super(key: key, listenable: animation);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      width: animation.value,
      height: animation.value,
    );
  }
}
