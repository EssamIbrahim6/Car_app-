import 'dart:math' as math;

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ControllerScreen extends StatefulWidget {
  const ControllerScreen({super.key});

  @override
  State<ControllerScreen> createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  Future<void> onCommand(String command) async {
    await FirebaseDatabase.instance.ref('command').set(command);
  }

  Widget _button(String command, double angle) {
    return GestureDetector(
      onTapDown: (_) {
        onCommand(command);
      },
      onTapUp: (_) {
        onCommand('S');
      },
      onTapCancel: () {
        onCommand('S');
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF112B4A),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Transform.rotate(
          angle: angle ,
          child: const Icon(
            Icons.keyboard_double_arrow_right_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            
            children: [
              const Text(
                'CONTROLLER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  color: Color(0xFF112B4A),
                ),
              ),
            SizedBox(height: 30,),
              Row(
           
                children: [
                
                  Expanded(
                    child: Row(
                      children: [
                        _button('L', -math.pi),
                        const SizedBox(width: 20),
                        _button('R', 0),
                      ],
                    ),
                  ),

                  const SizedBox(width: 50),

                  Expanded(
                    child: Container(
                      width: 260,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage('assets/photo.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 50),

                  Expanded(
                    child: Column(
                      children: [
                        _button('F', -math.pi / 2),
                        const SizedBox(height: 30),
                        _button('B', math.pi / 2),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}