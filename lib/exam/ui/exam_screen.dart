import 'package:flutter/material.dart';

import 'widget/exam_card.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Notice'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Exam Schedule',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Date: April 30, 2023',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Text(
                'Time: 10:00 AM to 1:00 PM',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              const Text(
                'Exam Syllabus',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text('Mathematics'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text('Science'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text('Social Science'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text('English Language'),
                  ),
                  ExamNoticeCard(
                    examDate: '01.02.2023',
                    examTime: '00',
                    examTitle: 'Final',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
