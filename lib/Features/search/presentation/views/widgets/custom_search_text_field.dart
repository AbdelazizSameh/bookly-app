import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../manager/search_book_cubit/search_book_cubit.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key});

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<SearchBookCubit>();
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      controller: _controller,
      onSubmitted: (value) {
        searchCubit.searchFreeBooks(
          intitleString: _controller.text.trim(),
          newSearch: true,
          newCategoryStartIndex: 0,
        );
      },

      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'Search',

        suffixIcon: IconButton(
          onPressed: () => searchCubit.searchFreeBooks(
            intitleString: _controller.text.trim(),
            newSearch: true,
            newCategoryStartIndex: 0,
          ),
          icon: const Opacity(
            opacity: .8,
            child: Icon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
