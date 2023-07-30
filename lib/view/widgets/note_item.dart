import 'package:flutter/material.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white12
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red
            ),
          ),
          const SizedBox(width: 15,),
          const Expanded(
            child: Text('shopping list, food for the week and anything else to have',
            maxLines: 1,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            ),
          ),
          const SizedBox(width: 15,),
          Column(
            children: [
              Text(
                '${now.day}/${now.month}',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16
              ),
              ),
              Text('$hour:$minute',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}
