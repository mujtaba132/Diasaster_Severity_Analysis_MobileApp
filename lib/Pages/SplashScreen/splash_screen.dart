import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fyp_project/services/Splash/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final SplashScreenService _splashScreenService = SplashScreenService();

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    /// ================= NAVIGATION TIMER =================
    Timer(
      const Duration(seconds: 4),
      () => _splashScreenService.splashScreenNavigator(context),
    );

    /// ================= ANIMATION CONTROLLER =================
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _scaleAnimation = Tween(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _slideAnimation = Tween(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        /// ================= BACKGROUND =================
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: isDark
                ? [
                    const Color(0xff0F172A),
                    const Color(0xff111827),
                    const Color(0xff0B1220),
                  ]
                : [
                    const Color(0xffEEF2FF),
                    const Color(0xffF8FAFC),
                    Colors.white,
                  ],
          ),
        ),

        child: SafeArea(
          child: AnimatedBuilder(
            animation: _controller,

            builder: (context, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  /// ================= ICON =================
                  FadeTransition(
                    opacity: _fadeAnimation,

                    child: ScaleTransition(
                      scale: _scaleAnimation,

                      child: Container(
                        height: size.width * 0.28,
                        width: size.width * 0.28,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          gradient: LinearGradient(
                            colors: [
                              Colors.redAccent.withOpacity(0.8),
                              Colors.orangeAccent.withOpacity(0.6),
                            ],
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.redAccent.withOpacity(0.3),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.warning_amber_rounded,
                          size: 70,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// ================= TITLE =================
                  SlideTransition(
                    position: _slideAnimation,

                    child: FadeTransition(
                      opacity: _fadeAnimation,

                      child: Text(
                        "Disaster AI",
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: size.width * 0.07,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.2,

                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// ================= SUBTITLE =================
                  FadeTransition(
                    opacity: _fadeAnimation,

                    child: Text(
                      "Detect • Analyze • Respond",

                      style: TextStyle(
                        fontSize: size.width * 0.04,
                        fontWeight: FontWeight.w500,

                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// ================= LOADING DOTS =================
                  FadeTransition(
                    opacity: _fadeAnimation,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: List.generate(3, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 400 + (index * 200)),

                          margin: const EdgeInsets.symmetric(horizontal: 4),

                          height: 10,
                          width: 10,

                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
