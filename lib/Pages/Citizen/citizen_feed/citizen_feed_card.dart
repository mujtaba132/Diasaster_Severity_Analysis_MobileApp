import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';

class ReportCard extends StatelessWidget {
  final MediaModel report;
  final VoidCallback onTap;

  const ReportCard({
    super.key,
    required this.report,
    required this.onTap,
  });

  bool isVideo(String url) {
    return url.endsWith(".mp4") || url.endsWith(".mov");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: report.reportId!,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              /// 🔥 MEDIA PREVIEW
              Stack(
  children: [
    /// 📸 Media
    ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      child: Image.network(
        report.mediaUrl!,
        height: 170,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    ),

    /// 🌫️ Blur Effect
    Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0), // keep 0 for performance OR increase to 5
        child: Container(color: Colors.transparent),
      ),
    ),

    /// 🌑 Gradient Overlay
    Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    ),

    /// 🏷️ Floating Title (VERY NICE)
    Positioned(
      bottom: 10,
      left: 12,
      right: 12,
      child: Text(
        report.disasterType!,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    
    Positioned(
      top: 10,
      right: 12,
      child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: _getStatusColor(report.status!)
                        .withOpacity(0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    report.status!,
                    style: TextStyle(
                      color: _getStatusColor(report.status!),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
    ),

    /// ▶️ Video Icon
    if (isVideo(report.mediaUrl!))
      const Positioned.fill(
        child: Center(
          child: Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
        ),
      ),
  ],
),
              /// 📄 CONTENT
             Padding(
  padding: const EdgeInsets.all(12),
  child: Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: theme.cardColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 12,
          offset: const Offset(0, 6),
        )
      ],
    ),
    child: Row(
      children: [

        /// 🔥 Circular Severity Indicator
       AnimatedSeverityIndicator(
  severity: report.severity!,
),

        const SizedBox(width: 24),

        /// 🔥 Info Section
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Disaster Type
              Text(
                report.disasterType!,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              /// Subtitle
              Text(
                report.location!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.hintColor,
                ),
              ),

              const SizedBox(height: 8),

              /// Status Badge
              
            ],
          ),
        ),
      ],
    ),
  ),
)     ],
          ),
        ),
      ),
    );
  }

 Color _getSeverityColor(double value) {
  if (value >= 70) return Colors.red;
  if (value >= 40) return Colors.orange;
  return Colors.green;
}
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "pending":
        return Colors.orange;
      case "resolved":
        return Colors.green;
      case "critical":
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}

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