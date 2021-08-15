import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAinimation;
  Animation _curve;

  bool isFavor = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle);

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve);
    _sizeAinimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_curve);

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
      print(_sizeAinimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) isFavor = true;
      if (status == AnimationStatus.dismissed) isFavor = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAinimation.value,
          ),
          onPressed: () {
            isFavor ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
