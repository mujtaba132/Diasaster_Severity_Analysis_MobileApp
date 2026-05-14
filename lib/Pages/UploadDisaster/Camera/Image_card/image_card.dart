import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildImageCard({
  required String title,
  required File? image,
  required VoidCallback onTap,
  required IconData icon,
  required bool isDark,
}) {
  final Color primaryColor = isDark
      ? const Color(0xff5B8CFF)
      : const Color(0xff2563EB);

  return TweenAnimationBuilder<double>(
    duration: const Duration(milliseconds: 500),
    tween: Tween(begin: 0.96, end: 1),

    curve: Curves.easeOutBack,

    builder: (context, value, child) {
      return Transform.scale(scale: value, child: child);
    },

    child: GestureDetector(
      onTap: onTap,

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,

        height: 270,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),

          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: isDark
                ? [
                    Colors.white.withOpacity(0.08),
                    Colors.white.withOpacity(0.03),
                  ]
                : [Colors.white, const Color(0xffF8FAFC)],
          ),

          border: Border.all(color: primaryColor.withOpacity(0.18), width: 1.2),

          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.12),
              blurRadius: 25,
              spreadRadius: 1,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),

            child: Column(
              children: [
                /// ================= IMAGE SECTION =================
                Expanded(
                  child: Stack(
                    children: [
                      /// IMAGE
                      Positioned.fill(
                        child: image != null
                            ? Hero(
                                tag: image.path,

                                child: Image.file(image, fit: BoxFit.cover),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,

                                    colors: isDark
                                        ? [
                                            const Color(0xff1E293B),

                                            const Color(0xff0F172A),
                                          ]
                                        : [
                                            const Color(0xffEFF6FF),

                                            const Color(0xffDBEAFE),
                                          ],
                                  ),
                                ),

                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      TweenAnimationBuilder<double>(
                                        tween: Tween(begin: 0.9, end: 1),

                                        duration: const Duration(
                                          milliseconds: 800,
                                        ),

                                        curve: Curves.elasticOut,

                                        builder: (context, value, child) {
                                          return Transform.scale(
                                            scale: value,
                                            child: child,
                                          );
                                        },

                                        child: Container(
                                          padding: const EdgeInsets.all(18),

                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,

                                            gradient: LinearGradient(
                                              colors: [
                                                primaryColor.withOpacity(0.25),

                                                primaryColor.withOpacity(0.08),
                                              ],
                                            ),

                                            border: Border.all(
                                              color: primaryColor.withOpacity(
                                                0.25,
                                              ),
                                            ),
                                          ),

                                          child: Icon(
                                            icon,
                                            size: 55,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 18),

                                      const SizedBox(height: 6),

                                      Text(
                                        "Choose image from gallery",

                                        style: TextStyle(
                                          fontSize: 13,

                                          color: isDark
                                              ? Colors.white60
                                              : Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),

                      /// TOP OVERLAY
                      Positioned(
                        top: 14,
                        right: 14,

                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 350),

                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),

                            color: Colors.black.withOpacity(0.35),

                            border: Border.all(
                              color: Colors.white.withOpacity(0.15),
                            ),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.auto_awesome_rounded,
                                color: Colors.white,
                                size: 16,
                              ),

                              const SizedBox(width: 6),

                              Text(
                                image != null ? "Uploaded" : "New",

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// BOTTOM GRADIENT
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,

                        child: Container(
                          height: 80,

                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,

                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.55),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                /// ================= BOTTOM SECTION =================
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 16,
                  ),

                  child: Row(
                    children: [
                      /// ICON
                      Container(
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          gradient: LinearGradient(
                            colors: [
                              primaryColor.withOpacity(0.22),
                              primaryColor.withOpacity(0.08),
                            ],
                          ),
                        ),

                        child: Icon(
                          Icons.photo_library_rounded,
                          color: primaryColor,
                          size: 22,
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// TITLE
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              title,

                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,

                                color: isDark
                                    ? Colors.white
                                    : const Color(0xff0F172A),
                              ),
                            ),

                            const SizedBox(height: 4),

                            Text(
                              image != null
                                  ? "Ready for analysis"
                                  : "No image selected",

                              style: TextStyle(
                                fontSize: 12,

                                color: isDark ? Colors.white60 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
