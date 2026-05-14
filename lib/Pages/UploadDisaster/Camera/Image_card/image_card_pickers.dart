import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/UploadDisaster/Camera/Image_card/image_card.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';

class ImageCardPickers extends StatelessWidget {
  const ImageCardPickers({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<CameraBloc, CamerasState>(
      buildWhen: (pre, current) {
        return pre.postDisasterFile != current.postDisasterFile ||
            pre.preDisasterFile != current.preDisasterFile;
      },
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: buildImageCard(
                title: "Pre Disaster",
                image: state.preDisasterFile,
                onTap: () => context.read<CameraBloc>().add(
                  OnPickPreDisasterImageEvent(),
                ),
                icon: Icons.image_outlined,
                isDark: isDark,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: buildImageCard(
                title: "Post Disaster",
                image: state.postDisasterFile,
                onTap: () => context.read<CameraBloc>().add(
                  OnPickPostDisasterImageEvent(),
                ),
                icon: Icons.broken_image_outlined,
                isDark: isDark,
              ),
            ),
          ],
        );
      },
    );
  }
}
