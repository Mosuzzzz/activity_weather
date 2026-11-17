import 'package:flutter/material.dart';

class ActivityListPage extends StatelessWidget {
  const ActivityListPage({super.key});

  static const activities = <Map<String, String>>[
    {'title': 'เดินเล่น', 'date': '24 ต.ค. 2026', 'detail': 'เดินในสวน'},
    {'title': 'อ่านหนังสือ', 'date': '23 ต.ค. 2026', 'detail': 'อ่าน 20 นาที'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {'title': 'ออกกำลัง', 'date': '22 ต.ค. 2026', 'detail': 'ยืดกล้ามเนื้อ'},
    {
      'title': 'การออกกำลังกาย เป็นกิจกรรมทางกายใด ๆ ก็ได้ที่เสริมหรือคงสภาพ สมรรถภาพทางกาย ความแข็งแรงและ สุขภาพ',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('กิจกรรม')),
      body: activities.isEmpty
          ? const Center(child: Text('ยังไม่มีกิจกรรม'))
          : ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final item = activities[index];

                return InkWell(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: Text(item['title']!)),
                          body: Center(child: Text(item['detail']!)),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(fontSize: 17),
                        ),
                        Text(item['date']!),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
