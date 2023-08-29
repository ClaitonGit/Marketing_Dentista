import 'package:flutter/material.dart';

class Conta extends StatefulWidget {
  const Conta({super.key});

  @override
  State<Conta> createState() => _ContaState();
}

class _ContaState extends State<Conta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Conta'),
    ),
    );
  }
}