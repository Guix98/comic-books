import 'package:flutter/material.dart';

class ViewSelector extends StatefulWidget {
  final Function(String) onChanged;

  const ViewSelector({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<ViewSelector> createState() => _ViewSelectorState();
}

class _ViewSelectorState extends State<ViewSelector> {
  String selectedOption = 'ListView'; // Default selection

  void selectOption(String option) {
    setState(() {
      selectedOption = option;
    });
    widget.onChanged(option);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton.icon(
          onPressed: () => selectOption('ListView'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return selectedOption == 'ListView' ? Colors.green : Colors.grey;
            }),
          ),
          icon: const Icon(Icons.list),
          label: const Text('List View'),
        ),
        const SizedBox(width: 10),
        TextButton.icon(
          onPressed: () => selectOption('GridView'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              return selectedOption == 'GridView' ? Colors.green : Colors.grey;
            }),
          ),
          icon: const Icon(Icons.grid_on),
          label: const Text('Grid View'),
        ),
      ],
    );
  }
}
