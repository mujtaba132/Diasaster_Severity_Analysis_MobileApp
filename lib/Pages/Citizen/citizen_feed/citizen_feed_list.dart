import 'package:flutter/material.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/Citizen/citizen_feed/citizen_feed_card.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CitizenListScreen extends StatelessWidget {


  const CitizenListScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final List<MediaModel> reports =  [
            MediaModel(
              disasterType: "Flood",
              location: "Sragodha",
              reportId: "report_123",
              severity: 13.98,
              status: 'pending',
              mediaUrl: "https://res.cloudinary.com/dx6o3ymbb/image/upload/v1775807208/ggmvbsht3yxm2q6snbuj.jpg",
            ),
             MediaModel(
              disasterType: "Flood",
              location: "Sragodha",
              reportId: "report_123",
              severity: 76.98,
              status: 'approved',
              mediaUrl: "https://res.cloudinary.com/dx6o3ymbb/image/upload/v1775807208/ggmvbsht3yxm2q6snbuj.jpg",
            ),
             MediaModel(
              disasterType: "Flood",
              location: "Sragodha",
              reportId: "report_123",
              severity: 34.90,
              status: 'pending',
              mediaUrl: "https://res.cloudinary.com/dx6o3ymbb/image/upload/v1775807208/ggmvbsht3yxm2q6snbuj.jpg",
            ),
             MediaModel(
              disasterType: "Flood",
              location: "Sragodha",
              reportId: "report_123",
              severity: 56.98,
              status: 'pending',
              mediaUrl: "https://res.cloudinary.com/dx6o3ymbb/image/upload/v1775807208/ggmvbsht3yxm2q6snbuj.jpg",
            )
      ];
    return Scaffold(
      appBar: AppBar(title: const Text("Reports")),
      body:AnimationLimiter(
  child: ListView.builder(
    itemCount: reports.length,
    itemBuilder: (context, index) {
      final report = reports[index];

      return AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50,
          child: FadeInAnimation(
            child: ReportCard(
              report: report,
              onTap: () {
               
              },
            ),
          ),
        ),
      );
    },
  ),
)
    );
  }
}