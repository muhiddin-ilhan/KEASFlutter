import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/core/model/DTOPhoto.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/view/photo_gallery/photo_gallery_model.dart';

class PhotoGalleryView extends StatefulWidget {
  final DTOTaskTruckUserRelation task;
  const PhotoGalleryView({Key? key, required this.task}) : super(key: key);

  @override
  _PhotoGalleryViewState createState() => _PhotoGalleryViewState();
}

class _PhotoGalleryViewState extends BaseState<PhotoGalleryView> {
  PhotoGalleryModel viewModel = PhotoGalleryModel();
  bool checkBoxValue = false;
  bool isOk = false;

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return BaseView<PhotoGalleryModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: PhotoGalleryModel(),
      onDispose: () {},
      onPageBuilder: (context, model) {
        viewModel.getPhotos(widget.task);
        return scaffold;
      },
    );
  }

  Widget get scaffold => LoaderOverlay(
        useDefaultLoading: false,
        overlayWidget: Container(
          height: dynamicHeight(1),
          width: dynamicWidth(1),
          color: Color(0x35ffffff),
          child: Center(
            child: SizedBox(
              height: dynamicWidth(0.3),
              width: dynamicWidth(0.3),
              child: Lottie.asset("asset/anim/truck_anim.json", frameRate: FrameRate(60)),
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(230, 230, 230, 1),
          appBar: appBar,
          body: Observer(
            builder: (context) {
              return !viewModel.isLoading
                  ? Container(
                      padding: EdgeInsets.symmetric(vertical: dynamicHeight(0.01), horizontal: dynamicWidth(0.015)),
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: viewModel.photos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50,
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                      onTap: () {
                                        onDownloadPhoto(viewModel.photos[index]);
                                      },
                                      child: Card(
                                        elevation: 2,
                                        borderOnForeground: true,
                                        shape: Border.all(color: Colors.white, width: 2),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.04), vertical: dynamicHeight(0.0175)),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: Image.network(
                                                  viewModel.photos[index].Path!,
                                                  fit: BoxFit.cover,
                                                ),
                                                height: dynamicHeight(0.03),
                                                width: dynamicHeight(0.03),
                                              ),
                                              SizedBox(
                                                width: dynamicWidth(0.02),
                                              ),
                                              Text(
                                                "Fotoğraf - " + index.toString(),
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Spacer(),
                                              Icon(Icons.download)
                                            ],
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : listLoadingAnim();
            },
          ),
        ),
      );

  AppBar get appBar => AppBar(
        title: Text("Galeri"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade600, Colors.blue.shade800],
            ),
          ),
        ),
      );

  Widget listLoadingAnim() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Lottie.asset(
            "asset/anim/card_loading_anim.json",
            frameRate: FrameRate(60),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(
            "asset/anim/truck_anim.json",
            frameRate: FrameRate(60),
          ),
        ),
      ],
    );
  }

  onDownloadPhoto(DTOPhoto photo) async {
    context.loaderOverlay.show();
    await viewModel.downloadPhoto(photo, context);
    context.loaderOverlay.hide();
  }
}
