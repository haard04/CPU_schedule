import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//final Uri _url = Uri.parse('https://flutter.dev');


Future<void> _launchUrl(_url) async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

class profileCard extends StatelessWidget {
  String name;
  String role;
  String url;
  String rollno;
   profileCard(this.name,this.role,this.rollno,this.url,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final Uri _url = Uri.parse(url);
    return Card(
    
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Name: '+name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Role: '+role,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('Roll Number: '+rollno,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                
                GestureDetector(
                  
                  onTap: () => _launchUrl(_url) ,
                  child: Text('LinkedIn:' +name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    
                    color: Colors.blue,
                    fontSize: 18
                  ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}