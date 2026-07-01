import 'package:flutter/material.dart';

import '../model/google_office.dart';

class DetailPage extends StatelessWidget {
  final GoogleOffice googleOffice;
  final String? googleOfficeId;

  DetailPage({super.key, GoogleOffice? googleOffice, this.googleOfficeId})
    : googleOffice = googleOffice ?? listOfGoogleOffice.firstWhere(
                                      (offices) => offices.id == googleOfficeId,
                                      orElse: () => listOfGoogleOffice.first,    
                                      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DetailPage'),
      ),
      // TODO 2: change the widget below and add the selected Google office details
      body: Stack(
        children: [
          Positioned.fill(
            child: FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.4,
              child: Image.network(googleOffice.image, 
              fit: BoxFit.cover,
              width: double.infinity
              ),
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: FractionallySizedBox(
                heightFactor: 0.65,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.only(top: 24, left: 20),
                          child: Text(googleOffice.name, 
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.only(top: 4, left: 20),
                          child: ListTile(
                            leading: Icon(Icons.travel_explore, color: Colors.deepPurple.shade700, size: 30),
                            title: Text(googleOffice.region, 
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.only(top: 4, left: 20),
                          child: ListTile(
                            leading: Icon(Icons.location_on_rounded, color: Colors.deepPurple.shade700, size: 30),
                            title: Text('Address', 
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(googleOffice.address, 
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.only(top: 4, left: 20),
                          child: ListTile(
                            leading: Icon(Icons.phone, color: Colors.deepPurple.shade700, size: 30),
                            title: Text('Phone', 
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(googleOffice.phone, 
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.only(top: 4, left: 20),
                          child: ListTile(
                            leading: Icon(Icons.compass_calibration, color: Colors.deepPurple.shade700, size: 30),
                            title: Text('Coordinates',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Latitude',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text('${googleOffice.lat}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                    ),
                                  ],
                                ),

                                SizedBox(height: 12),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        'Longitude',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text('${googleOffice.lng}', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),)
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
