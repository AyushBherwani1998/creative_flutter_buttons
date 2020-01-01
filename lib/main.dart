import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  double height, width;
  bool opened = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Extended Button"),
      ),
      body: Container(
        width: width,
        height: height,
        child: getExtendedButton(),
      ),
    );
  }

  getExtendedButton() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: height / 2 - 32,
          left: width / 2 - 32,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            alignment: Alignment.center,
            height: 64,
            width: 64,
            decoration: BoxDecoration(
                color: opened
                    ? Color.fromRGBO(18, 18, 18, 0.6)
                    : Color(0xff121212),
                borderRadius: BorderRadius.circular(opened ? 32 : 0)),
            child: InkWell(
              child: Icon(
                opened ? Icons.clear : Icons.add,
                color: Colors.white,
              ),
              onTap: () {
                setState(() {
                  opened = !opened;
                });
              },
            ),
          ),
        ),
        getSquareButton(
            icon: Icons.attach_file,
            closedTop: height / 2 - 32,
            openedTop: height / 2 - 50,
            openedLeft: width / 2 - 50,
            closedLeft: width / 2 - 32,
            onClick: () {
              print("Attach Filed Pressed");
            }),
        getSquareButton(
            icon: Icons.attach_file,
            closedTop: height / 2 - 32,
            openedTop: height / 2 - 50,
            openedLeft: width / 2 + 10,
            closedLeft: width / 2 + 2,
            onClick: () {
              print("Attach Filed Pressed");
            }),
        getSquareButton(
            icon: Icons.share,
            closedTop: height / 2 - 32,
            openedTop: height / 2 - 50,
            openedLeft: width / 2 + 10,
            closedLeft: width / 2 + 2,
            onClick: () {
              print("Share Pressed");
            }),
        getSquareButton(
            icon: Icons.camera,
            closedTop: height / 2 + 2,
            openedTop: height / 2 + 10,
            openedLeft: width / 2 + 10,
            closedLeft: width / 2 + 2,
            onClick: () {
              print("Camera Pressed");
            }),
        getSquareButton(
            icon: Icons.send,
            closedTop: height / 2 + 2,
            openedTop: height / 2 + 10,
            openedLeft: width / 2 - 50,
            closedLeft: width / 2 - 32,
            onClick: () {
              print("Send Pressed");
            })
      ],
    );
  }

  getSquareButton(
      {IconData icon,
      var onClick,
      double closedLeft,
      double openedLeft,
      double closedTop,
      double openedTop}) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      top: opened ? openedTop : closedTop,
      left: opened ? openedLeft : closedLeft,
      child: InkWell(
        onTap: opened
            ? null
            : () {
                setState(() {
                  opened = !opened;
                });
              },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: opened ? 40 : 30,
          height: opened ? 40 : 30,
          child: IconButton(
            icon: Icon(
              icon,
              size: 20,
              color: opened ? Colors.white : Colors.transparent,
            ),
            onPressed: opened ? onClick : null,
          ),
          decoration: BoxDecoration(
              color: Color(0xff121212),
              borderRadius: BorderRadius.circular(opened ? 5 : 0)),
        ),
      ),
    );
  }
}
