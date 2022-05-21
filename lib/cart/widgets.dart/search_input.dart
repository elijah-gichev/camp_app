import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController textEditingController;

  final String _defaultValue;

  SearchInput({
    Key? key,
    String? defaultValue,
    required this.textEditingController,
  })  : _defaultValue = defaultValue ?? '',
        super(key: key) {
    textEditingController.text = _defaultValue;
  }

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF2F3F4),
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: TextField(
        controller: widget.textEditingController,
        maxLength: 14,
        decoration: InputDecoration(
          suffixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
          //prefixIconConstraints: BoxConstraints.tight(const Size(30, 30)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0.r),
            borderSide: BorderSide.none,
          ),
          counterText: '',
          hintText: 'Поиск',
          hintStyle: const TextStyle(color: Color(0xffA3AEB2)),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          prefixText: '',
          prefixStyle: const TextStyle(color: Colors.black),
        ),
        //onChanged: (phone) => context.read<RegisterCubit>().phoneChanged(phone),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
