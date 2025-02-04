import 'package:book_app/core/utils/spacing.dart';
import 'package:book_app/feathers/search/ui/widgets/search_bloc_builder.dart';
import 'package:book_app/feathers/search/ui/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              SearchTextField(),
              vertcalSpace(20),
              const SearchBookBlocBuilder()
            ],
          ),
        ),
      ),
    );
  }
}

