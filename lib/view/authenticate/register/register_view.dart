import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:nestle_app/core/base/state/base_state.dart';
import 'package:nestle_app/core/base/view/BaseView.dart';
import 'package:nestle_app/core/components/custom_text_input.dart';
import 'package:nestle_app/core/localization/app_localization.dart';
import 'package:nestle_app/core/routing/route_helper.dart';
import 'package:nestle_app/view/authenticate/register/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends BaseState<RegisterView> with TickerProviderStateMixin {
  RegisterViewModel viewModel = RegisterViewModel();
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1250));
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations.of(context);
    return BaseView<RegisterViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      viewModel: RegisterViewModel(),
      onDispose: () {},
      onPageBuilder: (context, value) => scaffold,
    );
  }

  Widget get scaffold => Scaffold(
        body: Container(
          height: dynamicHeight(1),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: dynamicHeight(1),
                    width: dynamicWidth(1),
                    color: Color.fromRGBO(225, 225, 225, 1),
                  ),
                ),
              ),
              getBackgroundShape(),
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: "image_logo",
                        child: Image(
                          image: AssetImage("asset/image/nestle_logo.png"),
                          width: dynamicWidth(0.31),
                          height: dynamicHeight(0.28),
                        ),
                      ),
                      Hero(
                        tag: "back_container",
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          child: Container(
                            height: dynamicHeight(0.6),
                            width: dynamicWidth(0.8),
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              vertical: dynamicHeight(0.03),
                              horizontal: dynamicWidth(0.05),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    AppLocalizations.getString("register"),
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                Column(
                                  children: [
                                    CustomTextInput(
                                      textInputAction: TextInputAction.next,
                                      borderRadius: dynamicWidth(0.05),
                                      contentPadding: dynamicHeight(0.02),
                                      elevation: 1,
                                      labelText: AppLocalizations.getString("name"),
                                      fontSize: 20,
                                      prefixIcon: Icon(Icons.person_outline),
                                      textColor: Colors.black,
                                      controller: viewModel.nameController,
                                    ),
                                    SizedBox(
                                      height: dynamicHeight(0.015),
                                    ),
                                    CustomTextInput(
                                      textInputAction: TextInputAction.next,
                                      borderRadius: dynamicWidth(0.05),
                                      contentPadding: dynamicHeight(0.02),
                                      elevation: 1,
                                      labelText: AppLocalizations.getString("surname"),
                                      fontSize: 20,
                                      prefixIcon: Icon(Icons.person_outline),
                                      textColor: Colors.black,
                                      controller: viewModel.surnameController,
                                    ),
                                    SizedBox(
                                      height: dynamicHeight(0.015),
                                    ),
                                    CustomTextInput(
                                      textInputAction: TextInputAction.next,
                                      borderRadius: dynamicWidth(0.05),
                                      contentPadding: dynamicHeight(0.02),
                                      elevation: 1,
                                      labelText: "Kullanıcı Adı",
                                      fontSize: 20,
                                      prefixIcon: Icon(Icons.person),
                                      textColor: Colors.black,
                                      controller: viewModel.usernameController,
                                    ),
                                    SizedBox(
                                      height: dynamicHeight(0.015),
                                    ),
                                    Observer(
                                      builder: (context) => CustomTextInput(
                                        textInputAction: TextInputAction.done,
                                        borderRadius: dynamicWidth(0.05),
                                        contentPadding: dynamicHeight(0.02),
                                        elevation: 1,
                                        labelText: AppLocalizations.getString("password"),
                                        fontSize: 20,
                                        prefixIcon: Icon(Icons.lock),
                                        textColor: Colors.black,
                                        obsecureText: viewModel.showPassword,
                                        suffixIcon: getShowPassIcon(),
                                        controller: viewModel.passwordController,
                                        onFieldSubmitted: (value) {
                                          onRegisterButtonClick();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                getRegisterButton()
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: dynamicHeight(0.045),
                      ),
                      Hero(
                        tag: "bottom_info_text",
                        child: Material(
                          color: Colors.transparent,
                          child: Ink(
                            child: Observer(
                              builder: (context) => InkWell(
                                splashColor: Colors.blue.withOpacity(0.25),
                                onTap: viewModel.isLoading
                                    ? null
                                    : () {
                                        RouteHelper().pop(context);
                                      },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    AppLocalizations.getString("click_to_login"),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(0, 0, 0, 0.7),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget getBackgroundShape() {
    return Hero(
      tag: "background_shape",
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(
            dynamicWidth(0.5),
            dynamicHeight(0.075),
          ),
          bottomRight: Radius.elliptical(
            dynamicWidth(0.5),
            dynamicHeight(0.075),
          ),
        ),
        child: Container(
          alignment: Alignment.topCenter,
          height: dynamicHeight(0.7),
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomCenter, colors: [Colors.blue.shade500, Colors.blue.shade800]),
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(
                dynamicWidth(0.5),
                dynamicHeight(0.075),
              ),
              bottomRight: Radius.elliptical(
                dynamicWidth(0.5),
                dynamicHeight(0.075),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getRegisterButton() {
    return Observer(
      builder: (context) => MaterialButton(
        elevation: 3,
        height: dynamicHeight(0.06),
        minWidth: dynamicWidth(1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: viewModel.isLoading ? null : () => onRegisterButtonClick(),
        disabledColor: Color(0xFFE9C121),
        child: viewModel.isLoading
            ? viewModel.loadingOrSuccessAnim
                ? Lottie.asset(
                    "asset/anim/truck_anim.json",
                    height: dynamicHeight(0.06),
                    frameRate: FrameRate(60),
                    fit: BoxFit.fill,
                  )
                : Lottie.asset(
                    "asset/anim/success_anim.json",
                    controller: _animationController,
                    height: dynamicHeight(0.06),
                    frameRate: FrameRate(60),
                    fit: BoxFit.fill,
                  )
            : Text(
                AppLocalizations.getString("register"),
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
        color: Color(0xFFF7CA18),
      ),
    );
  }

  Widget getShowPassIcon() {
    return Observer(
      builder: (context) => IconButton(
        onPressed: () {
          viewModel.setShowPassword();
        },
        icon: Icon(viewModel.showPassword ? Icons.visibility_off : Icons.visibility),
      ),
    );
  }

  void onRegisterButtonClick() async {
    await viewModel.register(context, _animationController!);
  }
}
