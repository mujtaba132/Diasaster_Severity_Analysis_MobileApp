import 'package:flutter/material.dart';

class AnimatedProfileHeader extends StatefulWidget {
  final String imageUrl;

  const AnimatedProfileHeader({
    super.key,
    required this.imageUrl,
  });

  @override
  State<AnimatedProfileHeader> createState() =>
      _AnimatedProfileHeaderState();
}

class _AnimatedProfileHeaderState extends State<AnimatedProfileHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slide = Tween<Offset>(
      begin: const Offset(-0.3, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

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

    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          decoration: BoxDecoration(
            color: theme.cardColor.withOpacity(0.9),
            borderRadius: BorderRadius.circular(35),
            border: Border.all(
              color: theme.dividerColor.withOpacity(0.2),
            ),
           
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [

              // Profile Image
              CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage(widget.imageUrl)
              ),

             
            ],
          ),
        ),
      ),
    );
  }
}