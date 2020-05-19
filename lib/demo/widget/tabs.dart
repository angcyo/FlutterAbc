import 'package:flutter/material.dart';

import '../app/app.dart';

class Tab1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build...${context.hashCode} ${this.hashCode} $context");
    return Center(child: Text("tab1 ${tx()}"));
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build...${context.hashCode} ${this.hashCode} $context");
    return Center(child: Text("tab2 ${tx()}"));
  }
}

class Tab3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("build...${context.hashCode} ${this.hashCode} $context");
    return Center(child: Text("tab3 ${tx()}"));
  }
}
