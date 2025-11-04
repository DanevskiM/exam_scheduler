import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.datum.isBefore(now);

    return Card(
      color: isPast ? Colors.grey[300] : Colors.deepPurple[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: ListTile(
        onTap: onTap,
        title: Text(
          exam.predmet,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.black54 : Colors.deepPurple,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 6),
                Text(
                  "${exam.datum.day.toString().padLeft(2, '0')}.${exam.datum.month.toString().padLeft(2, '0')}.${exam.datum.year}",
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 6),
                Text(exam.vreme),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                const Icon(Icons.meeting_room, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text(exam.prostorija)),
              ],
            ),
          ],
        ),
        trailing: Icon(
          isPast ? Icons.check_circle : Icons.schedule,
          color: isPast ? Colors.green : Colors.orange,
        ),
      ),
    );
  }
}
