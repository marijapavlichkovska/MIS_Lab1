import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String timeUntilExam() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);

    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);

    if (diff.isNegative) {
      return 'Испитот е веќе завршен.';
    }
    return '$days дена, $hours часа';
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subjectName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.subjectName,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_month),
                    const SizedBox(width: 8),
                    Text('${dateFormat.format(exam.dateTime)} '
                        'во ${timeFormat.format(exam.dateTime)}'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.meeting_room),
                    const SizedBox(width: 8),
                    Text('Простории: ${exam.rooms.join(', ')}'),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Преостанато време:',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 6),
                Text(
                  timeUntilExam(),
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
