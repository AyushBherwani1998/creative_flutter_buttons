import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opened = false;
  double size = 80;
  Color color = Colors.red;

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Extended Button"),
      ),
      body: Center(
        child: Container(
          width: size,
          height: size,
          child: getExtendedButton(),
        ),
      ),
    );
  }

  getExtendedButton() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Stack(
          children: <Widget>[
            Positioned(
              top: constraints.maxHeight / 2 - calculateValue(32),
              left: constraints.maxWidth / 2 - calculateValue(32),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                alignment: Alignment.center,
                height: calculateValue(64),
                width: calculateValue(64),
                decoration: BoxDecoration(
                    color: opened ? color.withOpacity(0.6) : color,
                    borderRadius:
                        BorderRadius.circular(opened ? calculateValue(32) : 0)),
                child: InkWell(
                  child: Transform.rotate(
                    angle: opened ? 0.75 : 0,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
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
                closedTop: height / 2 - calculateValue(32),
                openedTop: height / 2 - calculateValue(50),
                openedLeft: width / 2 - calculateValue(50),
                closedLeft: width / 2 - calculateValue(32),
                onClick: () {
                  print("Attach Filed Pressed");
                }),
            getSquareButton(
                icon: Icons.attach_file,
                closedTop: height / 2 - calculateValue(32),
                openedTop: height / 2 - calculateValue(50),
                openedLeft: width / 2 + calculateValue(10),
                closedLeft: width / 2 + calculateValue(2),
                onClick: () {
                  print("Attach Filed Pressed");
                }),
            getSquareButton(
                icon: Icons.share,
                closedTop: height / 2 - calculateValue(32),
                openedTop: height / 2 - calculateValue(50),
                openedLeft: width / 2 + calculateValue(10),
                closedLeft: width / 2 + calculateValue(2),
                onClick: () {
                  print("Share Pressed");
                }),
            getSquareButton(
                icon: Icons.camera,
                closedTop: height / 2 + calculateValue(2),
                openedTop: height / 2 + calculateValue(10),
                openedLeft: width / 2 + calculateValue(10),
                closedLeft: width / 2 + calculateValue(2),
                onClick: () {
                  print("Camera Pressed");
                }),
            getSquareButton(
                icon: Icons.send,
                closedTop: height / 2 + calculateValue(2),
                openedTop: height / 2 + calculateValue(10),
                openedLeft: width / 2 - calculateValue(50),
                closedLeft: width / 2 - calculateValue(32),
                onClick: () {
                  print("Send Pressed");
                })
          ],
        );
      },
    );
  }

  calculateValue(int value) {
    return size * value / 106;
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
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        width: opened ? calculateValue(40) : calculateValue(30),
        height: opened ? calculateValue(40) : calculateValue(30),
        child: GestureDetector(
          onTap: () {
            print("Clicked");
          },
          child: Icon(
            icon,
            size: calculateValue(20),
            color: opened ? Colors.white : Colors.transparent,
          ),
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                BorderRadius.circular(opened ? calculateValue(5) : 0)),
      ),
    );
  }
}
