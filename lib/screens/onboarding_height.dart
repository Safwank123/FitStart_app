
import 'package:fit_start_app/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'onboarding_weight.dart';


class OnboardingHeight extends StatefulWidget {
  const OnboardingHeight({super.key});

  @override
  State<OnboardingHeight> createState() => _OnboardingHeightState();
}

class _OnboardingHeightState extends State<OnboardingHeight>
    with SingleTickerProviderStateMixin {
      
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pushUpAnimation; 
  final TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    
    _floatAnimation = Tween(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    _fadeAnimation = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    
    // Initialize _pushUpAnimation here
    _pushUpAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FitStart Onboarding',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2C2C2C),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF2C2C2C),
      body: Stack(
        children: [
        
          Positioned.fill(
            child: CustomPaint(
              painter: _WavePainter(animation: _controller),
            ),
          ),
          
          
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.3,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                    0,
                   
                    -40 * _pushUpAnimation.value,
                  ),
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child:  Center(
                      child: Image.asset(
  'assets/images/cycling.png',
  width: 80,
  height: 80,
  color: const Color(0xFFBFFF00), 
)

                    ),
                  ),
                );
              },
            ),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Spacer(),
                  
                
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _floatAnimation.value),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: const Text(
                            "What is your height?",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 40),
                  
                  
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -_floatAnimation.value * 0.5),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: TextField(
                            controller: _heightController,
                            keyboardType: TextInputType.number,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Enter height in cm",
                              hintStyle: const TextStyle(color: Colors.white54),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              prefixIcon: const Icon(
                                Icons.height,
                                color: Color(0xFFBFFF00),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const Spacer(),
                  
                  
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -_floatAnimation.value),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFBFFF00),
                              foregroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                       onPressed: () {
  final height = double.tryParse(_heightController.text);
  if (height == null || height <= 0) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Please enter valid height')),
    );
  } else {
    PreferencesService.saveUserData(height, 0, 0);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OnboardingWeight()),
    );
  }
},
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class _WavePainter extends CustomPainter {
  final Animation<double> animation;
  
  _WavePainter({required this.animation}) : super(repaint: animation);
  
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