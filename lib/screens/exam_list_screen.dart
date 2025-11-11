import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> get exams => [
    Exam(
      subjectName: 'Структурно програмирање',
      dateTime: DateTime(2026, 1, 15, 10, 0),
      rooms: ['Барака 1', 'Барака 2.1'],
    ),
    Exam(
      subjectName: 'Калкулус 1',
      dateTime: DateTime(2026, 1, 28, 9, 0),
      rooms: ['Барака 2.2'],
    ),
    Exam(
      subjectName: 'Алгоритми и податочни структури',
      dateTime: DateTime(2026, 2, 23, 8, 30),
      rooms: ['ФИНКИ АМФ', 'МФ АМФ'],
    ),
    Exam(
      subjectName: 'Компјутерски мрежи и безбедност',
      dateTime: DateTime(2026, 2, 22, 11, 0),
      rooms: ['ТМФ 117'],
    ),
    Exam(
      subjectName: 'Објектно ориентирано програмирање',
      dateTime: DateTime(2026, 3, 17, 9, 30),
      rooms: ['Лаб 200аб', 'Лаб 200в', 'Лаб 215'],
    ),
    Exam(
      subjectName: 'Бази на податоци',
      dateTime: DateTime(2025, 4, 1, 10, 0),
      rooms: ['Лаб 215'],
    ),
    Exam(
      subjectName: 'Оперативни системи',
      dateTime: DateTime(2025, 5, 1, 9, 0),
      rooms: ['ТМФ 117'],
    ),
    Exam(
      subjectName: 'Вештачка интелигенција',
      dateTime: DateTime(2025, 5, 5, 10, 0),
      rooms: ['Лаб 2', 'Лаб 3'],
    ),
    Exam(
      subjectName: 'Дизајн и архитектура на софтвер',
      dateTime: DateTime(2025, 4, 10, 11, 0),
      rooms: ['ФИНКИ АМФ'],
    ),
    Exam(
      subjectName: 'Веројатност и статистика',
      dateTime: DateTime(2025, 6, 28, 9, 0),
      rooms: ['Барака 1'],
    ),
    Exam(
      subjectName: 'Машинско учење',
      dateTime: DateTime(2025, 10, 27, 9, 0),
      rooms: ['Барака 2.2'],
    ),
    Exam(
      subjectName: 'Дизајн и интеракција на човек-компјутер',
      dateTime: DateTime(2026, 1, 15, 9, 0),
      rooms: ['Лаб 13'],
    ),
    Exam(
      subjectName: 'Интегрирани системи',
      dateTime: DateTime(2025, 11, 15, 9, 0),
      rooms: ['Лаб 200аб'],
    ),
    Exam(
      subjectName: 'Мобилни информациски системи',
      dateTime: DateTime(2025, 12, 15, 9, 0),
      rooms: ['МФ АМФ'],
    ),
    Exam(
      subjectName: 'Програмирање на видео игри',
      dateTime: DateTime(2025, 12, 27, 9, 0),
      rooms: ['Лаб 200аб', 'Лаб 215'],
    ),
    Exam(
      subjectName: 'Дискретна математика',
      dateTime: DateTime(2025, 11, 27, 9, 0),
      rooms: ['Лаб 2', 'Лаб 3', 'Лаб 12'],
    ),
  ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221504'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExamDetailScreen(exam: exam),
                ),
              );
            },
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.indigo,
        child: Text(
          'Вкупно испити: ${exams.length}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
