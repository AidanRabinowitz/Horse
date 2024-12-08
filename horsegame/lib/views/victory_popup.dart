import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class VictoryPopup extends StatelessWidget {
  const VictoryPopup({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an AudioPlayer instance
    final AudioPlayer audioPlayer = AudioPlayer();

    // Play the audio file
    audioPlayer.play(
        AssetSource('audio/neigh.mp3')); // Adjust the path to your audio file

    return AlertDialog(
      title: const Text('You win!'),
      content: ElevatedButton(
        onPressed: () {
          audioPlayer.stop(); // Stop the audio if the user exits the popup
          Navigator.pop(context); // Close the popup
          Navigator.pushNamed(context, '/'); // Restart the game
        },
        child: const Text('Restart Game'),
      ),
    );
  }
}
