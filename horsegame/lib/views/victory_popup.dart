import 'package:flutter/material.dart';

class VictoryPopup extends StatelessWidget {
  const VictoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('You win!'),
      content: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/');
        },
        child: const Text('Restart Game'),
      ),
    );
  }
}
