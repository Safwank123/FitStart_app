import 'dart:async';

import 'package:fit_start_app/screens/onboarding_height.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    
    _floatAnimation = Tween(begin: -20.0, end: 20.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _fadeAnimation = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => OnboardingHeight ()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2C2C),
      body: Stack(
        children: [
        
          Positioned.fill(
            child: CustomPaint(
              painter: WavePainter(animation: _controller),
            ),
          ),
          
         
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _floatAnimation.value),
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: Icon(
                          Icons.fitness_center,
                          size: 100,
                          color: const Color(0xFFBFFF00),
                        ),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 30),
                
               
                const Text(
                  'FITSPHERE',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                
                const SizedBox(height: 10),
                
               
                const Text(
                  'BOOK • SWEAT • ACHIEVE',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB0B0B0),
                    letterSpacing: 4,
                  ),
                ),
              ],
            ),
          ),
          
          
          const Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '© 2023 FitSphere. All rights reserved',
                style: TextStyle(color: Color(0xFFB0B0B0), fontSize: 12),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;
  
  WavePainter({required this.animation}) : super(repaint: animation);
  
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF3C3C3C), Color(0xFF2C2C2C)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
    
    final path = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(
        size.width * 0.25, 
        size.height * (0.7 - 0.1 * animation.value), 
        size.width * 0.5, 
        size.height * 0.7
      )
      ..quadraticBezierTo(
        size.width * 0.75, 
        size.height * (0.7 + 0.1 * animation.value), 
        size.width, 
        size.height * 0.7
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    
    canvas.drawPath(path, paint);
    
    
    final glowPaint = Paint()
      ..color = const Color(0xFFBFFF00).withOpacity(0.1 * animation.value)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
    
    canvas.drawPath(path, glowPaint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

