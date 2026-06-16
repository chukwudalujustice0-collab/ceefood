import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OrderTrackingScreen extends StatefulWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  int _currentStep = 1;

  @override
  void initState() {
    super.initState();
    // Simulate order progress
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _currentStep = 2);
    });
    Future.delayed(const Duration(seconds: 6), () {
      if (mounted) setState(() => _currentStep = 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${widget.orderId}'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            color: Colors.grey[200],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_outlined, size: 100, color: Colors.grey),
                  Text('Map View Placeholder', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                _buildStatusStep('Order Placed', 'We have received your order', _currentStep >= 1),
                _buildStatusDivider(_currentStep >= 2),
                _buildStatusStep('Preparing Food', 'The chef is cooking your meal', _currentStep >= 2),
                _buildStatusDivider(_currentStep >= 3),
                _buildStatusStep('On the Way', 'The driver is heading to you', _currentStep >= 3),
                _buildStatusDivider(_currentStep >= 4),
                _buildStatusStep('Delivered', 'Enjoy your meal!', _currentStep >= 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusStep(String title, String subtitle, bool isActive) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive ? Colors.deepOrange : Colors.grey[300],
          child: isActive ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: isActive ? Colors.black : Colors.grey)),
            Text(subtitle, style: TextStyle(fontSize: 12, color: isActive ? Colors.grey[600] : Colors.grey[400])),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusDivider(bool isActive) {
    return Container(
      margin: const EdgeInsets.only(left: 11),
      height: 30,
      width: 2,
      color: isActive ? Colors.deepOrange : Colors.grey[300],
    );
  }
}
