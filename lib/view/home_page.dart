import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/model/google_office.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage'),
      ),
      // TODO 1: change the widget below and add a Google office list
      body: GoogleOfficeList(),
    );
  }

  void navigateToDetailPage(){
    // TODO 3: edit this function to navigate to DetailPage
  }
}

class GoogleOfficeList extends StatelessWidget {
  const GoogleOfficeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOfGoogleOffice.length,
      itemBuilder: (context, index){
        final googleOffice = listOfGoogleOffice[index];
        return GoogleOfficeCard(
          googleOffice: googleOffice,
        );
      });
  }
}

class GoogleOfficeCard extends StatelessWidget {

  final GoogleOffice googleOffice;

  const GoogleOfficeCard({
    super.key,
    required this.googleOffice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            image: DecorationImage(
              image: NetworkImage(googleOffice.image), fit: BoxFit.cover)
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 28, top: 12),
          child: Text(googleOffice.name, 
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: ListTile(
            leading: Icon(Icons.location_on_outlined, color: Colors.deepPurple.shade700,),
            title: Text(googleOffice.address, 
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                letterSpacing: 1,
              ),
            ),
          )
        )
      ],
    );
  }
}
