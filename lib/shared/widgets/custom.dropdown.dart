import 'package:flutter/material.dart';
import 'package:sgem/config/theme/app_theme.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> options;
  final bool isSearchable;
  final String? selectedValue;
  final Function(String?) onChanged;

  const CustomDropdown({
    required this.hintText,
    required this.options,
    required this.onChanged,
    this.selectedValue,
    this.isSearchable = false,
    super.key,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;
  List<String> filteredOptions = [];

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
    filteredOptions = widget.options;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            isExpanded: true,
            hint: Text(
              widget.hintText,
              style: const TextStyle(
                color: AppTheme.primaryText,
                fontSize: 16,
              ),
            ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppTheme.alternateColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppTheme.alternateColor,
                  width: 2.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 12.0,
              ),
            ),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged(value);
            },
            items: filteredOptions.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
          ),
        ),
        if (widget.isSearchable)
          _buildSearchBar(),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Buscar...',
          border: OutlineInputBorder(),
        ),
        onChanged: (query) {
          setState(() {
            filteredOptions = widget.options
                .where((option) =>
                    option.toLowerCase().contains(query.toLowerCase()))
                .toList();
          });
        },
      ),
    );
  }
}
