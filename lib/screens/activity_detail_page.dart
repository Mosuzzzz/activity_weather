import 'package:flutter/material.dart';

class ActivityDetailPage extends StatelessWidget {
  const ActivityDetailPage({super.key, required this.item});

  final Map<String, String> item;

  @override
  Widget build(BuildContext context) {
    final title = item['title'] ?? '';
    final category = item['category'];
    final date = item['date'];
    final detail = item['detail'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (category != null && category.isNotEmpty) ...[
              Chip(
                avatar: const Icon(Icons.category, size: 16),
                label: Text(category),
              ),
              const SizedBox(height: 12),
            ],
            if (date != null && date.isNotEmpty) ...[
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 6),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
            const Text(
              'รายละเอียด / หมายเหตุ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              detail.isEmpty ? '(ไม่มีหมายเหตุ)' : detail,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
