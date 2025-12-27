import 'dart:ffi';

import 'package:flutter/material.dart';

class ValueWidget extends StatefulWidget {
  final String title;
  final String unit;
  final String value; 
  final Color color;
  final IconData icon;
  const ValueWidget(this.title , this.value, this.unit, this.color,this.icon, {super.key});

  @override
  State<ValueWidget> createState() => _ValueWidgetState();
}

class _ValueWidgetState extends State<ValueWidget> {
  
  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 160,
        height: 140,
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(widget.icon, color: widget.color,size: 22,),
                Text(
                  widget.unit,
                  style: Theme.of(context).textTheme.bodyLarge
                  )
            ],),
            Text(
              widget.value.toString(),
              style: Theme.of(context).textTheme.titleLarge,
              ),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.labelMedium,
            )
          ]

        ),
      );
  }
}