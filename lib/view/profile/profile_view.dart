import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/components/bottom_sheet_dialog.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:nestle_app/view/profile/profile_view_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends BaseState<ProfileView> {
  ProfileViewModel viewModel = ProfileViewModel();
  final picker = ImagePicker();
  File image = File("");

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return BaseView<ProfileViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: ProfileViewModel(),
      onDispose: () {},
      onPageBuilder: (context, value) {
        viewModel.getNameAndSurname();
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
              child: Lottie.asset("asset/anim/truck_anim.json"),
            ),
          ),
        ),
        child: Scaffold(
          appBar: appBar,
          body: Container(
            height: dynamicHeight(1),
            width: dynamicWidth(1),
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomCenter, colors: [Colors.blue.shade600, Colors.blue.shade800]),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    width: dynamicWidth(1),
                    decoration: BoxDecoration(
                      gradient:
                          LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomCenter, colors: [Colors.blue.shade500, Colors.blue.shade700]),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: dynamicWidth(0.47),
                          width: dynamicWidth(0.47),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(dynamicWidth(0.9)),
                            ),
                            border: Border.all(color: Colors.white, width: 5),
                          ),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: CircleAvatar(
                                  child: ClipOval(
                                    child: image.path == ""
                                        ? Image(
                                            image: AssetImage("asset/image/defaul_profile_photo.jpg"),
                                          )
                                        : Image.file(image),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: dynamicWidth(0.125),
                                  width: dynamicWidth(0.125),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(dynamicWidth(0.9)),
                                    ),
                                    border: Border.all(color: Colors.white, width: 5),
                                  ),
                                  child: IconButton(
                                    icon: Icon(Icons.camera_enhance),
                                    onPressed: () {
                                      openSelectPhotoDialog();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.1), vertical: dynamicHeight(0.05)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          dynamicWidth(0.14),
                        ),
                        topRight: Radius.circular(
                          dynamicWidth(0.14),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Observer(
                              builder: (context) => Container(
                                padding: EdgeInsets.only(bottom: dynamicHeight(0.02), top: dynamicHeight(0.02)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      viewModel.name ?? "",
                                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 26, color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: dynamicWidth(0.01),
                                    ),
                                    Text(
                                      viewModel.surname ?? "",
                                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 26, color: Colors.black87),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        MaterialButton(
                          elevation: 3,
                          height: dynamicHeight(0.06),
                          minWidth: dynamicWidth(1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          onPressed: () async {
                            openSignOutDialog();
                          },
                          disabledColor: Color(0xFFE9C121),
                          child: Text(
                            "Oturumu Kapat",
                            style: TextStyle(
                              fontSize: 21,
                              color: Colors.black,
                            ),
                          ),
                          color: Color(0xFFF7CA18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  AppBar get appBar => AppBar(
        title: Text(AppLocalizations.getString("profile_page")),
        actions: [
          // IconButton(
          //   onPressed: () {
          //     showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return updateNameDialog(dynamicHeight(0.25), dynamicWidth(0.85), context);
          //         });
          //   },
          //   icon: Icon(Icons.edit),
          // )
        ],
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomCenter, colors: [Colors.blue.shade500, Colors.blue.shade600]),
          ),
        ),
      );

  Future<void> openSignOutDialog() async {
    openBottomSheetDialog(
        context: context,
        dialogTitle: "Oturumu Kapat",
        dialogMessage: "Oturumu Kapatmak İstediğine Emin Misin?",
        negativeButtonText: "Hayır",
        negativeButtonOnPress: () {
          RouteHelper().pop(context);
        },
        positiveButtonText: "Evet",
        positiveButtonOnPress: () async {
          await viewModel.signOut(context);
        });
  }

  Future<void> openSelectPhotoDialog() async {
    openBottomSheetDialog(
      context: context,
      dialogTitle: "Seçim Yapın",
      dialogMessage: "Fotoğraf Yükleme Seçimini Yapınız",
      negativeButtonText: "Galeriden Seç",
      negativeButtonIcon: Icons.photo,
      negativeButtonOnPress: () {
        photoSelectButton(ImageSource.gallery);
        RouteHelper().pop(context);
      },
      positiveButtonText: "Kamera Aç",
      positiveButtonIcon: Icons.camera,
      positiveButtonOnPress: () {
        photoSelectButton(ImageSource.camera);
        RouteHelper().pop(context);
      },
    );
  }

  void photoSelectButton(ImageSource source) async {
    try {
      await getImage(source);
    } catch (e) {
      print(e);
    }
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    //Görüntüyü Cache'e atıp o yolu kaydediyor.
    cropImage(pickedFile?.path);
  }

  cropImage(filePath) async {
    File? croppedImage =
        await ImageCropper.cropImage(sourcePath: filePath, maxWidth: 780, maxHeight: 780, aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0));
    if (croppedImage != null) {
      context.loaderOverlay.show();
      await Future.delayed(Duration(milliseconds: 1250), () {
        context.loaderOverlay.hide();
        setState(() {
          image = croppedImage;
        });
      });
    }
  }
}
