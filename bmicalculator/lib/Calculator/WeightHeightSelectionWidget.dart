import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class WeightHeightSelectionWidget extends StatefulWidget {
  final String label;
  final int height;
  final int weight;

  final Function(int) onHeightChanged;
  final Function(int) onWeightChanged;

  WeightHeightSelectionWidget({
    required this.label,
    required this.height,
    required this.weight,
    required this.onHeightChanged,
    required this.onWeightChanged,
  });

  @override
  _WeightHeightSelectionWidgetState createState() =>
      _WeightHeightSelectionWidgetState();
      
}

class _WeightHeightSelectionWidgetState
    extends State<WeightHeightSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.label == 'Height'
                  ? Color.fromARGB(255, 70, 73, 255)
                  : Color.fromARGB(255, 70, 73, 255),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border.all(
                color: kborderColor,
                width: 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.label == 'Height' ? '${widget.height}' : '${widget.weight}',
                    style: widget.label == 'Height' ? kHeightStyle : kweightStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            // You should also update the BMI here
                            if (widget.label == 'Height') {
                              // Update height and calculate BMI
                              widget.onHeightChanged(widget.height + 1);
                            } else {
                              // Update weight and calculate BMI
                              widget.onWeightChanged(widget.weight + 1);
                            }
                          });
                        },
                        backgroundColor: kbuttonColor,
                        child: Icon(Icons.add, size: 30),
                      ),
                      const SizedBox(width: 10),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if (widget.height > 1) {
                              // You should also update the BMI here
                              if (widget.label == 'Height') {
                                // Update height and calculate BMI
                                widget.onHeightChanged(widget.height - 1);
                              } else {
                                // Update weight and calculate BMI
                                widget.onWeightChanged(widget.weight - 1);
                              }
                            }
                          });
                        },
                        backgroundColor: kbuttonColor,
                        child: Icon(Icons.remove, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
