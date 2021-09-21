import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/view/authenticate/splash/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends BaseState<SplashView> {
  SplashViewModel viewModel = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return BaseView<SplashViewModel>(
        onModelReady: (model) {
          viewModel = model;
        },
        viewModel: SplashViewModel(),
        onDispose: () {},
        onPageBuilder: (ctx, value) {
          viewModel.isThereNotSendingData(context);
          return scaffold;
        });
  }

  Widget get scaffold => Scaffold(
        body: Container(
          height: dynamicHeight(1),
          width: dynamicWidth(1),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade500, Colors.blue.shade800]),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Hero(
                  tag: "image_logo",
                  child: Image(
                    image: AssetImage("asset/image/truck2.png"),
                    width: dynamicWidth(0.5),
                    height: dynamicHeight(0.2),
                  ),
                ),
              ),
              Container(
                width: dynamicWidth(1),
                height: dynamicHeight(1),
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(),
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Lottie.asset(
                              "asset/anim/circles_anim.json",
                              frameRate: FrameRate(60),
                            ),
                          ),
                          Column(children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.center,
                                child: Observer(
                                  builder: (ctx) => Text(
                                    viewModel.loadingText,
                                    style: TextStyle(
                                      color: Colors.blue.shade300,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
