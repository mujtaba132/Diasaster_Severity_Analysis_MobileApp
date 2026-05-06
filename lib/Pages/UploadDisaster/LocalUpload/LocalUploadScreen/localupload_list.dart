import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/mediaModel/media_model.dart';
import 'package:fyp_project/Pages/UploadDisaster/LocalUpload/LocalUploadScreen/LocalUplaodCard/localupload_card.dart';
import 'package:fyp_project/blocs/local_severity/local_severity_bloc.dart';
import 'package:fyp_project/config/Components/Custom_Exception.dart';
import 'package:fyp_project/config/Components/Custom_Loading.dart';
import 'package:fyp_project/utils/enums.dart';

class DisasterList extends StatefulWidget {
  const DisasterList({super.key});

  @override
  State<DisasterList> createState() => DisasterListState();
}

class DisasterListState extends State<DisasterList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: BlocBuilder<LocalSeverityBloc, LocalSeverityState>(
        buildWhen: (previous, current) => 
        previous.localSeverityStatus!=current.localSeverityStatus || 
        previous.localData.length!=current.localData.length,
        builder: (context, state) {
          if (state.localSeverityStatus == LocalSeverityStatus.loading) {
            return CustomLoading(color: theme.primaryColor);
          } else if (state.error.isNotEmpty || state.localSeverityStatus == LocalSeverityStatus.error) {
            return CustomException(message: state.error);
          } else if(state.localData.isEmpty || state.searchedLocalData.isEmpty){
            return CustomException(message: 'No Data Found!');
          }

          final data = state.searchedLocalData;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];

              return Dismissible(
                key: Key(item.reportId!),

                  background: _swipeBg(
                  color: Colors.red,
                  icon: Icons.delete,
                  text: "Delete",
                  alignLeft: false,
                ),

                onDismissed: (direction) {
                    context.read<LocalSeverityBloc>().
                    add(OnDeleteLocalSeverityEvent(reportId: item.reportId!));
                },

                child: BlocSelector<LocalSeverityBloc, LocalSeverityState, MediaModel?>(
                  selector: (state) {
                    return state.localMap[item.reportId];
                  },
                  builder: (context, model) {
                    if (model == null)
                    {
                      return const SizedBox.shrink();
                    }
                    return GlassDisasterCard(
                      item: model,
                      key: Key(model.reportId!),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _swipeBg({
    required Color color,
    required IconData icon,
    required String text,
    required bool alignLeft,
  }) {
    return Container(
      alignment: alignLeft ? Alignment.centerLeft : Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: alignLeft
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          if (alignLeft) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Colors.white)),
          ] else ...[
            Text(text, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 8),
            Icon(icon, color: Colors.white),
          ],
        ],
      ),
    );
  }
}
