import 'package:flutter/material.dart';

class LottieDoor extends StatefulWidget {
  const LottieDoor({super.key, required this.isOpen});
  final bool isOpen;

  @override
  State<LottieDoor> createState() => _LottieDoorState();
}

class _LottieDoorState extends State<LottieDoor> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Icon(
        size: 200,
        widget.isOpen
            ? Icons.door_front_door_outlined
            : Icons.door_front_door,
      ),
    );
  }
}
