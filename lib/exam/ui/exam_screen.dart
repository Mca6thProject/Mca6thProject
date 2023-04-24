import 'package:flutter/material.dart';

import 'widget/exam_card.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam Notice'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exam Schedule',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'Date: April 30, 2023',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Time: 10:00 AM to 1:00 PM',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Exam Syllabus',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text('Mathematics'),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text('Science'),
                  ),
                  ListTile(
                    leading: Icon(Icons.arrow_right),
                    title: Text('Social Science'),
                  ),
                  ListTile(
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
