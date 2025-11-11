import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd.MM.yyyy');
    final timeFormat = DateFormat('HH:mm');
    final now = DateTime.now();

    final isPast = exam.dateTime.isBefore(now);
    final color = isPast ? Colors.grey.shade300 : Colors.lightBlue.shade50;
    final borderColor = isPast ? Colors.grey : Colors.blue;

    return Card(
      color: color,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.subjectName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 6),
                Text('${dateFormat.format(exam.dateTime)}  '
                    '${timeFormat.format(exam.dateTime)}'),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.room, size: 18),
                const SizedBox(width: 6),
                Text(exam.rooms.join(', ')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
