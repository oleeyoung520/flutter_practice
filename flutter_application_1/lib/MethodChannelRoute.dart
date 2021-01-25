import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelRoute extends StatefulWidget {
  @override
  _MethodChannelState createState() {
    return _MethodChannelState();
  }
}

class _MethodChannelState extends State<MethodChannelRoute> {
  static const MethodChannel _channel = const MethodChannel('name');

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }

}