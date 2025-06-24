
import 'package:flutter/material.dart';

class RatingUser extends StatefulWidget {
  final String label;
   final double value ;
   final ValueChanged<double>? onChanged;
 const  RatingUser({super.key, required this.label, required this.value,  this.onChanged});
 RatingUser copyWith ({String?  label , double ? value}){
  return RatingUser(label: label ?? this.label, value: value??this.value);
 }
  @override
  State<RatingUser> createState() => _RatingUserState();
}

class _RatingUserState extends State<RatingUser> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Text(
          widget.value.toString(),
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 7,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 5,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              overlayShape: SliderComponentShape.noOverlay,
              activeTrackColor: Colors.black,
              inactiveTrackColor: const Color(0xFFE5E8EC),
              disabledActiveTrackColor: Colors.black,
              disabledInactiveTrackColor: const Color(0xFFE5E8EC),
            ),
            child: Slider(
              value: widget.value.toDouble(),
              min: 0,
              max: 5,
              divisions: 5,
              onChanged: widget.onChanged,
            ),
          ),
        ),
      ],
    );
  }
}