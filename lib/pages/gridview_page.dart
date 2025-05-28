import 'package:flutter/material.dart';
import '../bookdata.dart';
import 'converter_page.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Books Grid', style: TextStyle(color: Colors.white),), backgroundColor: Colors.deepPurpleAccent,),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          final book = bookList[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(book.imagePath, height: 100),
                const SizedBox(height: 8),
                Text(book.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('৳${book.price.toStringAsFixed(2)}'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ConverterPage()),
                  ),
                  child: const Text("Convert"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
