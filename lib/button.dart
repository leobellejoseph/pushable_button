import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final Color color;
  final String caption;
  final VoidCallback onPress;
  const Button(
      {Key? key,
      required this.color,
      required this.caption,
      required this.onPress})
      : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      upperBound: 5.0,
      duration: const Duration(milliseconds: 200),
    )..reverseDuration = const Duration(milliseconds: 10);

    super.initState();
  }

  void _handleOnTap() {
    controller.forward();
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        controller.reverse();
      });
    });
    print('PRESED');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      const width = 200.0;
      const height = 30.0;
      final _left = (size.maxWidth - width) * 0.5;
      final _top = (size.maxHeight - height) * 0.5;
      return AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return GestureDetector(
              onTap: _handleOnTap,
              child: Stack(
                children: [
                  Positioned(
                    left: _left,
                    top: _top + 5,
                    child: ButtonShadow(
                        width: width, height: height, widget: widget),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(microseconds: 1),
                    left: _left,
                    top: _top + controller.value,
                    child: ButtonMain(
                        width: width, height: height, widget: widget),
                  ),
                ],
              ),
            );
          });
    });
  }
}

class ButtonMain extends StatelessWidget {
  const ButtonMain({
    Key? key,
    required this.width,
    required this.height,
    required this.widget,
  }) : super(key: key);

  final double width;
  final double height;
  final Button widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          widget.caption,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

class ButtonShadow extends StatelessWidget {
  const ButtonShadow({
    Key? key,
    required this.width,
    required this.height,
    required this.widget,
  }) : super(key: key);

  final double width;
  final double height;
  final Button widget;
  @override
  Widget build(BuildContext context) {
    final color = widget.color;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color.withOpacity(0.9).withAlpha(100),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
