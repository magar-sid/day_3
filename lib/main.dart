import 'package:flutter/material.dart';

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
  bool showAllItems = false;

  // List of image URLs
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1511202090067-ebdd4642552b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nzd8fGJpa2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1558978806-73073843b15e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Njl8fGJpa2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1623843937674-9978d079d00b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fGJpa2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1485965120184-e220f721d03e?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D',
    'https://plus.unsplash.com/premium_photo-1678718713393-2b88cde9605b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmlrZXxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1523740856324-f2ce89135981?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fGJpa2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1495570042983-249df576ad3c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fGJpa2V8ZW58MHx8MHx8fDA%3D',
    'https://plus.unsplash.com/premium_photo-1684096758450-61857c170f02?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fGJpa2V8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1531327431456-837da4b1d562?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzJ8fGJpa2V8ZW58MHx8MHx8fDA%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DAY -3',
          style: TextStyle(
            letterSpacing: 2.0,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal ListView Builder
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Horizontal List View(Cycle)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                itemCount: 10, // 10 items in the list
                itemBuilder: (context, index) {
                  return Container(
                    width: 180,
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // Image (local or network)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 6.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  imageUrls[index],  // Use the image URL based on the index
                                    width: 120,
                                    height: 95,
                                    fit: BoxFit.cover,
                                   ),
                                ),
                            ),
                        ),
                        SizedBox(width: 8),
                        // Use Expanded to take up the remaining space
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item ${index + 1}',
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DateTime.now().toString(),
                                style: TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),

            // Vertical ListView
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
                  // Title and Description
                  Text(
                    'Title',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is the description of the vertical list.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  // ListView with Show More
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: showAllItems ? 10 : 5,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrls[index],  // Use the image URL based on the index
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text('Item ${index + 1}'),
                          subtitle: Row(
                            children: [
                              Icon(Icons.description, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text('Description $index', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {},
                            child: Text('Action'),
                          ),
                        ),
                      );
                    },
                  ),
                  if (!showAllItems)
                    Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showAllItems = true;
                          });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.grey.shade300,
                        ),
                        child: Text('Show More'),
                      ),
                    )
                  else
                    Center(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            showAllItems = false;
                          });
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.grey.shade300,
                        ),
                        child: Text('Show Less'),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
