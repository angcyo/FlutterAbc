import '../app.dart';

class GridDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      "GridDemoAbc",
      child: GridView.builder(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 9, childAspectRatio: 1 / 1),
          itemBuilder: (ctx, index) {
            return icon();
          }),
    );
  }
}
