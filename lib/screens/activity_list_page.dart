import 'package:flutter/material.dart';

import 'activity_detail_page.dart';
import 'activity_form_page.dart';

class ActivityListPage extends StatefulWidget {
  const ActivityListPage({super.key});

  @override
  State<ActivityListPage> createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {
  final List<Map<String, String>> _activities = [
    {
      'title': 'เดินเล่น',
      'date': '24 ต.ค. 2026',
      'detail': 'เดินในสวน',
      'category': 'พักผ่อน',
    },
    {
      'title': 'อ่านหนังสือ',
      'date': '23 ต.ค. 2026',
      'detail': 'อ่าน 20 นาที',
      'category': 'การเรียน',
    },
    {
      'title': 'ออกกำลัง1',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง2',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง3',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง4',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง5',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง6',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง7',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง8',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง9',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง10',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง11',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง12',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง13',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title': 'ออกกำลัง14',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
    {
      'title':
          'การออกกำลังกาย เป็นกิจกรรมทางกายใด ๆ ก็ได้ที่เสริมหรือคงสภาพ สมรรถภาพทางกาย ความแข็งแรงและ สุขภาพ',
      'date': '22 ต.ค. 2026',
      'detail': 'ยืดกล้ามเนื้อ',
      'category': 'สุขภาพ',
    },
  ];

  Future<void> _navigateToForm() async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute<Map<String, String>>(
        builder: (context) => const ActivityFormPage(),
      ),
    );

    if (result != null) {
      setState(() {
        _activities.insert(0, result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('กิจกรรม')),
      body: _activities.isEmpty
          ? const Center(child: Text('ยังไม่มีกิจกรรม'))
          : ListView.separated(
              itemCount: _activities.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = _activities[index];
                final category = item['category'];

                return InkWell(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => ActivityDetailPage(item: item),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item['date']!,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (category != null && category.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        key: const Key('add_activity_fab'),
        onPressed: _navigateToForm,
        tooltip: 'เพิ่มกิจกรรม',
        child: const Icon(Icons.add),
      ),
    );
  }
}
