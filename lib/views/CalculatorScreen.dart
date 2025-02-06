import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController mrpController = TextEditingController(text: "100");
  TextEditingController gstController = TextEditingController(text: "12");
  TextEditingController retailMarginController = TextEditingController(text: "20");
  TextEditingController stockistMarginController = TextEditingController(text: "10");
  TextEditingController schemeController = TextEditingController(text: "10");

  // Output fields
  double ptr = 0.0;
  double pts = 0.0;
  double netRateRetailer = 0.0;
  double netRateStockist = 0.0;

  void calculateValues() {
    double mrp = double.tryParse(mrpController.text) ?? 0.0;
    double gst = double.tryParse(gstController.text) ?? 0.0;
    double retailMargin = double.tryParse(retailMarginController.text) ?? 0.0;
    double stockistMargin = double.tryParse(stockistMarginController.text) ?? 0.0;
    double scheme = double.tryParse(schemeController.text) ?? 0.0;

    // Step 1: Calculate MRP excluding GST
    double mrpExcludingGST = mrp / (1 + gst / 100);

    // Step 2: Calculate PTR (Price to Retailer)
    ptr = mrpExcludingGST * (1 - retailMargin / 100);

    // Step 3: Calculate PTS (Price to Stockist)
    pts = ptr * (1 - stockistMargin / 100);

    // Step 4: Calculate Net Rate Retailer (On PTR)
    netRateRetailer = ptr * (1 - scheme / 100);

    // Step 5: Calculate Net Rate Stockist (On PTS)
    netRateStockist = pts * (1 - scheme / 100);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    calculateValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PTS & PTR Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInputField("MRP", mrpController),
              buildInputField("GST (%)", gstController),
              buildInputField("Retail Margin (%)", retailMarginController),
              buildInputField("Stockist Margin (%)", stockistMarginController),
              buildInputField("Scheme (%)", schemeController),
              const SizedBox(height: 20),
              Text(
                "Results:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              buildResultField("PTR (Price to Retailer)", ptr),
              buildResultField("PTS (Price to Stockist)", pts),
              buildResultField("Net Rate Retailer (On PTR)", netRateRetailer),
              buildResultField("Net Rate Stockist (On PTS)", netRateStockist),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: (value) => calculateValues(),
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildResultField(String label, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        "$label: ${value.toStringAsFixed(2)}",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
