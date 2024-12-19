import 'package:flutter/material.dart';
import 'dart:math'; // Import the Random class

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final random = Random(); // Initialize the Random object

  // current properties of both text and elevated buttons
  Color _textButtonColor = Colors.blueAccent;
  Color _textButtonTextColor = Colors.white;
  double _textButtonFontSize = 16.0;
  FontWeight _textButtonFontWeight = FontWeight.normal;
  String _textButtonText = 'Hi, This is Text Button. Click me to change the property of text button.';

  Color _elevatedButtonColor = Colors.redAccent;
  Color _elevatedButtonTextColor = Colors.white;
  double _elevatedButtonFontSize = 16.0;
  FontWeight _elevatedButtonFontWeight = FontWeight.normal;
  String _elevatedButtonText = 'Hi, This is Elevated Button. Click me to change the property of elevated button.';

  // Counter to track the number of clicks for each button
  int _textButtonClickCount = 0;
  int _elevatedButtonClickCount = 0;

  // State variables for the Floating Action Button properties
  Color _fabColor = Colors.amber;
  IconData _fabIcon = Icons.add;
  double _fabSize = 40.0;

  // Function to generate a random color
  Color getRandomColor() {
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0, // Full opacity
    );
  }

  // Function to generate a random icon
  IconData getRandomIcon() {
    return random.nextBool() ? Icons.add : Icons.remove;
  }

  // Function to generate a random size for the Floating Action Button
  double getRandomSize() {
    return (random.nextInt(20) + 30).toDouble(); // Random size between 30 and 50
  }

  // Function to update the Floating Action Button properties
  void updateFAB() {
    setState(() {
      _fabColor = getRandomColor(); // Change FAB color randomly
      _fabIcon = getRandomIcon(); // Change FAB icon randomly
      _fabSize = getRandomSize(); // Change FAB size randomly
    });
  }


  // List of texts to display on the text button
  final List<String> _textButtonTexts = [
    'Click again to change properties!',
    'Button clicked, properties are updated.',
    'Last click, reset button to initial state.',
  ];

  // New state variables for icon and image URL
  IconData _icon = Icons.change_circle_rounded;
  String _networkImageUrl = 'https://images.unsplash.com/photo-1529040181623-e04ebc611e25?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YW5pbWFsfGVufDB8fDB8fHww'; // Initial image URL
  String _assetImageUrl = 'assets/fox.jpg';

  // Function to generate a random color
  Color getColor() {
    return Color.fromRGBO(
      random.nextInt(256), // Random red value
      random.nextInt(256), // Random green value
      random.nextInt(256), // Random blue value
      1.0, // Full opacity
    );
  }

  // Function to generate a random font size
  double getRandomFontSize() {
    return (random.nextInt(10) + 14).toDouble(); // Random font size between 14 and 24
  }

  // Function to generate a random font weight
  FontWeight getRandomFontWeight() {
    return random.nextBool() ? FontWeight.bold : FontWeight.normal;
  }

  // Function to update TextButton properties
  void updateTextButtonProperties() {
    setState(() {
      _textButtonClickCount++; // Increment click counter

      if (_textButtonClickCount < 4) {
        // Change TextButton properties for the first 3 clicks
        _textButtonColor = getRandomColor(); // Update button background color
        _textButtonTextColor = getRandomColor(); // Update text color
        _textButtonFontSize = getRandomFontSize(); // Update font size
        _textButtonFontWeight = getRandomFontWeight(); // Update font weight
        _textButtonText = _textButtonTexts[_textButtonClickCount - 1]; // Update text based on click count
      } else {
        // Reset TextButton properties on the 4th click
        _textButtonColor = Colors.blueAccent;
        _textButtonTextColor = Colors.white;
        _textButtonFontSize = 16.0;
        _textButtonFontWeight = FontWeight.normal;
        _textButtonText = 'Hi, This is Text Button. Click me to change the property of text button.'; // Reset the text

        // Reset click count to 0 after the 4th click to start a new cycle
        _textButtonClickCount = 0;
      }
    });
  }

  // Function to update ElevatedButton properties
  void updateElevatedButtonProperties() {
    setState(() {
      _elevatedButtonClickCount++; // Increment click counter

      if (_elevatedButtonClickCount < 4) {
        // Change ElevatedButton properties for the first 3 clicks
        _elevatedButtonColor = getRandomColor(); // Update button background color
        _elevatedButtonTextColor = getRandomColor(); // Update text color
        _elevatedButtonFontSize = getRandomFontSize(); // Update font size
        _elevatedButtonFontWeight = getRandomFontWeight(); // Update font weight
        _elevatedButtonText = 'ElevatedButton clicked $_elevatedButtonClickCount times!'; // Update text
      } else {
        // Reset ElevatedButton properties on the 4th click
        _elevatedButtonColor = Colors.redAccent;
        _elevatedButtonTextColor = Colors.white;
        _elevatedButtonFontSize = 16.0;
        _elevatedButtonFontWeight = FontWeight.normal;
        _elevatedButtonText = 'Hi, This is Elevated Button. Click me to change the property of elevated button.'; // Reset the text

        // Reset click count to 0 after the 4th click to start a new cycle
        _elevatedButtonClickCount = 0;
      }
    });
  }

  // New function to update icon and image on icon button click
  void updateIconAndImage() {
    setState(() {
      // Randomly change icon and image URL
      _icon = random.nextBool() ? Icons.change_circle_rounded : Icons.animation; // Random icon
      _networkImageUrl = random.nextBool()
          ? 'https://images.unsplash.com/photo-1470093851219-69951fcbb533?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          : 'https://images.unsplash.com/photo-1516934024742-b461fba47600?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'; // Random image URL
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text(
          'Flutter Intern',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // ElevatedButton
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Container(
              margin: EdgeInsets.all(3.0), // Outer spacing
              child: ElevatedButton(
                onPressed: updateElevatedButtonProperties, // Call function to update ElevatedButton properties
                style: ElevatedButton.styleFrom(
                  backgroundColor: _elevatedButtonColor, // Set the updated button background color
                  foregroundColor: _elevatedButtonTextColor, // Set the updated text color
                  elevation: 0, // Remove button shadow since Container has it
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
                ),
                child: Text(
                  _elevatedButtonText, // Display the updated text
                  style: TextStyle(
                    fontSize: _elevatedButtonFontSize, // Use the updated font size
                    fontWeight: _elevatedButtonFontWeight, // Use the updated font weight
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 2.0),
          // TextButton
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: TextButton(
              onPressed: updateTextButtonProperties, // Call function to update TextButton properties
              style: TextButton.styleFrom(
                foregroundColor: _textButtonTextColor, // Use the current text color
                backgroundColor: _textButtonColor, // Use the current button background color
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                _textButtonText, // Display the current text
                style: TextStyle(
                  fontSize: _textButtonFontSize, // Use the current font size
                  fontWeight: _textButtonFontWeight, // Use the current font weight
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0),
          // IconButton
          IconButton(
            onPressed: updateIconAndImage, // Call function to update icon and image
            icon: Icon(
              _icon, // Display the current icon
              size: 40.0,
            ),
            color: Colors.amber,
          ),
          // Display Network Image and Asset Image in a Row with specific height and width
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                _networkImageUrl, // Display updated network image URL
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10.0), // Space between the images
              Image.asset(
                _assetImageUrl, // Display updated asset image
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateFAB,
        backgroundColor: _fabColor,
        child: Icon(
            _fabIcon,
            size: _fabSize
        ),
      ),
    );
  }
}
