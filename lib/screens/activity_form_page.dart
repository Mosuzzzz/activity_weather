import 'package:flutter/material.dart';

class ActivityFormPage extends StatefulWidget {
  const ActivityFormPage({super.key});

  @override
  State<ActivityFormPage> createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _noteController = TextEditingController();

  String? _category;

  final List<String> categories = ['สุขภาพ', 'การเรียน', 'พักผ่อน'];

  @override
  void dispose() {
    _nameController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final now = DateTime.now();
    const thaiMonths = [
      '',
      'ม.ค.',
      'ก.พ.',
      'มี.ค.',
      'เม.ย.',
      'พ.ค.',
      'มิ.ย.',
      'ก.ค.',
      'ส.ค.',
      'ก.ย.',
      'ต.ค.',
      'พ.ย.',
      'ธ.ค.',
    ];
    final formattedDate =
        '${now.day} ${thaiMonths[now.month]} ${now.year + 543}';

    final item = <String, String>{
      'title': _nameController.text.trim(),
      'category': _category!,
      'detail': _noteController.text.trim(),
      'date': formattedDate,
    };

    Navigator.pop(context, item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เพิ่มกิจกรรม')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // 1. Activity Name: Max 60 chars, Required
              TextFormField(
                key: const Key('name_input'),
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'ชื่อกิจกรรม',
                  hintText: 'กรอกชื่อกิจกรรม',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.edit_note),
                ),
                validator: (value) {
                  final trimmed = value?.trim() ?? '';
                  if (trimmed.isEmpty) {
                    return 'กรุณากรอกชื่อ';
                  }
                  if ((value ?? '').length > 60 || trimmed.length > 60) {
                    return 'ชื่อยาวเกิน 60 ตัวอักษร';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // 2. Category: Required
              DropdownButtonFormField<String>(
                key: const Key('category_dropdown'),
                initialValue: _category,
                decoration: const InputDecoration(
                  labelText: 'หมวดหมู่',
                  hintText: 'เลือกหมวดหมู่',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'กรุณาเลือกหมวดหมู่';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // 3. Note: Max 240 chars, Optional
              TextFormField(
                key: const Key('note_input'),
                controller: _noteController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'หมายเหตุ',
                  hintText: 'กรอกหมายเหตุ (ไม่บังคับ)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.notes),
                ),
                validator: (value) {
                  if (value != null && value.length > 240) {
                    return 'หมายเหตุยาวเกิน 240 ตัวอักษร';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              // Submit Button
              ElevatedButton(
                key: const Key('submit_button'),
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('บันทึกกิจกรรม', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
