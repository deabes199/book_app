import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/core/widgets/custom_circle_button.dart';
import 'package:book_app/feathers/search/logic/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircleButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_back,
          iconSize: 30,
        ),
        horzintalSpace(4),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.shade300,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                onChanged: (value) {
                  controller.text = value;
                  context.read<SearchCubit>().searchBook(value);
                },
                controller: controller,
              );
            },
          ),
        ),
      ],
    );
  }
}
