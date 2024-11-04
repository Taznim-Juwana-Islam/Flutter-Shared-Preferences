import 'package:flutter/material.dart';
import 'theme_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final theme = await ThemePreferences.getThemePreference();
  runApp(MyApp(initialTheme: theme));
}

class MyApp extends StatelessWidget {
  final String? initialTheme;

  MyApp({this.initialTheme});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = initialTheme == 'dark';

    return MaterialApp(
      title: 'Theme Preferences App',
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  _loadThemePreference() async {
    final theme = await ThemePreferences.getThemePreference();
    setState(() {
      _isDarkTheme = theme == 'dark';
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
    ThemePreferences.saveThemePreference(_isDarkTheme ? 'dark' : 'light');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Preference'),
        actions: [
          IconButton(
            icon: Icon(_isDarkTheme ? Icons.light_mode : Icons.dark_mode),
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Current theme: ${_isDarkTheme ? 'Dark' : 'Light'}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
