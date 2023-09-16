import 'package:flutter/material.dart';
import 'timer_page.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0, // Width of the border
                          color: Color(0xFF000000), // Color of the border
                        ),
                      ),
                      labelText: 'Name',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0, // Width of the border
                          color: Color(0xFF000000), // Color of the border
                        ),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0, // Width of the border
                          color: Color(0xFF000000), // Color of the border
                        ),
                      ),
                      labelText: 'Whatsapp Number',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0, // Width of the border
                          color: Color(0xFF000000), // Color of the border
                        ),
                      ),
                      labelText: 'College Name',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A54C5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your registration logic here

                      // Show a success dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Registration Success'),
                            content: Image.asset('images/success.png'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();

                                  // Navigate to the Welcome page
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => TimerPage(),
                                    ),
                                  );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
