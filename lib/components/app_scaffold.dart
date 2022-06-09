import 'package:calibrum/constants/constant.dart';
import 'package:calibrum/widget/custom_widget.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class AppScaffold extends StatefulWidget {
  final Widget body;
  final Widget subHeader;
  AppScaffold({@required this.body, this.subHeader, Key key}) : super(key: key);

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              height: 64,
              child: AppBar(
                elevation: 0.0,
                bottom: PreferredSize(
                  preferredSize: new Size(MediaQuery.of(context).size.width,
                      64.0), // here the desired height
                  child: Header(
                    userName: safeString('Jozsef Nagy'),
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [dashboardBG, dashboardSecond],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            Expanded(
              child: Scaffold(
                appBar: PreferredSize(
                    preferredSize:
                        Size.fromHeight(64), // here the desired height
                    child: widget.subHeader == null
                        ? AppBar(title: Text(""))
                        : widget.subHeader),
                body: widget.body,
                bottomNavigationBar: copyRight(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
