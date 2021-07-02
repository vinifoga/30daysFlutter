import 'package:flashcards/flashcard.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(question: "What species is Jabba?", answer: "Hutt"),
    Flashcard(
        question: "Which order brought about the death of the Jedi?",
        answer: "Order 66"),
    Flashcard(question: "Who played Princess Leia?", answer: "Carrie Fisher"),
    Flashcard(
        question: "On which planet do we first meet Rey in The Force Awakens?",
        answer: "Jakku"),
    Flashcard(
        question: "Which furry species lives on the forest moon of Endor?",
        answer: "Ewoks")
  ];
  List<bool> _selection = [true, false];
  int _score = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://images2.alphacoders.com/763/76382.jpg"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Score : $_score',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                    front: FlashcardView(
                      text: _flashcards[_currentIndex].question,
                    ),
                    back: FlashcardView(
                      text: _flashcards[_currentIndex].answer,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton.icon(
                        onPressed: showPreviousCard,
                        icon: Icon(Icons.arrow_left),
                        label: Text('Prev')),
                    OutlinedButton.icon(
                        onPressed: showNextCard,
                        icon: Icon(Icons.arrow_right),
                        label: Text('Next')),
                  ],
                ),
                ToggleButtons(
                  children: [Icon(Icons.check), Icon(Icons.close)],
                  isSelected: _selection,
                  onPressed: updateSelection,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex + 1 < _flashcards.length ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          _currentIndex - 1 >= 0 ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }

  updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
      if (selectedIndex == 0) {
        _score++;
      } else if (selectedIndex == 1) {
        _score--;
      }
    });
  }
}
