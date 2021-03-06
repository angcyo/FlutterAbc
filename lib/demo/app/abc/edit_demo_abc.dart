import '../app.dart';

class EditDemoAbc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseDemoAbc(
      "EditDemoAbc",
      scroll: true,
      children: <Widget>[
        TextField(
          maxLines: 3,
        ),
        TextField(
          expands: false,
          minLines: null,
          maxLines: null,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
        ),
        TextField(
          decoration: InputDecoration(
            prefix: Text('Prefix'),
            suffix: Text('Suffix'),
            border: OutlineInputBorder(),
          ),
        ),
        TextField(
          maxLines: 3,
        ),
        TextField(
          maxLines: 3,
        ),
        TextField(
          maxLines: 3,
        ),
        TextField(
          maxLines: 3,
        ),
      ],
    );
  }
}
