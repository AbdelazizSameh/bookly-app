import 'package:flutter/material.dart';
import 'widgets/books_details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const BooksDetailsViewBody());
  }
}
