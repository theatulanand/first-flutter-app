import 'package:flutter/material.dart';
import 'registration_page.dart'; 

void main() {
  runApp(
    MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Color(0xFFFFF6C4),
          // appBar: AppBar(
          //   title: Text('SHAURYA'),
          // ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'SHAURYA',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFF18403),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Excellence through competition\nCompete to win rewards and recognition',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4D3E29),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF14B03),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the registration page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegistrationPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.transparent, 
                      elevation: 0, 
                    ),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
