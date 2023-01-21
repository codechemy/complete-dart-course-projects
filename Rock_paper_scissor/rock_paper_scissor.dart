import 'dart:io';
import 'dart:math';

enum PlayerMove { rock, paper, scissor }

void main() {
  final rng = Random();
  while (true) {
    stdout.write('Rock,Paper,Scissor? (r/p/s) ');
    final input = stdin.readLineSync();

    if (input == 'r' || input == 'p' || input == 's') {
      var playerMove;
      switch (input) {
        case 'r':
          playerMove = PlayerMove.rock;
          break;
        case 'p':
          playerMove = PlayerMove.paper;
          break;
        default:
          playerMove = PlayerMove.scissor;
          break;
      }
      final randomMove = rng.nextInt(3);
      final aiMove = PlayerMove.values[randomMove];
      print('You played: $playerMove');
      print('AI played: $aiMove');
      if (playerMove == aiMove) {
        print("It's a draw");
      } else if (playerMove == PlayerMove.rock &&
              aiMove == PlayerMove.scissor ||
          playerMove == PlayerMove.paper && aiMove == PlayerMove.rock ||
          playerMove == PlayerMove.scissor && aiMove == PlayerMove.paper) {
        print("You win");
      } else {
        print("You lose");
      }
    } else if (input == 'q') {
      break;
    } else {
      print('Invalid Input');
    }
  }
}
