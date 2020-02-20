import 'package:flutter/material.dart';

class ExtendedButton extends StatefulWidget {
  final IconData topRightIcon, topLeftIcon, bottomRightIcon, bottomLeftIcon;
  final bool opened;
  final Function onClickTopRight,
      onClickTopLeft,
      onClickBottomLeft,
      onClickBottomRight;
  final double size;
  final Color iconColor, boxColor, smallBoxColor;

  const ExtendedButton(
      {Key key,
      this.opened,
      @required this.size,
      this.iconColor = Colors.white,
      this.boxColor = Colors.black,
      this.smallBoxColor = Colors.black,
      @required this.topRightIcon,
      @required this.topLeftIcon,
      @required this.bottomRightIcon,
      @required this.bottomLeftIcon,
      @required this.onClickTopRight,
      @required this.onClickTopLeft,
      @required this.onClickBottomLeft,
      @required this.onClickBottomRight})
      : assert(iconColor != null, "Icon color cannot be null"),
        assert(boxColor != null, "Box color can not be null"),
        assert(smallBoxColor != null, "Small Box color can not be null"),
        assert(topRightIcon != null, "Top right Icon can not be null"),
        assert(topLeftIcon != null, "Top left Icon can not be null"),
        assert(bottomRightIcon != null, "Bottom right Icon can not be null"),
        assert(bottomLeftIcon != null, "Bottom left Icon can not be null"),
        super(key: key);

  @override
  _ExtendedButtonState createState() => _ExtendedButtonState();
}

class _ExtendedButtonState extends State<ExtendedButton> {
  Dimensions dimensions;
  bool opened;

  _ExtendedButtonState({opened});

  @override
  void initState() {
    opened = opened ?? false;
    dimensions = Dimensions(widget.size);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double height = constraints.maxHeight;
        double width = constraints.maxWidth;
        return Stack(
          children: <Widget>[
            Positioned(
              top:
                  constraints.maxHeight / 2 - dimensions.calculateDimension(32),
              left:
                  constraints.maxWidth / 2 - dimensions.calculateDimension(32),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                alignment: Alignment.center,
                height: dimensions.calculateDimension(64),
                width: dimensions.calculateDimension(64),
                decoration: BoxDecoration(
                    color: opened
                        ? widget.boxColor.withOpacity(0.6)
                        : widget.boxColor,
                    borderRadius: BorderRadius.circular(
                        opened ? dimensions.calculateDimension(32) : 0)),
                child: InkWell(
                  child: Transform.rotate(
                    angle: opened ? 0.75 : 0,
                    child: Icon(
                      Icons.add,
                      color: widget.iconColor,
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
            SquareBox(
                opened: opened,
                size: widget.size,
                icon: widget.topLeftIcon,
                boxColor: widget.smallBoxColor,
                iconColor: widget.iconColor,
                closedTop: height / 2 - dimensions.calculateDimension(32),
                openedTop: height / 2 - dimensions.calculateDimension(50),
                openedLeft: width / 2 + dimensions.calculateDimension(10),
                closedLeft: width / 2 + dimensions.calculateDimension(2),
                onClick: widget.onClickTopLeft),
            SquareBox(
                opened: opened,
                size: widget.size,
                iconColor: widget.iconColor,
                boxColor: widget.smallBoxColor,
                icon: widget.topRightIcon,
                closedTop: height / 2 - dimensions.calculateDimension(32),
                openedTop: height / 2 - dimensions.calculateDimension(50),
                openedLeft: width / 2 + dimensions.calculateDimension(10),
                closedLeft: width / 2 + dimensions.calculateDimension(2),
                onClick: widget.onClickTopRight),
            SquareBox(
                opened: opened,
                size: widget.size,
                iconColor: widget.iconColor,
                boxColor: widget.smallBoxColor,
                icon: widget.bottomRightIcon,
                closedTop: height / 2 + dimensions.calculateDimension(2),
                openedTop: height / 2 + dimensions.calculateDimension(10),
                openedLeft: width / 2 + dimensions.calculateDimension(10),
                closedLeft: width / 2 + dimensions.calculateDimension(2),
                onClick: widget.onClickBottomRight),
            SquareBox(
                opened: opened,
                size: widget.size,
                iconColor: widget.iconColor,
                boxColor: widget.smallBoxColor,
                icon: widget.bottomLeftIcon,
                closedTop: height / 2 + dimensions.calculateDimension(2),
                openedTop: height / 2 + dimensions.calculateDimension(10),
                openedLeft: width / 2 - dimensions.calculateDimension(50),
                closedLeft: width / 2 - dimensions.calculateDimension(32),
                onClick: widget.onClickBottomLeft)
          ],
        );
      },
    );
  }
}

class SquareBox extends StatefulWidget {
  final IconData icon;
  final bool opened;
  final Function onClick;
  final double closedLeft, openedLeft, closedTop, openedTop, size;
  final Color iconColor, boxColor;

  SquareBox(
      {this.icon,
      this.opened,
      this.onClick,
      this.closedLeft,
      this.openedLeft,
      this.closedTop,
      this.openedTop,
      this.iconColor,
      this.boxColor,
      this.size});

  @override
  _SquareBoxState createState() => _SquareBoxState();
}

class _SquareBoxState extends State<SquareBox> {
  Dimensions dimensions;

  @override
  void initState() {
    dimensions = Dimensions(widget.size);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      top: widget.opened ? widget.openedTop : widget.closedTop,
      left: widget.opened ? widget.openedLeft : widget.closedLeft,
      child: AnimatedContainer(
        alignment: Alignment.center,
        duration: Duration(milliseconds: 500),
        width: widget.opened
            ? Dimensions(widget.size).calculateDimension(40)
            : dimensions.calculateDimension(30),
        height: widget.opened
            ? dimensions.calculateDimension(40)
            : dimensions.calculateDimension(30),
        child: GestureDetector(
          onTap: () {
            print("Clicked");
          },
          child: Icon(
            widget.icon,
            size: dimensions.calculateDimension(20),
            color: widget.opened ? widget.iconColor : Colors.transparent,
          ),
        ),
        decoration: BoxDecoration(
            color: widget.boxColor,
            borderRadius: BorderRadius.circular(
                widget.opened ? dimensions.calculateDimension(5) : 0)),
      ),
    );
  }
}

class Dimensions {
  final double size;

  Dimensions(this.size);

  calculateDimension(int value) {
    return size * value / 106;
  }
}
