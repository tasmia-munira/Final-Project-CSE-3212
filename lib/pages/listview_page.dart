import 'package:flutter/material.dart';
import '../bookdata.dart';
import 'converter_page.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books List', style: TextStyle(color: Colors.white),), backgroundColor: Colors.deepPurpleAccent),
      body: ListView.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          final book = bookList[index];
          return Card(
            margin: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.deepPurple),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Center(child: Image.asset(book.imagePath, height: 100)),
                  const SizedBox(height: 10),
                  Center(child: Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold))),
                  Center(child: Text(book.description)),
                  Center(child: Text('৳${book.price.toStringAsFixed(2)}')),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ConverterPage()),
                    ),
                    child: const Text("Convert Price"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
