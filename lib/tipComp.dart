import 'package:flutter/material.dart';

class TipCompWidget extends StatelessWidget {
  IconData icon; 
  Color color;
  String title; 
  String content;
  TipCompWidget(this.icon, this.color, this.title, this.content, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
  constraints: const BoxConstraints(
    maxWidth: 500,
  ),
  margin: EdgeInsets.symmetric(vertical: 12),
  padding: const EdgeInsets.all(24),
  decoration: BoxDecoration(
    color: Theme.of(context).primaryColor,
    borderRadius: BorderRadius.circular(16),
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Icon(icon, color: color, size:30),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium,
              softWrap: true,
            ),
          ],
        ),
      ),
    ],
  ),
);

  }
}