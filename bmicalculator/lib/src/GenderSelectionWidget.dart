import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';

class GenderSelectionWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;
  final String label;

  GenderSelectionWidget({
    required this.isSelected,
    required this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          GestureDetector(
            onTap:() {onTap();},
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[500] : Colors.yellow[600],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: kborderColor,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      icon,
                      size: 100,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
