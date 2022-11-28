import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  static const String _title = 'Animation Example';
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body:Center( child: const MyStatefulWidget()),
      ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double padValue = 0.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.airplanemode_on,
            color: Colors.blue,
            size: 50,
          ),
          AnimatedPadding(
              padding: EdgeInsets.all(padValue),
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              onEnd:(){
                _updatePadding(0);
              },
            child:
            ElevatedButton.icon(// <-- ElevatedButton
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
                  minimumSize: Size(100, 40)),
              onPressed: () {
                _updatePadding(100);
              },
              icon: Icon(
                Icons.airplanemode_on,
                color: Colors.white,
                size: 24.0,
              ),
              label: Text('起飛'
                ,style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
    );
  }
}
