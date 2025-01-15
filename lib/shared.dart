import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesList extends StatefulWidget {
  const SharedPreferencesList({super.key});

  @override
  _SharedPreferencesListState createState() => _SharedPreferencesListState();
}

class _SharedPreferencesListState extends State<SharedPreferencesList> {
  List<String> _items = [];
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSharedPreferences();
  }

  Future<void> _loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _items = prefs.getStringList('sharedPrefsItems') ?? [];
    });
  }

  Future<void> _addItem(String item) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _items.add(item);
      prefs.setStringList('sharedPrefsItems', _items);
    });
    _textController.clear();
  }

  Future<void> _removeItem(int index) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _items.removeAt(index);
      prefs.setStringList('sharedPrefsItems', _items);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences List'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter item',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _addItem(_textController.text);
                    }
                  },
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _removeItem(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
