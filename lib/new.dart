import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  final String name;
  const NewScreen({super.key, required this.name});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(widget.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
