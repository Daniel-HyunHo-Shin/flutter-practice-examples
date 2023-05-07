import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SRS App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SRS App'),
      ),
      body: const Center(
        child: Text('Welcome to the SRS App!'),
      ),
    );
  }
}


import 'dart:math';

class SRSScheduler {
  Collection collection;

  SRSScheduler(this.collection);

  void review(Card card, int ease) {
    if (card.queue == 0) {
      // New card
      card.queue = 1;
      card.type = 1;
      card.factor = 2500;
    }

    if (ease == 1) {
      // Incorrect answer
      card.lapses += 1;
      card.interval = 1;
      card.due = collection.daysSinceCreation + card.interval;
    } else {
      // Correct answer
      if (card.type == 1) {
        // Learning
        card.interval += 1;
      } else {
        // Reviewing
        card.interval *= ease;
        card.factor = max(1300, card.factor + (ease - 2) * 100);
      }
      card.due = collection.daysSinceCreation + card.interval;
    }

    card.reps += 1;
  }

  List<Card> getDueCards() {
    int currentDate = collection.daysSinceCreation;
    return collection.cards.where((card) => card.due <= currentDate).toList();
  }
}

class Collection {
  DateTime _creationDate;
  List<Card> cards;
  SRSScheduler scheduler;

  Collection()
      : _creationDate = DateTime.now(),
        cards = [],
        scheduler = SRSScheduler() {
    _creationDate = DateTime(_creationDate.year, _creationDate.month, _creationDate.day);
    scheduler.collection = this;
  }

  void addNote(Note note) {
    cards.add(Card(note));
  }

  int get daysSinceCreation {
    return DateTime.now().difference(_creationDate).inDays;
  }
}

class Note {
  int id;
  List<String> tags;
  String front;
  String back;

  Note({required this.front, required this.back})
      : id = _generateIntId(),
        tags = [];

  void addTag(String tag) {
    if (!tags.contains(tag)) {
      tags.add(tag);
    }
  }
}

class Card {
  int id;
  Note note;
  DateTime creationDate;
  int type;
  int queue;
  int interval;
  int factor;
  int reps;
  int lapses;
  int left;
  int due;

  Card(this.note)
      : id = _generateIntId(),
        creationDate = DateTime.now(),
        type = 0,
        queue = 0,
        interval = 0,
        factor = 0,
        reps = 0,
        lapses = 0,
        left = 0,
        due = id;
}

int _generateIntId() {
  var random = Random();
  return random.nextInt(1 << 31);
}
