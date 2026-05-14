import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/LocalUplaodCard/localupload_btn.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/LocalUplaodCard/localupload_severity.dart';

class GlassDisasterCard extends StatefulWidget {
  final MediaModel item;

  const GlassDisasterCard({super.key, required this.item});

  @override
  State<GlassDisasterCard> createState() => _GlassDisasterCardState();
}

class _GlassDisasterCardState extends State<GlassDisasterCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      lowerBound: 0.95,
      upperBound: 1,
    )..forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 360;

    final String type = (widget.item.disasterType ?? "").toLowerCase();

    final Color mainColor = disasterTypeColor(type);
    final IconData icon = disasterTypeIcon(type);

    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),

      child: GestureDetector(
        onTap: () => setState(() => isExpanded = !isExpanded),

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 450),
          margin: EdgeInsets.only(bottom: isSmall ? 14 : 18),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),

            /// ✅ FIX: card now follows theme surface only
            color: theme.colorScheme.surface,

            border: Border.all(color: mainColor.withOpacity(0.25), width: 1.2),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.25 : 0.06),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),

            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),

              child: Padding(
                padding: EdgeInsets.all(isSmall ? 14 : 18),

                child: Column(
                  children: [
                    /// ================= TOP =================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        /// ICON
                        Container(
                          padding: EdgeInsets.all(isSmall ? 12 : 16),

                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainColor.withOpacity(0.12),
                          ),

                          child: Icon(
                            icon,
                            color: mainColor,
                            size: isSmall ? 26 : 30,
                          ),
                        ),

                        SizedBox(width: isSmall ? 10 : 15),

                        /// TITLE
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                formatDisasterType(type),

                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,

                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),

                                decoration: BoxDecoration(
                                  color: mainColor.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                child: Text(
                                  "Disaster Analysis",

                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// SEVERITY
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmall ? 10 : 14,
                                vertical: isSmall ? 6 : 8,
                              ),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),

                                color: severityLevelColor(
                                  widget.item.severity ?? 0,
                                ).withOpacity(0.15),
                              ),

                              child: Text(
                                "${widget.item.severity ?? 0}%",

                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: severityLevelColor(
                                    widget.item.severity ?? 0,
                                  ),
                                  fontSize: isSmall ? 12 : 14,
                                ),
                              ),
                            ),

                            const SizedBox(height: 8),

                            AnimatedRotation(
                              turns: isExpanded ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),

                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: mainColor,
                                size: isSmall ? 24 : 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    /// ================= EXPANDED =================
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 300),

                      crossFadeState: isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,

                      firstChild: const SizedBox(),

                      secondChild: Column(
                        children: [
                          const SizedBox(height: 14),

                          Divider(color: mainColor.withOpacity(0.15)),

                          const SizedBox(height: 12),

                          /// TIME
                          Container(
                            padding: const EdgeInsets.all(12),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),

                              color: mainColor.withOpacity(0.06),
                            ),

                            child: Row(
                              children: [
                                Icon(
                                  Icons.access_time_rounded,
                                  size: 18,
                                  color: mainColor,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Text(
                                    widget.item.timeStamp ?? "",
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          severityProgress(widget.item.severity ?? 0),

                          const SizedBox(height: 20),

                          UploadButton(model: widget.item),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ================= HELPERS =================

Color disasterTypeColor(String type) {
  switch (type) {
    case "no-damage":
      return Colors.green;

    case "minor-damage":
      return Colors.orange;

    case "major-damage":
      return Colors.deepOrange;

    case "destroyed":
      return Colors.red;

    default:
      return Colors.blueGrey;
  }
}

IconData disasterTypeIcon(String type) {
  switch (type) {
    case "no-damage":
      return Icons.verified_rounded;

    case "minor-damage":
      return Icons.warning_amber_rounded;

    case "major-damage":
      return Icons.gpp_bad_rounded;

    case "destroyed":
      return Icons.dangerous_rounded;

    default:
      return Icons.info_rounded;
  }
}

String formatDisasterType(String type) {
  switch (type) {
    case "no-damage":
      return "No Damage";

    case "minor-damage":
      return "Minor Damage";

    case "major-damage":
      return "Major Damage";

    case "destroyed":
      return "Destroyed";

    default:
      return "Unknown";
  }
}

Color severityLevelColor(double value) {
  if (value >= 70) return Colors.redAccent;
  if (value >= 40) return Colors.orangeAccent;
  return Colors.green;
}
