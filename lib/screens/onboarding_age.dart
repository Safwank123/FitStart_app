import 'package:fit_start_app/screens/onboarding_welcome.dart';
import 'package:flutter/material.dart';

class OnboardingAge extends StatelessWidget {
  const OnboardingAge({super.key});

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
              const Text("What is your age?", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 20),
              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter age in years",
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
  final age = controller.text.trim();
  if (age.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter your age'),
        backgroundColor: Colors.redAccent,
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const OnboardingWelcome(),
      ),
    );
  }
},

                child: const Text("Finish"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
