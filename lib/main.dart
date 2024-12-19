import 'package:flutter/material.dart';
import 'dart:math';

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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 Tabs
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    // Do nothing for tab changes in this case
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assessment 4'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              debugPrint('Notifications icon tapped!');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              debugPrint('Settings icon tapped!');
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.task), text: 'Day 2 Tab'),
            Tab(icon: Icon(Icons.task), text: 'Day 3 Tab'),
            Tab(icon: Icon(Icons.task), text: 'Day 4 Tab'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          Day2Task(),
          Day3Task(),
          Day4Task(),
        ],
      ),
    );
  }
}

class Day2Task extends StatefulWidget {
  const Day2Task({super.key});

  @override
  State<Day2Task> createState() => _Day2TaskState();
}

class _Day2TaskState extends State<Day2Task> {
  final random = Random(); // Initialize the Random object

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

  int _textButtonClickCount = 0;
  int _elevatedButtonClickCount = 0;

  Color _fabColor = Colors.amber;
  IconData _fabIcon = Icons.add;
  double _fabSize = 40.0;

  Color getRandomColor() {
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  IconData getRandomIcon() {
    return random.nextBool() ? Icons.add : Icons.remove;
  }

  double getRandomSize() {
    return (random.nextInt(20) + 30).toDouble();
  }

  void updateFAB() {
    setState(() {
      _fabColor = getRandomColor();
      _fabIcon = getRandomIcon();
      _fabSize = getRandomSize();
    });
  }

  final List<String> _textButtonTexts = [
    'Click again to change properties!',
    'Button clicked, properties are updated.',
    'Last click, reset button to initial state.',
  ];

  IconData _icon = Icons.change_circle_rounded;
  String _networkImageUrl = 'https://images.unsplash.com/photo-1529040181623-e04ebc611e25?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YW5pbWFsfGVufDB8fDB8fHww';
  String _assetImageUrl = 'assets/fox.jpg';

  Color getColor() {
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  double getRandomFontSize() {
    return (random.nextInt(10) + 14).toDouble();
  }

  FontWeight getRandomFontWeight() {
    return random.nextBool() ? FontWeight.bold : FontWeight.normal;
  }

  void updateTextButtonProperties() {
    setState(() {
      _textButtonClickCount++;

      if (_textButtonClickCount < 4) {
        _textButtonColor = getRandomColor();
        _textButtonTextColor = getRandomColor();
        _textButtonFontSize = getRandomFontSize();
        _textButtonFontWeight = getRandomFontWeight();
        _textButtonText = _textButtonTexts[_textButtonClickCount - 1];
      } else {
        _textButtonColor = Colors.blueAccent;
        _textButtonTextColor = Colors.white;
        _textButtonFontSize = 16.0;
        _textButtonFontWeight = FontWeight.normal;
        _textButtonText = 'Hi, This is Text Button. Click me to change the property of text button.';
        _textButtonClickCount = 0;
      }
    });
  }

  void updateElevatedButtonProperties() {
    setState(() {
      _elevatedButtonClickCount++;

      if (_elevatedButtonClickCount < 4) {
        _elevatedButtonColor = getRandomColor();
        _elevatedButtonTextColor = getRandomColor();
        _elevatedButtonFontSize = getRandomFontSize();
        _elevatedButtonFontWeight = getRandomFontWeight();
        _elevatedButtonText = 'ElevatedButton clicked $_elevatedButtonClickCount times!';
      } else {
        _elevatedButtonColor = Colors.redAccent;
        _elevatedButtonTextColor = Colors.white;
        _elevatedButtonFontSize = 16.0;
        _elevatedButtonFontWeight = FontWeight.normal;
        _elevatedButtonText = 'Hi, This is Elevated Button. Click me to change the property of elevated button.';
        _elevatedButtonClickCount = 0;
      }
    });
  }

  void updateIconAndImage() {
    setState(() {
      _icon = random.nextBool() ? Icons.change_circle_rounded : Icons.animation;
      _networkImageUrl = random.nextBool()
          ? 'https://images.unsplash.com/photo-1470093851219-69951fcbb533?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
          : 'https://images.unsplash.com/photo-1516934024742-b461fba47600?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          child: Container(
            margin: EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: updateElevatedButtonProperties,
              style: ElevatedButton.styleFrom(
                backgroundColor: _elevatedButtonColor,
                foregroundColor: _elevatedButtonTextColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
              ),
              child: Text(
                _elevatedButtonText,
                style: TextStyle(
                  fontSize: _elevatedButtonFontSize,
                  fontWeight: _elevatedButtonFontWeight,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          child: TextButton(
            onPressed: updateTextButtonProperties,
            style: TextButton.styleFrom(
              foregroundColor: _textButtonTextColor,
              backgroundColor: _textButtonColor,
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15.0),
            ),
            child: Text(
              _textButtonText,
              style: TextStyle(
                fontSize: _textButtonFontSize,
                fontWeight: _textButtonFontWeight,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Container(
          color: Colors.white,
          child: FloatingActionButton(
            onPressed: updateFAB,
            backgroundColor: _fabColor,
            child: Icon(
              _fabIcon,
              size: _fabSize,
            ),
          ),
        ),
      ],
    );
  }
}

class Day3Task extends StatelessWidget {
  const Day3Task({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Vertical ListView (List Of Items)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true, // Ensures the ListView is contained within the column
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5, // Adjust item count as needed
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(
                      'https://images.unsplash.com/photo-1529040181623-e04ebc611e25?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text('Item ${index + 1}'),
                    subtitle: Text(DateTime.now().toString()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
class Day4Task extends StatefulWidget {
  const Day4Task({super.key});

  @override
  State<Day4Task> createState() => _Day4TaskState();
}

class _Day4TaskState extends State<Day4Task> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

  bool showAllItems = false;

  @override
  Widget build(BuildContext context) {
    // Creating a list of 20 items with title, subtitle, and image
    List<Map<String, String>> items = List.generate(
      20,
          (index) => {
        'title': 'Title ${index + 1}',
        'subtitle': 'Subtitle ${index + 1}',
        'image': 'https://images.unsplash.com/photo-1733696372526-5db7ea60c4e6?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyM3x8fGVufDB8fHx8fA%3D%3D',
      },
    );

    // Determine the number of items to show based on the toggle (10 or all items)
    int itemsToShow = showAllItems ? items.length : 10;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Container with drop shadow and border radius
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Container Title',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Subtitle goes here',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                Text(
                  'Date/Time: ${DateTime.now()}',
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),

          // Add vertical spacing of 10
          const SizedBox(height: 10),

          // Divider with thickness and color
          const Divider(
            thickness: 10, // Divider thickness
            color: Colors.redAccent, // Divider color
          ),

          // Add vertical spacing of 10
          const SizedBox(height: 10),

          // Using GridView.count instead of GridView.builder
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1, // Aspect ratio for each item
            children: List.generate(itemsToShow, (index) {
              return Container(
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(items[index]['image']!, height: 60),
                    const SizedBox(height: 8),
                    Text(
                      items[index]['title']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      items[index]['subtitle']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),

          // View More/Less Button
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                showAllItems = !showAllItems; // Toggle the button to show more or less
              });
            },
            child: Text(showAllItems ? 'View Less' : 'View More'),
          ),
        ],
      ),
    );
  }
}

