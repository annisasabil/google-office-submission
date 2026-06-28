import 'package:flutter/material.dart';

import '../model/google_office.dart';

class DetailPage extends StatelessWidget {
  final GoogleOffice googleOffice;
  final String? googleOfficeId;

  DetailPage({super.key, GoogleOffice? googleOffice, this.googleOfficeId})
    : googleOffice = googleOffice ?? listOfGoogleOffice.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DetailPage'),
      ),
      // TODO 2: change the widget below and add the selected Google office details
      body: const Center(child: Text('This is a text.')),
    );
  }
}
