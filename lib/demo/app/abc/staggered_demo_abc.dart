import '../app.dart';

class StaggeredDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      "StaggeredDemoAbc",
      child: StaggeredGrid.countBuilder(
          itemBuilder: (ctx, index) {
            return Container(
              color: Colors.deepOrange,
              child: icon(),
            );
          },
          staggeredTileBuilder: (index) {
            return StaggeredTile.count(1, index.isEven ? 2 : 1);
          },
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3),
    );
  }
}
