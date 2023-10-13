import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';

void _openSimpleItemPicker(BuildContext context, List<Text> items, String title, Function(dynamic) onSubmit) {
  BottomPicker(
    items: items,
    title: title,
    buttonText: 'Pilih',
    selectedItemIndex: 0,
    titlePadding: const EdgeInsets.only(top: 18),
    titleStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 18),
    bottomPickerTheme: BottomPickerTheme.temptingAzure,
    onSubmit: onSubmit,
    buttonAlignment: MainAxisAlignment.start,
    buttonWidth: MediaQuery.of(context).size.width - 56,
    buttonTextStyle: TextStyle(color: Colors.white),
    gradientColors: [
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.secondary
    ],
    displayButtonIcon: false,
    displaySubmitButton: true,
  ).show(context);
}

class InputPickerComponent extends StatefulWidget {
  List<String> items;
  String title;
  InputPickerComponent({super.key, required this.items, required this.title});

  @override
  State<InputPickerComponent> createState() => _InputPickerComponentState();
}

class _InputPickerComponentState extends State<InputPickerComponent> {
  final TextEditingController _controller = TextEditingController();
  List<Text> _pickerItems = [];
  void _handleSubmit(index) {
    _controller.text = widget.items[index];
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      print(widget.toString());
      _pickerItems = widget.items.map((e) => Text(e)).toList();
    });
    _controller.text = widget.items.isNotEmpty ? widget.items[0] : '';
  }

  @override
  
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onTap: () {
        _openSimpleItemPicker(context, _pickerItems, widget.title, _handleSubmit);
      },
      keyboardType: TextInputType.none,
      decoration: InputDecoration(
        hintText: widget.title,
        suffixIcon: Icon(Icons.expand_more)
      ),
      
    );
  }
}
