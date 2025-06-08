import 'package:flutter/material.dart';
import 'onboarding_weight.dart';

class OnboardingHeight extends StatelessWidget {
  const OnboardingHeight({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
       appBar: AppBar(
    title: const Text(
      'FitStart Onboarding',
      style: TextStyle(color: Colors.white),
    ),
    backgroundColor: const Color(0xFF2C2C2C),
    elevation: 0,
  ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Spacer(),
              const Text("What is your height?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter height in cm",
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
               onPressed: () {
  final height = controller.text.trim();
  if (height.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter your height'),
        backgroundColor: Colors.redAccent,
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const OnboardingWeight(),
      ),
    );
  }
},

                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
