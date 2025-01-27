import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDown extends StatelessWidget {
  final String hintText; // Hint text for the dropdown
  final String selectedValue; // Currently selected value
  final List<DropdownMenuItem<String>> items; // Dropdown items
  final Function(String?) onChanged; // Callback for selection change
  final EdgeInsetsGeometry margin; // Custom margin
  final TextStyle? hintStyle; // Hint text style
  final String? headerText;
  final bool isRequired;

  const CustomDropDown({
    Key? key,
    required this.hintText,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.margin = const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
    this.hintStyle,  this.headerText,
    this.isRequired=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    headerText!=null? RichText(text: TextSpan(text:headerText!,
      style: Theme.of(context).textTheme.bodyLarge,
    children: [
      if(isRequired)
        TextSpan(
            text: " *",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.0,color: Colors.red)
        )
    ]
    )).paddingSymmetric(horizontal: 4.0):SizedBox.shrink(),
        Container(
          margin: margin,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButton<String>(
            underline: SizedBox(),
            style: Theme.of(context).textTheme.bodySmall,
            isExpanded: true,
            // value: selectedValue.isEmpty ? null : selectedValue,
            hint: Text(
              selectedValue.isEmpty ? hintText : selectedValue,
              style: hintStyle ??
                  Theme.of(context).textTheme.bodyMedium
            ).paddingAll(8.0),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
