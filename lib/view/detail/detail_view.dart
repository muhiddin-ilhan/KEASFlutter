import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/components/bottom_sheet_dialog.dart';
import 'package:nestle_app/core/components/order_detail_info_card.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/core/model/DTOTaskTruckUserRelation.dart';
import 'package:nestle_app/core/permissions/permission_helper.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:nestle_app/view/detail/detail_view_model.dart';
import 'package:nestle_app/view/photo_gallery/photo_gallery_view.dart';

class DetailView extends StatefulWidget {
  final DTOTaskTruckUserRelation task;
  const DetailView({Key? key, required this.task}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends BaseState<DetailView> {
  DetailViewModel viewModel = DetailViewModel();
  bool checkBoxValue = false;
  bool isOk = false;

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return BaseView<DetailViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: DetailViewModel(),
      onDispose: () {},
      onPageBuilder: (context, model) {
        viewModel.getDetailInfo(widget.task);
        print(widget.task.DischargeDate!.year);
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
              child: isOk
                  ? Lottie.asset("asset/anim/success_anim.json", frameRate: FrameRate(60))
                  : Lottie.asset("asset/anim/truck_anim.json", frameRate: FrameRate(60)),
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(230, 230, 230, 1),
          appBar: appBar,
          body: Container(
            padding: EdgeInsets.only(
              left: dynamicWidth(0.02),
              right: dynamicWidth(0.02),
              top: dynamicHeight(0.0175),
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            left: dynamicWidth(0.045),
                          ),
                          child: Text(
                            "Fabrika Bilgileri",
                            style: TextStyle(fontSize: 14, color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                          ),
                        ),
                        generalInfoCard,
                        SizedBox(
                          height: dynamicHeight(0.015),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: dynamicWidth(0.045),
                          ),
                          child: Text(
                            "Görev Bilgileri",
                            style: TextStyle(fontSize: 14, color: Colors.blue.shade700, fontWeight: FontWeight.bold),
                          ),
                        ),
                        OrderDetailInfoCard(
                          prefixIcon: Icons.schedule,
                          title: "Görev Tarihi",
                          endText: DateFormat("dd/MM/yyyy kk:mm").format(widget.task.EntryDate!),
                        ),
                        OrderDetailInfoCard(
                          prefixIcon: Icons.campaign,
                          title: "Kimin Adına Getirdiği",
                          endText: widget.task.Task!.ConsumerName!,
                        ),
                        OrderDetailInfoCard(
                          prefixIcon: Icons.local_shipping,
                          title: "Araç Plakası",
                          endText: widget.task.Truck!.Plaque! + " (" + (widget.task.Truck!.IsTipper! == 1 ? "Damperli)" : "Dampersiz)"),
                        ),
                        OrderDetailInfoCard(
                          prefixIcon: Icons.local_shipping,
                          title: "Araç Markası",
                          endText: widget.task.Truck!.Brand! + ", " + widget.task.Truck!.Model!,
                        ),
                        OrderDetailInfoCard(
                          prefixIcon: Icons.person,
                          title: "Kayıt Yapan",
                          endText: widget.task.Task!.RegistrantName,
                        ),
                        GestureDetector(
                          onTap: () async {
                            if(await PermissionHelper.checkCameraPermission(context))
                              if(await PermissionHelper.checkPhotosPermission(context))
                                viewModel.openSelectPhotoDialog(context, widget.task);
                          },
                          child: OrderDetailInfoCard(
                            prefixIcon: Icons.photo,
                            title: "Fotoğraf Yükle",
                            endWidget: Icon(Icons.add_a_photo, size: dynamicHeight(0.02)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            if(await PermissionHelper.checkCameraPermission(context))
                              if(await PermissionHelper.checkPhotosPermission(context))
                                RouteHelper().push(context, PhotoGalleryView(task: widget.task));
                          },
                          child: OrderDetailInfoCard(
                            prefixIcon: Icons.album,
                            title: "Fotoğrafları Gör",
                            endWidget: Icon(Icons.arrow_right, size: dynamicHeight(0.02)),
                          ),
                        ),
                        SizedBox(
                          height: dynamicHeight(0.015),
                        ),
                      ],
                    ),
                  ),
                ),
                widget.task.DischargeDate!.year < 5
                    ? Container(
                        margin: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: dynamicHeight(0.02)),
                        child: deliveryCompleteButton,
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      );

  AppBar get appBar => AppBar(
        title: Text(AppLocalizations.getString("delivery_detail_page_title")),
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

  Widget get generalInfoCard => Observer(
        builder: (context) => Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.all(dynamicWidth(0.04)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 18,
                    ),
                    SizedBox(
                      width: dynamicWidth(0.01),
                    ),
                    Observer(
                      builder: (context) => Text(
                        viewModel.factoryInfo != null ? viewModel.factoryInfo!.Title! : "..",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                ),
                Text(
                  viewModel.factoryInfo != null ? viewModel.factoryInfo!.Address ?? "" : "Yükleniyor..",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ),
      );

  Widget get deliveryCompleteButton => MaterialButton(
        elevation: 3,
        height: dynamicHeight(0.06),
        minWidth: dynamicWidth(1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: onCompleteTaskOpenAlert,
        disabledColor: Colors.blue.shade900,
        child: Text(
          "Görevi Tamamla",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        color: Colors.blue.shade700,
      );

  onCompleteTaskOpenAlert() async {
    openBottomSheetDialog(
      context: context,
      dialogTitle: "Görevi Tamamla",
      dialogMessage: "Görevi Tamamladığınızı Onaylıyor musunuz?",
      negativeButtonText: "Hayır",
      negativeButtonOnPress: () {
        RouteHelper().pop(context);
      },
      positiveButtonText: "Onayla",
      positiveButtonOnPress: () {
        onCompleteTask();
      },
    );
  }

  onCompleteTask() async {
    context.loaderOverlay.show();
    await viewModel.onCompleteTask(context, widget.task.Id!);
    context.loaderOverlay.hide();
  }
}
