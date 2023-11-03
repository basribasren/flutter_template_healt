import '../schedule_page/widgets/schedulelist_item_widget.dart';
import 'bloc/schedule_bloc.dart';
import 'models/schedule_model.dart';
import 'models/schedulelist_item_model.dart';
import 'package:basri_s_application16/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key})
      : super(
          key: key,
        );

  @override
  SchedulePageState createState() => SchedulePageState();
  static Widget builder(BuildContext context) {
    return BlocProvider<ScheduleBloc>(
      create: (context) => ScheduleBloc(ScheduleState(
        scheduleModelObj: ScheduleModel(),
      ))
        ..add(ScheduleInitialEvent()),
      child: SchedulePage(),
    );
  }
}

class SchedulePageState extends State<SchedulePage>
    with AutomaticKeepAliveClientMixin<SchedulePage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.white,
          child: Column(
            children: [
              SizedBox(height: 32.v),
              _buildScheduleList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildScheduleList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: BlocSelector<ScheduleBloc, ScheduleState, ScheduleModel?>(
          selector: (state) => state.scheduleModelObj,
          builder: (context, scheduleModelObj) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 16.v,
                );
              },
              itemCount: scheduleModelObj?.schedulelistItemList.length ?? 0,
              itemBuilder: (context, index) {
                SchedulelistItemModel model =
                    scheduleModelObj?.schedulelistItemList[index] ??
                        SchedulelistItemModel();
                return SchedulelistItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
