import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> get exams {
    return [
      Exam(
        predmet: 'Веројатност и статистика',
        datum: DateTime(2025, 11, 17),
        vreme: '10:00',
        prostorija: 'Lab 215',
      ),
      Exam(
        predmet: 'Мобилни информациски системи',
        datum: DateTime(2025, 12, 15),
        vreme: '10:00',
        prostorija: 'Lab 215',
      ),
      Exam(
        predmet: 'Управување со техничка поддршка',
        datum: DateTime(2025, 11, 15),
        vreme: '12:00',
        prostorija: 'Lab 138',
      ),
      Exam(
        predmet: 'Дигитизација',
        datum: DateTime(2025, 11, 22),
        vreme: '09:00',
        prostorija: 'Lab 138',
      ),
      Exam(
        predmet: 'Оперативни системи',
        datum: DateTime(2025, 11, 24),
        vreme: '13:00',
        prostorija: 'Lab 200AB',
      ),
      Exam(
        predmet: 'Софтверски квалитет и тестирање',
        datum: DateTime(2025, 11, 28),
        vreme: '10:00',
        prostorija: 'Lab 200AB',
      ),
      Exam(
        predmet: 'Дизајн на интеракција човек компјутер',
        datum: DateTime(2025, 11, 30),
        vreme: '11:00',
        prostorija: 'Lab 13',
      ),
      Exam(
        predmet: 'Основи на роботика',
        datum: DateTime(2025, 12, 1),
        vreme: '09:00',
        prostorija: 'Lab 12',
      ),
      Exam(
        predmet: 'Напредно програмирање',
        datum: DateTime(2025, 11, 20),
        vreme: '10:30',
        prostorija: 'Lab 2',
      ),
      Exam(
        predmet: 'Веб дизајн',
        datum: DateTime(2025, 11, 16),
        vreme: '08:30',
        prostorija: 'Lab 3',
      ),
    ]..sort((a, b) => a.datum.compareTo(b.datum));
  }

  @override
  Widget build(BuildContext context) {
    final examList = exams;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221182'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: examList.length,
                itemBuilder: (context, index) {
                  final exam = examList[index];
                  return ExamCard(
                    exam: exam,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ExamDetailScreen(exam: exam),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlueAccent,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, color: Colors.black),
            const SizedBox(width: 8),
            Text(
              "Вкупно испити: ${examList.length}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
