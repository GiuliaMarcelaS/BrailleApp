import 'package:flutter/material.dart';
import '../components/fase_grid.dart';


class ModulosScreen extends StatelessWidget {
  const ModulosScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Módulos"),),
      body: const FaseGrid(),
      
    );
  }
}
