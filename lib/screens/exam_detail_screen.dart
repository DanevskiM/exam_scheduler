import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.datum.difference(now);

    if (difference.isNegative) return 'Испитот е веќе одржан';

    final days = difference.inDays;
    final hours = difference.inHours % 24;

    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.predmet),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.predmet,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text(
                      "${exam.datum.day}.${exam.datum.month}.${exam.datum.year}",
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    const SizedBox(width: 8),
                    Text(exam.vreme),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.meeting_room),
                    const SizedBox(width: 8),
                    Text(exam.prostorija),
                  ],
                ),
                const Divider(height: 30),
                Row(
                  children: [
                    const Icon(Icons.hourglass_bottom),
                    const SizedBox(width: 8),
                    Text(
                      "Преостанато време: ${getTimeRemaining()}",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
