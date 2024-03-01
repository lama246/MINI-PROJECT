import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PersonalPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://cdn-files.cloud/wp-content/blogs.dir/32/files/2018/03/9-tips-beautiful-baby-photos-aperture.jpg'),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'AMMU S ',
                            style: TextStyle(
                              fontFamily: 'Cupertino',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                          Text('Age 1 years | Female'),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Handle the notification button
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                padding: const EdgeInsets.all(20.0),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: <Widget>[
                  _buildGridItem(
                      'Vaccine Alert', Icons.medical_services, Colors.purple),
                  _buildGridItem('Entertainment', Icons.movie, Colors.red),
                  _buildGridItem('Tips', Icons.lightbulb, Colors.blue),
                  _buildGridItem('Product', Icons.shopping_cart,const Color.fromARGB(255, 247, 198, 76)),
                  _buildGridItem('Hospital', Icons.local_hospital, Colors.pink),
                  _buildGridItem('Help', Icons.help, Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0
                    ? Colors.grey
                    : Colors.grey), //color change currently not working
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 1
                    ? Colors.grey
                    : Colors.grey), //color change currently not working
            label: 'Personal',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildGridItem(String title, IconData icon, Color color) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          if (title == 'Vaccine Alert') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VaccineAlertPage()),
            );
          }
          if (title == "Tips") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Tips()),
            );
          }
          if (title == "Entertainment") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Entertainment()),
            );
          }
          if (title == "Product") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Product()),
            );
          }
          if (title == "Hospital") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Hospital()),
            );
          }
          if (title == "Help") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Help()),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 40.0, color: Colors.white),
              Text(title, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

// use all pages in single dart file last stage it may change to different file

//vaccine page
class VaccineAlertPage extends StatelessWidget {
  const VaccineAlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccine Alert'),
      ),
      body: const Center(
        child: Text(
          'This is the Vaccine Alert page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

//tips page
class Tips extends StatelessWidget {
  const Tips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentingTips()),
                );
              },
              child: const Card(
                color: Colors.lightBlueAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.family_restroom, size: 48.0, color: Colors.white),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Parenting',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChildHealthTips()),
                );
              },
              child: const Card(
                color: Colors.pinkAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.local_hospital, size: 48.0, color: Colors.white),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Child Health',
                          style: TextStyle(fontSize: 24, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//subclass parentingtips
class ParentingTips extends StatelessWidget {
  const ParentingTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parenting Tips'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Show love and affection: Children thrive on love and affection. Make sure to express your love for them regularly through words and actions.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Set a good example: Children learn by observing their parents. Be a role model by demonstrating the behavior you want to see in them.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Be consistent: Establish clear rules and expectations, and be consistent in enforcing them. This helps children feel secure and understand boundaries.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Communicate effectively: Listen to your child\'s thoughts and feelings, and communicate openly and honestly with them. Encourage them to do the same.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Encourage independence: Allow your child to make age-appropriate decisions and learn from their mistakes. This helps them develop independence and self-confidence.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Provide structure and routine: Children thrive on routine. Establishing a regular schedule can help them feel more secure and make transitions easier.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Encourage healthy habits: Teach your child the importance of healthy eating, exercise, and good hygiene habits. Set a good example by practicing these habits yourself.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Spend quality time together: Make time for one-on-one activities with your child. This helps strengthen your bond and creates lasting memories.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Be patient and understanding: Parenting can be challenging, and children will make mistakes. Be patient and understanding, and use mistakes as opportunities for learning and growth.'),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Seek support when needed: Parenting can be overwhelming at times. Don\'t hesitate to seek support from family, friends, or a professional if you need help or advice.'),
            ),
          ],
        ),
      ),
    );
  }
}

//subclass childcare tips
class ChildHealthTips extends StatelessWidget {
  const ChildHealthTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Child Health Tips'),
      ),
      body: const Center(
        child: Text(
          'This is the Child Health Tips page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}



//entertainment page
class Entertainment extends StatelessWidget {
  const Entertainment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entertainment'),
      ),
      body: const Center(
        child: Text(
          'This is the Entertainment  page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

//help page
class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child: Text(
          'This is the Help  page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

//product page
class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('product'),
      ),
      body: const Center(
        child: Text(
          'This is the product page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

//hospital page
class Hospital extends StatelessWidget {
  const Hospital({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital'),
      ),
      body: const Center(
        child: Text(
          'This is the Hospital  page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class PersonalPage extends StatelessWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal'),
        automaticallyImplyLeading: false, // Remove the back button
      ),
      body: const Center(
        child: Text(
          'This is the Personal page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: 'Personal',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}




