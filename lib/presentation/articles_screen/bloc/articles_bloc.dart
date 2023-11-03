import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/frametwentyfour_item_model.dart';
import '../models/eightynine_item_model.dart';
import '../models/sixtyfour_item_model.dart';
import 'package:basri_s_application16/presentation/articles_screen/models/articles_model.dart';
part 'articles_event.dart';
part 'articles_state.dart';

/// A bloc that manages the state of a Articles according to the event that is dispatched to it.
class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  ArticlesBloc(ArticlesState initialState) : super(initialState) {
    on<ArticlesInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<ArticlesState> emit,
  ) {
    List<FrametwentyfourItemModel> newList =
        List<FrametwentyfourItemModel>.from(
            state.articlesModelObj!.frametwentyfourItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        articlesModelObj: state.articlesModelObj
            ?.copyWith(frametwentyfourItemList: newList)));
  }

  List<FrametwentyfourItemModel> fillFrametwentyfourItemList() {
    return List.generate(3, (index) => FrametwentyfourItemModel());
  }

  List<EightynineItemModel> fillEightynineItemList() {
    return [
      EightynineItemModel(
          covidNineteen: ImageConstant.imgRectangle460,
          covidNineteen1: "Covid-19",
          comparingtheAstraZen:
              "Comparing the AstraZeneca and Sinovac COVID-19 Vaccines",
          jun: "Jun 12, 2021",
          time: "6 min read"),
      EightynineItemModel(
          covidNineteen: ImageConstant.imgRectangle458,
          covidNineteen1: "Covid-19",
          comparingtheAstraZen: "The Horror Of The Second Wave Of COVID-19",
          jun: "Jun 10, 2021",
          time: "5 min read")
    ];
  }

  List<SixtyfourItemModel> fillSixtyfourItemList() {
    return [
      SixtyfourItemModel(
          image: ImageConstant.imgUnsplash86rvjm9zowy,
          theHealthiest:
              "The 25 Healthiest Fruits You Can Eat, According to a Nutritionist",
          jun: "Jun 10, 2021 ",
          time: "5min read",
          image1: ImageConstant.imgBookmark12x10)
    ];
  }

  _onInitialize(
    ArticlesInitialEvent event,
    Emitter<ArticlesState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        articlesModelObj: state.articlesModelObj?.copyWith(
            frametwentyfourItemList: fillFrametwentyfourItemList(),
            eightynineItemList: fillEightynineItemList(),
            sixtyfourItemList: fillSixtyfourItemList())));
  }
}
