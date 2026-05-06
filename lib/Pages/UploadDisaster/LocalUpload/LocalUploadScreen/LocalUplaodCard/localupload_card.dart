import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fyp_project/Core/disaster_style.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/LocalUplaodCard/localupload_btn.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/LocalUplaodCard/localupload_severity.dart';

class GlassDisasterCard extends StatefulWidget {
  final  MediaModel item;

  const GlassDisasterCard({super.key, required this.item});

  @override
  State<GlassDisasterCard> createState() => GlassDisasterCardState();
}

class GlassDisasterCardState extends State<GlassDisasterCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disasterStyle = DisasterStyleHelper.getStyle(widget.item.disasterType!);

    return GestureDetector(
      onTap: () => setState(() => isExpanded = !isExpanded),

      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        margin: const EdgeInsets.only(bottom: 16),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),

          // Glass Effect
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.colorScheme.surface.withOpacity(0.6),
                border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
              ),

              padding: const EdgeInsets.all(16),

              child: Column(
                children: [
                  // Top Row
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: disasterStyle.color.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          disasterStyle.icon,
                          color: disasterStyle.color,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.disasterType!.isEmpty? 
                               '_____' : widget.item.disasterType!,
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(widget.item.location!),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: disasterStyle.color.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              widget.item.severity.toString(),
                              style: TextStyle(color: disasterStyle.color),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Icon(
                            isExpanded ? Icons.expand_less : Icons.expand_more,
                          ),
                        ],
                      ),
                    ],
                  ),

                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: isExpanded
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: const SizedBox(),
                    secondChild: AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      alignment: Alignment.topCenter,
                      child: isExpanded
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),

                                // Time
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 16,
                                      color: theme.iconTheme.color,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(widget.item.timeStamp!),
                                  ],
                                ),

                                const SizedBox(height: 12),

                                /// Severity Progress
                                severityProgress(
                                  (widget.item.severity ?? 0),
                                ),

                                const SizedBox(height: 16),

                                /// Button (PROPER POSITION)
                                UploadButton(model: widget.item),
                              ],
                            )
                          : const SizedBox(),
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
}

Color severityLevelColor(double value) {
  if (value >= 70) return Colors.red;
  if (value >= 40) return Colors.orange;
  return Colors.green;
}

