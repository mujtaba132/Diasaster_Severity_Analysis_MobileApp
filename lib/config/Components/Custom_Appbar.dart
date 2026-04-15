import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomAppbar({
    super.key,
    required this.title,
  });

  @override
  State<CustomAppbar> createState() =>
      _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      elevation: 0,
      backgroundColor: theme.primaryColor,
      centerTitle: true,
      title: SlideTransition(
        position: _slide,
        child: FadeTransition(
          opacity: _fade,
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: theme.colorScheme.onSurface,
      ),
    );
  }
}