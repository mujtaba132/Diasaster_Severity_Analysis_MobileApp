import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/blocs/camera/camera_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/config/components/CustomSnackbar.dart';
import 'package:fyp_project/utils/enums.dart';

class PredictSeverityButton extends StatefulWidget {
  const PredictSeverityButton({super.key});

  @override
  State<PredictSeverityButton> createState() => _PredictSeverityButtonState();
}

class _PredictSeverityButtonState extends State<PredictSeverityButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.98,
      upperBound: 1,
    )..forward();

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Colors.blueAccent;

    return BlocListener<CameraBloc, CamerasState>(
      listener: (context, state) {
        if (state.submitRequestStatus == SubmitRequestStatus.error) {
          CustomSnackBar.error(state.error);
        }
      },

      child: BlocBuilder<CameraBloc, CamerasState>(
        builder: (context, state) {
          final isLoading =
              state.submitRequestStatus == SubmitRequestStatus.loading;

          return GestureDetector(
            onTapDown: (_) => _controller.reverse(),
            onTapUp: (_) => _controller.forward(),
            onTapCancel: () => _controller.forward(),

            onTap: isLoading
                ? null
                : () {
                    context.read<CameraBloc>().add(
                      OnStoreDataLocallyEvent(
                        file: state.postDisasterFile!,
                        file2: state.preDisasterFile!,
                      ),
                    );
                  },

            child: ScaleTransition(
              scale: _scaleAnimation,

              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),

                height: 58,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),

                  gradient: LinearGradient(
                    colors: isLoading
                        ? [Colors.grey.shade600, Colors.grey.shade700]
                        : [primaryColor, Colors.indigoAccent],
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: isLoading
                          ? Colors.black12
                          : primaryColor.withOpacity(0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),

                child: Material(
                  color: Colors.transparent,

                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),

                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 250),

                        child: isLoading
                            ? Row(
                                key: const ValueKey("loading"),

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: const [
                                  CustomLoading(color: Colors.white),

                                  SizedBox(width: 12),

                                  Text(
                                    "Processing...",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            : Row(
                                key: const ValueKey("button"),

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: const [
                                  Icon(
                                    Icons.auto_graph_rounded,
                                    color: Colors.white,
                                    size: 22,
                                  ),

                                  SizedBox(width: 10),

                                  Text(
                                    "Predict Severity",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 0.3,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
