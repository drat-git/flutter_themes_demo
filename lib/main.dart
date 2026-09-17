import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  // Variable to manage the current theme mode
  ThemeMode _themeMode = ThemeMode.system;

  // Method to toggle the theme
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Status Card Demo',
      
      // TODO: Customize these themes further if desired
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.grey[200], // Light mode background
      ),
      darkTheme: ThemeData.dark(), // Dark mode configuration
      
      themeMode: _themeMode, // Connects the state to the app

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Status Card Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // PART 1 TASK: Avatar and Text
              CircleAvatar(
                radius: 45,
                backgroundColor: _themeMode == ThemeMode.dark
                    ? Colors.teal
                    : Colors.blueGrey,
                // Personalize the avatar with a palette icon to represent colors and themes.
                child: const Icon(Icons.palette, size: 42, color: Colors.white),
              ),

              const SizedBox(height: 12),

              const Text(
                'Flutter Theme Lab',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // PART 1 TASK: Status Badge Container
              AnimatedContainer(
                //Changes the container to fading
                duration: const Duration(milliseconds: 400),
                width: 220,
                height: 64,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // Use a ternary operator to check theme brightness
                  // Personalize the badge with light purple in dark mode and blue in light mode.
                  color: _themeMode == ThemeMode.dark 
                      ? Colors.purple[200] 
                      : Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                  // Add a subtle shadow to give the badge depth.
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.circle, size: 12, color: Colors.black87),
                    const SizedBox(width: 8),
                    // Change the displayed status to match the selected theme.
                    Text(
                      _themeMode == ThemeMode.dark
                          ? 'Status: Sleeping'
                          : 'Status: Awake',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const Text('Choose the Theme:', style: TextStyle(fontSize: 16)),
              
              const SizedBox(height: 10),

              // PART 1 TASK: Controls
              Switch(
                value: _themeMode == ThemeMode.dark,
                onChanged: (bool isDark) {
                  changeTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
          