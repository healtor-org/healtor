import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healtor/screens/login_screen.dart';
import 'package:healtor/screens/maps.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healtor - safe everywhere ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Navigation(),
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const LoginScreen(),
    const MapsPage(),
    const LoginScreen(),
    const LoginScreen(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to healtor'),
      ),
      body: IndexedStack(children: [
        Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        )
      ]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                  Icons.home,
              ),
              label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.near_me,
            ),
            label: 'Near me',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medical_services,
            ),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.login,
            ),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}