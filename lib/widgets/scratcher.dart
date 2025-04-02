import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

class HScratcher extends StatelessWidget {
  const HScratcher({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Scratcher(
        brushSize: 30,
        threshold: 50,
        color: const Color(0xFF353F48),
        onChange: (value) {},
        onThreshold: () {},
        child: Container(
          height: 300,
          width: 300,
          color: Colors.white,
          alignment: Alignment.center,
          child: const Text(
            'Hafiz5678',
            style: TextStyle(fontSize: 34, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
