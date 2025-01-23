import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSchoolClicked = false;

  void _onSchoolItemClick() {
    setState(() {
      isSchoolClicked = !isSchoolClicked; // Toggle the flag when clicked
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("HOMEPAGE")), // Center the title
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'P****sa@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            _createDrawerItem(
              icon: Icons.assignment,
              text: 'Exam',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExamPage()),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.class_,
              text: 'Class',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClassPage()),
                );
              },
            ),
            _createDrawerItem(
              icon: Icons.school, // School item added
              text: 'School',
              onTap: () {
                _onSchoolItemClick();
              },
            ),
            _createDrawerItem(
              icon: Icons.logout,
              text: 'Logout',
              onTap: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Logout')));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            _buildRectangle(
              context,
              'Students: 120',
              Icons.group,
              Colors.green,
              Colors.white,
            ),
            SizedBox(height: 20),
            _buildRectangle(
              context,
              'Exams: 5',
              Icons.assignment,
              Colors.blue,
              Colors.white,
            ),
            SizedBox(height: 20),
            _buildRectangle(
              context,
              'Subjects: 8',
              Icons.book,
              Colors.yellow,
              Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  Widget _buildRectangle(BuildContext context, String content, IconData icon, Color color, Color textColor) {
    return Container(
      width: double.infinity,
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 60,
              color: textColor,
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 24,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Exam Page with List, delete icon, and search bar
class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<String> exams = ['Math Exam', 'Science Exam', 'History Exam', 'English Exam', 'Art Exam'];
  List<String> filteredExams = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredExams = exams; // Initially, all exams are visible
    _searchController.addListener(() {
      _filterExams();
    });
  }

  void _addExam() {
    setState(() {
      exams.add('New Exam');
      _filterExams();
    });
  }

  void _deleteExam(int index) {
    setState(() {
      exams.removeAt(index);
      _filterExams();
    });
  }

  void _filterExams() {
    setState(() {
      filteredExams = exams
          .where((exam) =>
              exam.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _addExam, // Add new exam
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Exam',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredExams.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredExams[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteExam(index), // Delete the exam
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ClassPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Class Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
