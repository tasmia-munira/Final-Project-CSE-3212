import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  final takaController = TextEditingController();
  double? usd;

  void convert() {
    double taka = double.tryParse(takaController.text) ?? 0;
    setState(() {
      usd = taka / 110; // Assume 1 USD = 110 Taka
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter', style: TextStyle(color: Colors.white),), backgroundColor: Colors.deepPurpleAccent),
      body: Center( 
        child: Card(
          elevation: 8, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), 
          ),
          color: Colors.white, 
          child: Padding(
            padding: const EdgeInsets.all(20), // Inner padding of the card
            child: SizedBox(
              width: 300, // control card width
              child: Column(
                mainAxisSize: MainAxisSize.min, 
                children: [
                  TextField(
                    controller: takaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Enter amount in Taka',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: convert,
                    child: const Text('Convert to USD'),
                  ),
                  const SizedBox(height: 20),
                  if (usd != null)
                    Text(
                      'USD: \$${usd!.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
