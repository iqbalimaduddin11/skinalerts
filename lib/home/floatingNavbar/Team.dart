import 'package:flutter/material.dart'; 

class ProjectTeamPage extends StatefulWidget {
  @override
  _ProjectTeamPageState createState() => _ProjectTeamPageState();
}


class _ProjectTeamPageState extends State<ProjectTeamPage> { 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F9F1),
      appBar: AppBar(
        backgroundColor: Color(0xFFF2F9F1),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(
          child: Text(
            'Project Team',
            style: TextStyle(
              color: Color(0xFF5C715E),
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'LeagueSpartan',
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TeamMember(
            name: 'Unique Scovi Egnel',
            role: 'Project Manager',
            imagePath: 'assets/Icons/unique.png', // Replace with your image path
          ),
          TeamMember(
            name: 'Raynaldi Sandy',
            role: 'Developer 1',
            imagePath: 'assets/Icons/raynaldi.png', // Replace with your image path
          ),
          TeamMember(
            name: 'Iqbal Imaduddin R.',
            role: 'Developer 2',
            imagePath: 'assets/Icons/iqbal.png', // Replace with your image path
          ),
          TeamMember(
            name: 'Anisa Riska Septiyana',
            role: 'Quality Assurance',
            imagePath: 'assets/Icons/riska.png', // Replace with your image path
          ),
          SizedBox(height: 16.0),
          Center(
            child: Text(
              'Pemrograman Mobile',
              style: TextStyle(
                color: Color(0xFF5C715E),
                fontSize: 16,
                fontFamily: 'LeagueSpartan',
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}

class TeamMember extends StatelessWidget {
  final String name;
  final String role;
  final String imagePath;

  TeamMember({
    required this.name,
    required this.role,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFD6E8DA),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
              Text(
                role,
                style: TextStyle(
                  color: Color(0xFF5C715E),
                  fontSize: 16,
                  fontFamily: 'LeagueSpartan',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}