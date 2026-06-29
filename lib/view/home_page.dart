import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/model/google_office.dart';
import 'package:flutter_pemula_project/view/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();
  List<GoogleOffice> filteredOffice = listOfGoogleOffice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage'),
      ),
      // TODO 1: change the widget below and add a Google office list
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Cari berdasarkan nama',
              filled: true,
              fillColor: Colors.deepPurple.shade100,
              suffixIcon: Icon(Icons.search, color: Colors.deepPurple.shade700),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.deepPurple.shade100,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.deepPurple.shade100,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.deepPurple.shade100,
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                filteredOffice = listOfGoogleOffice.where((offices){
                  return offices.name
                    .toLowerCase()
                    .contains(value.toLowerCase());
                }).toList();
              });
            },
          ),
          ),

          Expanded(
            child: GoogleOfficeList(
              offices: filteredOffice,
              onTap: (id){
                navigateToDetailPage(context, id);
              },
            ))
        ],
      )
    );
  }

  void navigateToDetailPage(BuildContext context, String googleOfficeId){
    // TODO 3: edit this function to navigate to DetailPage
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) =>
        DetailPage(googleOfficeId: googleOfficeId),
      ));
  }
}

class GoogleOfficeList extends StatelessWidget {

  final List<GoogleOffice> offices;
  final Function(String) onTap;

  const GoogleOfficeList({
    super.key,
    required this.offices,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offices.length,
      itemBuilder: (context, index){
        final googleOffice = offices[index];
        return GoogleOfficeCard(
          googleOffice: googleOffice,
          onTap: () => 
            onTap(googleOffice.id),
        );
      });
  }
}

class GoogleOfficeCard extends StatelessWidget {

  final GoogleOffice googleOffice;
  final VoidCallback onTap;

  const GoogleOfficeCard({
    super.key,
    required this.googleOffice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              googleOffice.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28, top: 4),
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
      ),
    );
  }
}
