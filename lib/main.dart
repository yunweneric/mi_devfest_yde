import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_micro_interractions/new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isForward = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("#1- Hero animation"),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          key: ValueKey(isForward),
          curve: Curves.elasticOut,
          tween: isForward ? Tween(begin: 0, end: 0.02) : Tween(begin: 0, end: -0.02),
          duration: const Duration(milliseconds: 2000),
          builder: (context, value, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.02)
                ..rotateX(pi * value),
              child: GestureDetector(
                onTap: () => setState(() => isForward = !isForward),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  crossFadeState: isForward ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                  firstChild: card(
                    text: "Automatically handle animations with minimal code",
                    index: "assets/images/eric.jpeg",
                  ),
                  secondChild: card(
                    text: "Automatically handle animations with minimal code",
                    index: "assets/images/tomiwa.jpeg",
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget card({required String text, required String index}) {
    return Hero(
      tag: index,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 250,
        width: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(index),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 5,
            )
          ],
        ),
      ),
    );
  }
}
