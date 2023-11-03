import 'bloc/video_call_bloc.dart';
import 'models/video_call_model.dart';
import 'package:basri_s_application16/core/app_export.dart';
import 'package:basri_s_application16/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatelessWidget {
  const VideoCallScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<VideoCallBloc>(
      create: (context) => VideoCallBloc(VideoCallState(
        videoCallModelObj: VideoCallModel(),
      ))
        ..add(VideoCallInitialEvent()),
      child: VideoCallScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<VideoCallBloc, VideoCallState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
              width: mediaQueryData.size.width,
              height: mediaQueryData.size.height,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
                gradient: LinearGradient(
                  begin: Alignment(0.5, 0.5),
                  end: Alignment(0.5, 1),
                  colors: [
                    appTheme.black900.withOpacity(0),
                    appTheme.black900.withOpacity(0.7),
                  ],
                ),
                image: DecorationImage(
                  image: AssetImage(
                    ImageConstant.imgVideoCall,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.h,
                  vertical: 14.v,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgImage,
                      height: 112.v,
                      width: 75.h,
                      radius: BorderRadius.circular(
                        15.h,
                      ),
                      alignment: Alignment.centerRight,
                    ),
                    Spacer(),
                    Text(
                      "msg_dr_marcus_horizon".tr,
                      style: CustomTextStyles.titleMediumWhiteA700,
                    ),
                    SizedBox(height: 8.v),
                    Text(
                      "lbl_00_05_24".tr,
                      style: CustomTextStyles.titleSmallWhiteA700,
                    ),
                    SizedBox(height: 21.v),
                    _buildCallActions(context),
                    SizedBox(height: 50.v),
                    _buildSwipeBackToMenu(context),
                    SizedBox(height: 7.v),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Section Widget
  Widget _buildCallActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButton(
          height: 52.adaptSize,
          width: 52.adaptSize,
          padding: EdgeInsets.all(14.h),
          decoration: IconButtonStyleHelper.fillRed,
          child: CustomImageView(
            imagePath: ImageConstant.imgVideoCameraWhiteA700,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.h),
          child: CustomIconButton(
            height: 52.adaptSize,
            width: 52.adaptSize,
            padding: EdgeInsets.all(14.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgCallWhiteA700,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.h),
          child: CustomIconButton(
            height: 52.adaptSize,
            width: 52.adaptSize,
            padding: EdgeInsets.all(14.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgMicrophone,
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildSwipeBackToMenu(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: 65.h),
        padding: EdgeInsets.symmetric(horizontal: 35.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgArrowUp,
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(left: 58.h),
            ),
            SizedBox(height: 3.v),
            Text(
              "msg_swipe_back_to_menu".tr,
              style: CustomTextStyles.titleSmallWhiteA700,
            ),
          ],
        ),
      ),
    );
  }
}
