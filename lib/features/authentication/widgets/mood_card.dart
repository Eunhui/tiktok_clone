import 'package:flutter/material.dart';

class MoodCard extends StatefulWidget {
  final String content;
  final String mood;
  const MoodCard({
    super.key,
    required this.content,
    required this.mood,
  });

  @override
  State<MoodCard> createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: const Color(0xFF8ED1C6), // 배경색을 설정합니다.
            borderRadius: BorderRadius.circular(20.0), // 테두리를 둥글게 만듭니다.
            border: Border.all(
              color: Colors.black, // 테두리 색상을 설정합니다.
              width: 1.0, // 테두리 두께를 설정합니다.
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mood: 😍${widget.mood}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4.0), // 간격을 추가합니다.
              Text(
                '${widget.content}',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [Text("30 minutes ago")],
          ),
        )
      ],
    );
  }
}
