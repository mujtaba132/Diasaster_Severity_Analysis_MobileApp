import 'package:flutter/material.dart';

class AnimatedSeverityIndicator extends StatefulWidget {
  final double severity; // 0 - 100

  const AnimatedSeverityIndicator({
    super.key,
    required this.severity,
  });

  @override
  State<AnimatedSeverityIndicator> createState() =>
      _AnimatedSeverityIndicatorState();
}

class _AnimatedSeverityIndicatorState
    extends State<AnimatedSeverityIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    /// 🔥 Progress Animation
    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.severity / 100,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    /// 🔥 Scale Animation (pop effect)
    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedSeverityIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.severity != widget.severity) {
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: widget.severity / 100,
      ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ));

      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getSeverityColor(double value) {
    if (value >= 70) return Colors.red;
    if (value >= 40) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 55,
                width: 55,
                child: CircularProgressIndicator(
                  value: _progressAnimation.value,
                  strokeWidth: 5,
                  backgroundColor:
                      theme.dividerColor.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation(
                    _getSeverityColor(widget.severity),
                  ),
                ),
              ),

              /// 🔥 Animated Number
              Text(
                (widget.severity * _progressAnimation.value)
                    .toStringAsFixed(1),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


