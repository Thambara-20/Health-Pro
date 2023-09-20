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
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: isSelected ? Color.fromARGB(255, 3, 82, 128) : Color.fromARGB(255, 10, 190, 218),
                borderRadius: BorderRadius.circular(10),
                
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
