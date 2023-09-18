import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/graphic.dart';

class GraphicScreen extends StatefulWidget {
  const GraphicScreen({super.key});

  @override
  State<GraphicScreen> createState() => _GraphicScreenState();
}

class _GraphicScreenState extends State<GraphicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('teste'),
    );
  }
}