// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import '../../../core/app_export.dart';
import 'schedulelist_item_model.dart';

/// This class defines the variables used in the [schedule_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ScheduleModel extends Equatable {
  ScheduleModel({this.schedulelistItemList = const []}) {}

  List<SchedulelistItemModel> schedulelistItemList;

  ScheduleModel copyWith({List<SchedulelistItemModel>? schedulelistItemList}) {
    return ScheduleModel(
      schedulelistItemList: schedulelistItemList ?? this.schedulelistItemList,
    );
  }

  @override
  List<Object?> get props => [schedulelistItemList];
}
