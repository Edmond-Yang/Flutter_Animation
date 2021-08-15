import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key key}) : super(key: key);

  @override
  _SandboxState createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 20;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedContainer(
            margin: EdgeInsets.all(_margin),
            width: _width,
            color: _color,
            duration: Duration(milliseconds: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => setState(() => _margin = 50),
                  child: Text(
                    'animated margin',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _color = Colors.purple),
                  child: Text(
                    'animated color',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _width = 400.0),
                  child: Text(
                    'animated width',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
                ElevatedButton(
                  onPressed: () => setState(() => _opacity = 0),
                  child: Text(
                    'animated opacity',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                ),
                AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(milliseconds: 1500),
                  child: Text(
                    'hide me',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )));
  }
}
