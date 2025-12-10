import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'register_okvi_model.dart';
export 'register_okvi_model.dart';

class RegisterOkviWidget extends StatefulWidget {
  const RegisterOkviWidget({super.key});

  static String routeName = 'RegisterOkvi';
  static String routePath = '/okvi-register';

  @override
  State<RegisterOkviWidget> createState() => _RegisterOkviWidgetState();
}

class _RegisterOkviWidgetState extends State<RegisterOkviWidget> {
  late RegisterOkviModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegisterOkviModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().EmailVerifyShowHide = '';
      safeSetState(() {});
    });

    _model.verifyEmailTextFieldTextController ??= TextEditingController();
    _model.verifyEmailTextFieldFocusNode ??= FocusNode();

    _model.oTPVerifyEmailTextFieldTextController ??= TextEditingController();
    _model.oTPVerifyEmailTextFieldFocusNode ??= FocusNode();

    _model.institutionNameTextFieldTextController ??= TextEditingController();
    _model.institutionNameTextFieldFocusNode ??= FocusNode();

    _model.institutionEmailTextFieldTextController ??= TextEditingController(
        text: _model.verifyEmailTextFieldTextController.text);
    _model.institutionEmailTextFieldFocusNode ??= FocusNode();

    _model.institutionAadhaarNoTextFieldTextController ??=
        TextEditingController();
    _model.institutionAadhaarNoTextFieldFocusNode ??= FocusNode();

    _model.pANNoTextFieldTextController ??= TextEditingController();
    _model.pANNoTextFieldFocusNode ??= FocusNode();

    _model.gSTRegistrationNoTextFieldTextController ??= TextEditingController();
    _model.gSTRegistrationNoTextFieldFocusNode ??= FocusNode();

    _model.addressTextFieldTextController ??= TextEditingController();
    _model.addressTextFieldFocusNode ??= FocusNode();

    _model.regdWithADMDICTextFieldTextController ??= TextEditingController();
    _model.regdWithADMDICTextFieldFocusNode ??= FocusNode();

    _model.aDMDICRegdNoTextFieldTextController ??= TextEditingController();
    _model.aDMDICRegdNoTextFieldFocusNode ??= FocusNode();

    _model.oKVIBRegdNoTextFieldTextController ??= TextEditingController();
    _model.oKVIBRegdNoTextFieldFocusNode ??= FocusNode();

    _model.kVICRegdNoTextFieldTextController ??= TextEditingController();
    _model.kVICRegdNoTextFieldFocusNode ??= FocusNode();

    _model.bankACNoTextFieldTextController ??= TextEditingController();
    _model.bankACNoTextFieldFocusNode ??= FocusNode();

    _model.aCHolderNameTextFieldTextController ??= TextEditingController();
    _model.aCHolderNameTextFieldFocusNode ??= FocusNode();

    _model.iFSCCodeTextFieldTextController ??= TextEditingController();
    _model.iFSCCodeTextFieldFocusNode ??= FocusNode();

    _model.nameoftheBankBranchTextFieldTextController ??=
        TextEditingController();
    _model.nameoftheBankBranchTextFieldFocusNode ??= FocusNode();

    _model.secretaryNameTextFieldTextController ??= TextEditingController();
    _model.secretaryNameTextFieldFocusNode ??= FocusNode();

    _model.secretaryNumberTextFieldTextController ??= TextEditingController();
    _model.secretaryNumberTextFieldFocusNode ??= FocusNode();

    _model.secretaryAddressTextFieldTextController ??= TextEditingController();
    _model.secretaryAddressTextFieldFocusNode ??= FocusNode();

    _model.presidentNameTextFieldTextController ??= TextEditingController();
    _model.presidentNameTextFieldFocusNode ??= FocusNode();

    _model.presidentNumberTextFieldTextController ??= TextEditingController();
    _model.presidentNumberTextFieldFocusNode ??= FocusNode();

    _model.presidentAddressTextFieldTextController ??= TextEditingController();
    _model.presidentAddressTextFieldFocusNode ??= FocusNode();

    _model.commiteeNameTextController ??= TextEditingController();
    _model.commiteeNameFocusNode ??= FocusNode();

    _model.commiteeMibileNoTextController ??= TextEditingController();
    _model.commiteeMibileNoFocusNode ??= FocusNode();

    _model.commiteeAdressTextController ??= TextEditingController();
    _model.commiteeAdressFocusNode ??= FocusNode();

    _model.passwordTextFieldTextController ??= TextEditingController();
    _model.passwordTextFieldFocusNode ??= FocusNode();

    _model.rePasswordTextFieldTextController ??= TextEditingController();
    _model.rePasswordTextFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    100.0, 0.0, 100.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 700.0,
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 40.0),
                                        child: PageView(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(initialPage: 0),
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                24.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                24.0),
                                                        topRight:
                                                            Radius.circular(
                                                                24.0),
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/459246018_1051067117024184_8273376380705985780_n.jpg',
                                                        width: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'tm7k50le' /* Shri Mohan Charan Majhi */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displayMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      40.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '72g5wxxt' /* Hon’ble Chief Minister of Odis... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                24.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                24.0),
                                                        topRight:
                                                            Radius.circular(
                                                                24.0),
                                                      ),
                                                      child: Image.network(
                                                        'https://knnindia.co.in/uploads/newsfiles/GROWTH-14-10-2024.jpg',
                                                        width: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'qx5owzoo' /* Micro, Small & Medium Enterpri... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displayMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                24.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                24.0),
                                                        topRight:
                                                            Radius.circular(
                                                                24.0),
                                                      ),
                                                      child: Image.network(
                                                        'https://msmepromotioncouncilindia.com/assets/img/about/How-to-Join-MSME-PCI-as-a.jpg',
                                                        width: double.infinity,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'mi1x2wzl' /* Micro, Small & Medium Enterpri... */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displayMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displayMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 24.0)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 16.0),
                                          child: smooth_page_indicator
                                              .SmoothPageIndicator(
                                            controller: _model
                                                    .pageViewController ??=
                                                PageController(initialPage: 0),
                                            count: 3,
                                            axisDirection: Axis.horizontal,
                                            onDotClicked: (i) async {
                                              await _model.pageViewController!
                                                  .animateToPage(
                                                i,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                curve: Curves.ease,
                                              );
                                              safeSetState(() {});
                                            },
                                            effect: smooth_page_indicator
                                                .ExpandingDotsEffect(
                                              expansionFactor: 8.0,
                                              spacing: 8.0,
                                              radius: 16.0,
                                              dotWidth: 8.0,
                                              dotHeight: 8.0,
                                              dotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              activeDotColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              paintStyle: PaintingStyle.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            tabletLandscape: false,
                                            desktop: false,
                                          ))
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[]
                                                  .divide(SizedBox(width: 4.0)),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 20.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                ))
                                                  Container(
                                                    width: 100.0,
                                                    height: 120.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      0.0),
                                                          child: Image.asset(
                                                            'assets/images/govt-of-odisha-by-rupesh-logo-BC6FE21B9A-seeklogo.com.png',
                                                            width: 100.0,
                                                            height: 100.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'wc0t4gg6' /* MSME */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .interTight(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'bb1wjyn2' /* MSME Web Portal */,
                                                            ),
                                                            maxLines: 2,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'msjeclcn' /* Welcome to OKVI ! Signup to yo... */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 16.0)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 4.0,
                                                          color:
                                                              Color(0x33000000),
                                                          offset: Offset(
                                                            0.0,
                                                            2.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(20.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .stretch,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '4nsgjz02' /* Welcome! Please Verify Your Em... */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Divider(
                                                                              thickness: 2.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (FFAppState()
                                                                          .EmailVerifyShowHide !=
                                                                      '2')
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              300.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              child: Form(
                                                                                key: _model.formKey3,
                                                                                autovalidateMode: AutovalidateMode.disabled,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    if (FFAppState().EmailVerifyShowHide == '')
                                                                                      Flexible(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'vj7r0oe1' /* Email ID* */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Container(
                                                                                                                width: 250.0,
                                                                                                                child: TextFormField(
                                                                                                                  controller: _model.verifyEmailTextFieldTextController,
                                                                                                                  focusNode: _model.verifyEmailTextFieldFocusNode,
                                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                                    '_model.verifyEmailTextFieldTextController',
                                                                                                                    Duration(milliseconds: 500),
                                                                                                                    () => safeSetState(() {}),
                                                                                                                  ),
                                                                                                                  autofocus: false,
                                                                                                                  obscureText: false,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                        ),
                                                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                                                      'litrz79g' /* Enter institution email ID */,
                                                                                                                    ),
                                                                                                                    hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                          ),
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          fontSize: 12.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                        ),
                                                                                                                    enabledBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                    focusedBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: Color(0x00000000),
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                    errorBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                                                      borderSide: BorderSide(
                                                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                    ),
                                                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                        font: GoogleFonts.inter(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                        ),
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                      ),
                                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  validator: _model.verifyEmailTextFieldTextControllerValidator.asValidator(context),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  _model.sendEmailAPi = await OkviGroup.emailVerifysCall.call(
                                                                                                    email: _model.verifyEmailTextFieldTextController.text,
                                                                                                  );

                                                                                                  if ((_model.sendEmailAPi?.succeeded ?? true)) {
                                                                                                    FFAppState().EmailVerifyShowHide = '1';
                                                                                                    safeSetState(() {});
                                                                                                  }

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                text: FFLocalizations.of(context).getText(
                                                                                                  'rzg1hhkv' /* SEND */,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                                                                                  height: 45.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        font: GoogleFonts.interTight(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: Colors.white,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                  elevation: 0.0,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 12.0)),
                                                                                        ),
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 10.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (FFAppState().EmailVerifyShowHide ==
                                                                                '1')
                                                                              Container(
                                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                child: Form(
                                                                                  key: _model.formKey1,
                                                                                  autovalidateMode: AutovalidateMode.disabled,
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    '0t9qqwej' /* OTP* */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Container(
                                                                                                      width: 250.0,
                                                                                                      child: TextFormField(
                                                                                                        controller: _model.oTPVerifyEmailTextFieldTextController,
                                                                                                        focusNode: _model.oTPVerifyEmailTextFieldFocusNode,
                                                                                                        onChanged: (_) => EasyDebounce.debounce(
                                                                                                          '_model.oTPVerifyEmailTextFieldTextController',
                                                                                                          Duration(milliseconds: 500),
                                                                                                          () => safeSetState(() {}),
                                                                                                        ),
                                                                                                        autofocus: false,
                                                                                                        obscureText: false,
                                                                                                        decoration: InputDecoration(
                                                                                                          labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                              ),
                                                                                                          hintText: FFLocalizations.of(context).getText(
                                                                                                            'qbu0jrsx' /* Your OTP */,
                                                                                                          ),
                                                                                                          hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                fontSize: 12.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                              ),
                                                                                                          enabledBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                          focusedBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Color(0x00000000),
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                          errorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                          focusedErrorBorder: OutlineInputBorder(
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 14.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                            ),
                                                                                                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                        validator: _model.oTPVerifyEmailTextFieldTextControllerValidator.asValidator(context),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'r58oohl8' /* Resend OTP */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        color: Color(0xFF090909),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.otpVerifiedAPI = await OkviGroup.otpVerifyCall.call(
                                                                                                email: _model.verifyEmailTextFieldTextController.text,
                                                                                                otp: _model.oTPVerifyEmailTextFieldTextController.text,
                                                                                              );

                                                                                              if ((_model.otpVerifiedAPI?.succeeded ?? true)) {
                                                                                                FFAppState().EmailVerifyShowHide = '2';
                                                                                                safeSetState(() {});
                                                                                              }

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              '2474q7x4' /* Verify OTP */,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: double.infinity,
                                                                                              height: 45.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    font: GoogleFonts.interTight(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                  ),
                                                                                              elevation: 0.0,
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (FFAppState()
                                                                          .EmailVerifyShowHide ==
                                                                      '2')
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                240.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).greenTrans,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).approved,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'v3cedc84' /* ✅ Email Verified */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).approved,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '5lvlgdcx' /* Your email address has been su... */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                          font: GoogleFonts.interTight(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).approved,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          if (FFAppState()
                                                                  .EmailVerifyShowHide !=
                                                              '2')
                                                            Form(
                                                              key: _model
                                                                  .formKey2,
                                                              autovalidateMode:
                                                                  AutovalidateMode
                                                                      .disabled,
                                                              child: Stack(
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '0s1aeq6d' /* Institution Information */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'le1875wv' /* Name* */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 250.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.institutionNameTextFieldTextController,
                                                                                            focusNode: _model.institutionNameTextFieldFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.institutionNameTextFieldTextController',
                                                                                              Duration(milliseconds: 500),
                                                                                              () => safeSetState(() {}),
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'b6141sgd' /* Enter institution Name */,
                                                                                              ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                            keyboardType: TextInputType.name,
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.institutionNameTextFieldTextControllerValidator.asValidator(context),
                                                                                            inputFormatters: [
                                                                                              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 12.0)),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '7z3jwklv' /* Email ID* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Container(
                                                                                                            width: 250.0,
                                                                                                            child: TextFormField(
                                                                                                              controller: _model.institutionEmailTextFieldTextController,
                                                                                                              focusNode: _model.institutionEmailTextFieldFocusNode,
                                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                                '_model.institutionEmailTextFieldTextController',
                                                                                                                Duration(milliseconds: 500),
                                                                                                                () => safeSetState(() {}),
                                                                                                              ),
                                                                                                              autofocus: false,
                                                                                                              readOnly: true,
                                                                                                              obscureText: false,
                                                                                                              decoration: InputDecoration(
                                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                    ),
                                                                                                                hintText: _model.verifyEmailTextFieldTextController.text,
                                                                                                                hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                      ),
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                                    ),
                                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                ),
                                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                ),
                                                                                                                errorBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                ),
                                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                ),
                                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 14.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                  ),
                                                                                                              keyboardType: TextInputType.emailAddress,
                                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                              validator: _model.institutionEmailTextFieldTextControllerValidator.asValidator(context),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 5.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'sg10wujs' /* District* */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: FlutterFlowDropDown<String>(
                                                                                                  controller: _model.institutionDistrictDropDownValueController ??= FormFieldController<String>(null),
                                                                                                  options: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '38r2puhr' /* Angul */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '6gf4n8j3' /* Balangir */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'g7whm4pq' /* Balasore */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'x65mhed0' /* Bargarh */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '86nzx3s8' /* Bhadrak */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'cvd9ee5y' /* Boudh */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'u0onnt1b' /* Cuttack */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '3dnlank1' /* Deogarh */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.institutionDistrictDropDownValue = val),
                                                                                                  width: 200.0,
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'dnnuz6p6' /* Select District */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  borderWidth: 0.0,
                                                                                                  borderRadius: 8.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: false,
                                                                                                  isMultiSelect: false,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'qjqqaqhh' /* Aadhaar No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.institutionAadhaarNoTextFieldTextController,
                                                                                                    focusNode: _model.institutionAadhaarNoTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.institutionAadhaarNoTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'y2cu8hsg' /* Aadhaar No */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    maxLength: 12,
                                                                                                    buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                                    keyboardType: TextInputType.number,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.institutionAadhaarNoTextFieldTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'wxebo4xp' /* GMDIC/RIC Type* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: FlutterFlowDropDown<String>(
                                                                                                  controller: _model.gMDICRICTypeDropDownValueController ??= FormFieldController<String>(null),
                                                                                                  options: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '8z0h0obf' /* GMDIC */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'qjm4uy7n' /* RIC */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.gMDICRICTypeDropDownValue = val),
                                                                                                  width: 200.0,
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'pjux7se2' /* Select GMDIC */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  borderWidth: 0.0,
                                                                                                  borderRadius: 8.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: false,
                                                                                                  isMultiSelect: false,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'gardu4ry' /* PAN No. */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.pANNoTextFieldTextController,
                                                                                                    focusNode: _model.pANNoTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.pANNoTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    textCapitalization: TextCapitalization.characters,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'faxhmo86' /* PaAN No (Ex. AAOPG6543T) */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    maxLength: 10,
                                                                                                    buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.pANNoTextFieldTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      if (!isAndroid && !isiOS)
                                                                                                        TextInputFormatter.withFunction((oldValue, newValue) {
                                                                                                          return TextEditingValue(
                                                                                                            selection: newValue.selection,
                                                                                                            text: newValue.text.toCapitalization(TextCapitalization.characters),
                                                                                                          );
                                                                                                        }),
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'i0aqbnmn' /* GST Registration No. */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.gSTRegistrationNoTextFieldTextController,
                                                                                                    focusNode: _model.gSTRegistrationNoTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.gSTRegistrationNoTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'wi8teo5h' /* GST Registration No  (Ex. 07AA... */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.gSTRegistrationNoTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ala6w3zw' /* Address * */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 250.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.addressTextFieldTextController,
                                                                                            focusNode: _model.addressTextFieldFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.addressTextFieldTextController',
                                                                                              Duration(milliseconds: 500),
                                                                                              () => safeSetState(() {}),
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              alignLabelWithHint: false,
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'uml4obdd' /* Enter institution address */,
                                                                                              ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 3.0,
                                                                                                ),
                                                                                            maxLines: 4,
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.addressTextFieldTextControllerValidator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 12.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'gvtgh4x6' /* Registration Information */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'dzrxd23y' /* Regd. With ADM/DIC* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.regdWithADMDICTextFieldTextController,
                                                                                                    focusNode: _model.regdWithADMDICTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.regdWithADMDICTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'if2z2xsw' /* Enter regd. with ADM/DIC */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.regdWithADMDICTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '9fqprlo9' /* ADM/DIC Regd. No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.aDMDICRegdNoTextFieldTextController,
                                                                                                    focusNode: _model.aDMDICRegdNoTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.aDMDICRegdNoTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        't9s5c35z' /* Enter ADM/DIC regd. no */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.aDMDICRegdNoTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '9kqjhs8k' /* Do you have OKVIB Regd. No? */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: FlutterFlowDropDown<String>(
                                                                                                  controller: _model.doyouhaveOKVIBRegdNoDropDownValueController ??= FormFieldController<String>(null),
                                                                                                  options: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '08ohe8zn' /* yes */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'pwmfb5ql' /* no */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.doyouhaveOKVIBRegdNoDropDownValue = val),
                                                                                                  width: 200.0,
                                                                                                  height: 50.0,
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'vm1a36by' /* Select... */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  borderWidth: 0.0,
                                                                                                  borderRadius: 8.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: false,
                                                                                                  isMultiSelect: false,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '2raxyws1' /* OKVIB Regd. No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.oKVIBRegdNoTextFieldTextController,
                                                                                                    focusNode: _model.oKVIBRegdNoTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.oKVIBRegdNoTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'a1010drc' /* Enter regd. with KVIC */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.oKVIBRegdNoTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '1m8ulmri' /* Regd. With KVIC* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: FlutterFlowDropDown<String>(
                                                                                                  controller: _model.regdWithKVICDropDownValueController ??= FormFieldController<String>(null),
                                                                                                  options: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'bvtw7kum' /* yes */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'mvnq80oi' /* no */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.regdWithKVICDropDownValue = val),
                                                                                                  width: 200.0,
                                                                                                  height: 50.0,
                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    '63aboidr' /* Select... */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  borderWidth: 0.0,
                                                                                                  borderRadius: 8.0,
                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  hidesUnderline: true,
                                                                                                  isOverButton: false,
                                                                                                  isSearchable: false,
                                                                                                  isMultiSelect: false,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '0s1ecxhw' /* KVIC Regd. No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.kVICRegdNoTextFieldTextController,
                                                                                                    focusNode: _model.kVICRegdNoTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.kVICRegdNoTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'pgq3cg9s' /* Enter KVIC regd. no */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.kVICRegdNoTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '087qyv9x' /* Validity Till */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                height: 50.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 5.0, 12.0, 5.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderRadius: 8.0,
                                                                                                        buttonSize: 30.0,
                                                                                                        fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                                        icon: Icon(
                                                                                                          Icons.calendar_month,
                                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                                          size: 12.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          final _datePickedDate = await showDatePicker(
                                                                                                            context: context,
                                                                                                            initialDate: getCurrentTimestamp,
                                                                                                            firstDate: getCurrentTimestamp,
                                                                                                            lastDate: DateTime(2050),
                                                                                                            builder: (context, child) {
                                                                                                              return wrapInMaterialDatePickerTheme(
                                                                                                                context,
                                                                                                                child!,
                                                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                                      font: GoogleFonts.interTight(
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                                      ),
                                                                                                                      fontSize: 32.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                                    ),
                                                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                iconSize: 24.0,
                                                                                                              );
                                                                                                            },
                                                                                                          );

                                                                                                          if (_datePickedDate != null) {
                                                                                                            safeSetState(() {
                                                                                                              _model.datePicked = DateTime(
                                                                                                                _datePickedDate.year,
                                                                                                                _datePickedDate.month,
                                                                                                                _datePickedDate.day,
                                                                                                              );
                                                                                                            });
                                                                                                          } else if (_model.datePicked != null) {
                                                                                                            safeSetState(() {
                                                                                                              _model.datePicked = getCurrentTimestamp;
                                                                                                            });
                                                                                                          }
                                                                                                        },
                                                                                                      ),
                                                                                                      Text(
                                                                                                        dateTimeFormat(
                                                                                                          "dd/MM/yyyy",
                                                                                                          _model.datePicked,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 12.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '69nf3aqq' /* Bank Details */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'zf1wouyw' /* Bank A/C No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.bankACNoTextFieldTextController,
                                                                                                    focusNode: _model.bankACNoTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.bankACNoTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'zo38di5l' /* Enter bank A/C no */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    keyboardType: TextInputType.number,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.bankACNoTextFieldTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'fulw2zch' /* A/C Holder Name* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.aCHolderNameTextFieldTextController,
                                                                                                    focusNode: _model.aCHolderNameTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.aCHolderNameTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'gow5tfjn' /* Enter A/C holder name */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.aCHolderNameTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'hgxau8sl' /* IFSC Code* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.iFSCCodeTextFieldTextController,
                                                                                                    focusNode: _model.iFSCCodeTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.iFSCCodeTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        '178w6fi1' /* Enter IFSC code */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.iFSCCodeTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'z9c6bfpc' /* Name of the Bank/Branch* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.nameoftheBankBranchTextFieldTextController,
                                                                                                    focusNode: _model.nameoftheBankBranchTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.nameoftheBankBranchTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'oft0kuop' /* Enter name of the Bank/Branch */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.nameoftheBankBranchTextFieldTextControllerValidator.asValidator(context),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'bfn9iqyy' /* Secretary Information */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'lpnxs1yv' /* Name * */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.secretaryNameTextFieldTextController,
                                                                                                    focusNode: _model.secretaryNameTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.secretaryNameTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        '4iiyig2n' /* Enter secretary name */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    keyboardType: TextInputType.name,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.secretaryNameTextFieldTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '7jvbjfn9' /* Mobile No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.secretaryNumberTextFieldTextController,
                                                                                                    focusNode: _model.secretaryNumberTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.secretaryNumberTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'ifiqxxwc' /* Enter secretary mobile no */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    maxLength: 10,
                                                                                                    buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                                    keyboardType: TextInputType.phone,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.secretaryNumberTextFieldTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '9cpe3dq2' /* Address * */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 250.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.secretaryAddressTextFieldTextController,
                                                                                            focusNode: _model.secretaryAddressTextFieldFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.secretaryAddressTextFieldTextController',
                                                                                              Duration(milliseconds: 500),
                                                                                              () => safeSetState(() {}),
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              alignLabelWithHint: false,
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'dgz0a71x' /* Enter secretary address */,
                                                                                              ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 3.0,
                                                                                                ),
                                                                                            maxLines: 4,
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.secretaryAddressTextFieldTextControllerValidator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 12.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '0314wpos' /* President Information */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'o6xavr69' /* Name * */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.presidentNameTextFieldTextController,
                                                                                                    focusNode: _model.presidentNameTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.presidentNameTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'lb6fxy47' /* Enter president name */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    keyboardType: TextInputType.name,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.presidentNameTextFieldTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'ui0f54f5' /* Mobile No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.presidentNumberTextFieldTextController,
                                                                                                    focusNode: _model.presidentNumberTextFieldFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.presidentNumberTextFieldTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        '13wx2gxk' /* Enter president mobile no */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    maxLength: 10,
                                                                                                    buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                                    keyboardType: TextInputType.phone,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.presidentNumberTextFieldTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'sun85poi' /* Address * */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 250.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.presidentAddressTextFieldTextController,
                                                                                            focusNode: _model.presidentAddressTextFieldFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.presidentAddressTextFieldTextController',
                                                                                              Duration(milliseconds: 500),
                                                                                              () => safeSetState(() {}),
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              alignLabelWithHint: false,
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'zybqmrcp' /* Enter president address */,
                                                                                              ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 3.0,
                                                                                                ),
                                                                                            maxLines: 4,
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.presidentAddressTextFieldTextControllerValidator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 12.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'p44c1qrf' /* Commitee Member List */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Expanded(
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'yiqoqpsr' /* Name * */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.commiteeNameTextController,
                                                                                                    focusNode: _model.commiteeNameFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.commiteeNameTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'wtu8k7tp' /* Enter commitee member name */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    keyboardType: TextInputType.name,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.commiteeNameTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '300auerg' /* Mobile No* */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Container(
                                                                                                  width: 250.0,
                                                                                                  child: TextFormField(
                                                                                                    controller: _model.commiteeMibileNoTextController,
                                                                                                    focusNode: _model.commiteeMibileNoFocusNode,
                                                                                                    onChanged: (_) => EasyDebounce.debounce(
                                                                                                      '_model.commiteeMibileNoTextController',
                                                                                                      Duration(milliseconds: 500),
                                                                                                      () => safeSetState(() {}),
                                                                                                    ),
                                                                                                    autofocus: false,
                                                                                                    obscureText: false,
                                                                                                    decoration: InputDecoration(
                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                            ),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                      hintText: FFLocalizations.of(context).getText(
                                                                                                        'ft8m8cc9' /* Enter commitee member mobile n... */,
                                                                                                      ),
                                                                                                      hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                          ),
                                                                                                      enabledBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      errorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                                        borderSide: BorderSide(
                                                                                                          color: FlutterFlowTheme.of(context).error,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                        ),
                                                                                                    maxLength: 10,
                                                                                                    buildCounter: (context, {required currentLength, required isFocused, maxLength}) => null,
                                                                                                    keyboardType: TextInputType.phone,
                                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                    validator: _model.commiteeMibileNoTextControllerValidator.asValidator(context),
                                                                                                    inputFormatters: [
                                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'x6qwgn6q' /* Address * */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Container(
                                                                                          width: 250.0,
                                                                                          child: TextFormField(
                                                                                            controller: _model.commiteeAdressTextController,
                                                                                            focusNode: _model.commiteeAdressFocusNode,
                                                                                            onChanged: (_) => EasyDebounce.debounce(
                                                                                              '_model.commiteeAdressTextController',
                                                                                              Duration(milliseconds: 500),
                                                                                              () => safeSetState(() {}),
                                                                                            ),
                                                                                            autofocus: false,
                                                                                            obscureText: false,
                                                                                            decoration: InputDecoration(
                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                  ),
                                                                                              alignLabelWithHint: false,
                                                                                              hintText: FFLocalizations.of(context).getText(
                                                                                                'okth0zry' /* Enter commitee member address */,
                                                                                              ),
                                                                                              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              errorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              focusedErrorBorder: OutlineInputBorder(
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).error,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                              contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  lineHeight: 3.0,
                                                                                                ),
                                                                                            maxLines: 4,
                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                            validator: _model.commiteeAdressTextControllerValidator.asValidator(context),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ].divide(SizedBox(height: 12.0)),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      _model.addToCommite(<String?, dynamic>{
                                                                                        'name': _model.commiteeNameTextController.text,
                                                                                        'mobile': _model.commiteeMibileNoTextController.text,
                                                                                        'address': _model.commiteeAdressTextController.text,
                                                                                      });
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '7urytnab' /* ADD */,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      height: 30.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).secondary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                            font: GoogleFonts.interTight(
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                            color: Colors.white,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                  border: Border.all(
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: double.infinity,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                          bottomRight: Radius.circular(0.0),
                                                                                          topLeft: Radius.circular(8.0),
                                                                                          topRight: Radius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                            ))
                                                                                              Expanded(
                                                                                                flex: 2,
                                                                                                child: Text(
                                                                                                  FFLocalizations.of(context).getText(
                                                                                                    'r57f5ibm' /* Name */,
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'zrkfcrra' /* Mobile No. */,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'r3taefuz' /* Address */,
                                                                                                ),
                                                                                                textAlign: TextAlign.end,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      fontSize: 16.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final commitee = _model.commite
                                                                                            .map((e) => getJsonField(
                                                                                                  e,
                                                                                                  r'''$''',
                                                                                                ))
                                                                                            .toList();
                                                                                        if (commitee.isEmpty) {
                                                                                          return Center(
                                                                                            child: Image.asset(
                                                                                              'assets/images/9276419.png',
                                                                                              height: 400.0,
                                                                                            ),
                                                                                          );
                                                                                        }

                                                                                        return ListView.separated(
                                                                                          padding: EdgeInsets.fromLTRB(
                                                                                            0,
                                                                                            10.0,
                                                                                            0,
                                                                                            0,
                                                                                          ),
                                                                                          primary: false,
                                                                                          shrinkWrap: true,
                                                                                          scrollDirection: Axis.vertical,
                                                                                          itemCount: commitee.length,
                                                                                          separatorBuilder: (_, __) => SizedBox(height: 2.0),
                                                                                          itemBuilder: (context, commiteeIndex) {
                                                                                            final commiteeItem = commitee[commiteeIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                              child: Container(
                                                                                                width: 100.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      blurRadius: 0.0,
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      offset: Offset(
                                                                                                        0.0,
                                                                                                        1.0,
                                                                                                      ),
                                                                                                    )
                                                                                                  ],
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            if (responsiveVisibility(
                                                                                                              context: context,
                                                                                                              phone: false,
                                                                                                              tablet: false,
                                                                                                            ))
                                                                                                              Expanded(
                                                                                                                flex: 2,
                                                                                                                child: Text(
                                                                                                                  getJsonField(
                                                                                                                    commiteeItem,
                                                                                                                    r'''$.name''',
                                                                                                                  ).toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        font: GoogleFonts.inter(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            Expanded(
                                                                                                              flex: 2,
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    if (responsiveVisibility(
                                                                                                                      context: context,
                                                                                                                      phone: false,
                                                                                                                      tablet: false,
                                                                                                                    ))
                                                                                                                      Expanded(
                                                                                                                        flex: 2,
                                                                                                                        child: Text(
                                                                                                                          getJsonField(
                                                                                                                            commiteeItem,
                                                                                                                            r'''$.mobile''',
                                                                                                                          ).toString(),
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                font: GoogleFonts.inter(
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Expanded(
                                                                                                              flex: 1,
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                children: [
                                                                                                                  if (responsiveVisibility(
                                                                                                                    context: context,
                                                                                                                    phone: false,
                                                                                                                    tablet: false,
                                                                                                                  ))
                                                                                                                    Expanded(
                                                                                                                      flex: 2,
                                                                                                                      child: Text(
                                                                                                                        getJsonField(
                                                                                                                          commiteeItem,
                                                                                                                          r'''$.address''',
                                                                                                                        ).toString(),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                              ),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                                                    Divider(
                                                                                                      thickness: 0.5,
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'gktvsizo' /* Password* */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            width: 250.0,
                                                                                            child: TextFormField(
                                                                                              controller: _model.passwordTextFieldTextController,
                                                                                              focusNode: _model.passwordTextFieldFocusNode,
                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                '_model.passwordTextFieldTextController',
                                                                                                Duration(milliseconds: 500),
                                                                                                () => safeSetState(() {}),
                                                                                              ),
                                                                                              autofocus: false,
                                                                                              obscureText: !_model.passwordTextFieldVisibility,
                                                                                              decoration: InputDecoration(
                                                                                                isDense: false,
                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                    ),
                                                                                                alignLabelWithHint: false,
                                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                                  'rcrmca08' /* Password */,
                                                                                                ),
                                                                                                hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                errorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                  borderSide: BorderSide(
                                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                suffixIcon: InkWell(
                                                                                                  onTap: () => safeSetState(
                                                                                                    () => _model.passwordTextFieldVisibility = !_model.passwordTextFieldVisibility,
                                                                                                  ),
                                                                                                  focusNode: FocusNode(skipTraversal: true),
                                                                                                  child: Icon(
                                                                                                    _model.passwordTextFieldVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                                                    color: Color(0xFF757575),
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                  ),
                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                              validator: _model.passwordTextFieldTextControllerValidator.asValidator(context),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 12.0)),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child: Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'cu3qbg9b' /* Confirm Password* */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              width: 250.0,
                                                                                              child: TextFormField(
                                                                                                controller: _model.rePasswordTextFieldTextController,
                                                                                                focusNode: _model.rePasswordTextFieldFocusNode,
                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                  '_model.rePasswordTextFieldTextController',
                                                                                                  Duration(milliseconds: 500),
                                                                                                  () => safeSetState(() {}),
                                                                                                ),
                                                                                                autofocus: false,
                                                                                                obscureText: !_model.rePasswordTextFieldVisibility,
                                                                                                decoration: InputDecoration(
                                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                      ),
                                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                                    'htt2t5ha' /* Password */,
                                                                                                  ),
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                  contentPadding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                                  suffixIcon: InkWell(
                                                                                                    onTap: () => safeSetState(
                                                                                                      () => _model.rePasswordTextFieldVisibility = !_model.rePasswordTextFieldVisibility,
                                                                                                    ),
                                                                                                    focusNode: FocusNode(skipTraversal: true),
                                                                                                    child: Icon(
                                                                                                      _model.rePasswordTextFieldVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                                                                                      color: Color(0xFF757575),
                                                                                                      size: 16.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                validator: _model.rePasswordTextFieldTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 12.0)),
                                                                                  ),
                                                                                ),
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    _model.formRegister = true;
                                                                                    if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                      safeSetState(() => _model.formRegister = false);
                                                                                      return;
                                                                                    }
                                                                                    if (_model.passwordTextFieldTextController.text == _model.rePasswordTextFieldTextController.text) {
                                                                                      _model.registerApi = await OkviGroup.oKVIRegisterCall.call(
                                                                                        institutionInfoName: _model.institutionNameTextFieldTextController.text,
                                                                                        institutionInfoEmail: _model.verifyEmailTextFieldTextController.text,
                                                                                        institutionInfoDist: _model.institutionDistrictDropDownValue,
                                                                                        institutionInfoAdress: _model.institutionDistrictDropDownValue,
                                                                                        institutionInfoGmdicType: _model.gMDICRICTypeDropDownValue,
                                                                                        registrationInfoRegdWithADM: _model.regdWithADMDICTextFieldTextController.text,
                                                                                        registrationInfoAdmRegdNo: _model.aDMDICRegdNoTextFieldTextController.text,
                                                                                        registrationInfoRegdWithOKVIB: _model.doyouhaveOKVIBRegdNoDropDownValue,
                                                                                        registrationInfoHasOkvibRegdNo: _model.doyouhaveOKVIBRegdNoDropDownValue,
                                                                                        registrationInfoOkvibRegdNo: _model.oKVIBRegdNoTextFieldTextController.text,
                                                                                        registrationInfoRegdWithKVIC: _model.regdWithKVICDropDownValue,
                                                                                        registrationInfoKvicRegdNo: _model.kVICRegdNoTextFieldTextController.text,
                                                                                        registrationInfoValidityTill: dateTimeFormat(
                                                                                          "yyyy/MM/dd",
                                                                                          _model.datePicked,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        bankDetailsAccountNo: _model.bankACNoTextFieldTextController.text,
                                                                                        bankDetailsAccountHolderName: _model.aCHolderNameTextFieldTextController.text,
                                                                                        bankDetailsIfscCode: _model.iFSCCodeTextFieldTextController.text,
                                                                                        bankDetailsBankBranch: _model.nameoftheBankBranchTextFieldTextController.text,
                                                                                        secretaryInfoName: _model.secretaryNameTextFieldTextController.text,
                                                                                        secretaryInfoMobile: _model.secretaryNumberTextFieldTextController.text,
                                                                                        secretaryInfoAddress: _model.secretaryAddressTextFieldTextController.text,
                                                                                        presidentInfoName: _model.presidentNameTextFieldTextController.text,
                                                                                        presidentInfoMobile: _model.presidentNumberTextFieldTextController.text,
                                                                                        presidentInfoAddress: _model.presidentAddressTextFieldTextController.text,
                                                                                        committeeMembersJson: _model.commite,
                                                                                        password: _model.passwordTextFieldTextController.text,
                                                                                      );

                                                                                      if ((_model.registerApi?.succeeded ?? true)) {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              '✅ You’ve successfully completed registration.',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );

                                                                                        context.pushNamed(LoginOkviWidget.routeName);
                                                                                      } else {
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              '⚠️ Registration failed. Please check your details and try again.',
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    } else {
                                                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                                                        SnackBar(
                                                                                          content: Text(
                                                                                            'Password and Confirm Password must be the same.',
                                                                                            style: TextStyle(
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                            ),
                                                                                          ),
                                                                                          duration: Duration(milliseconds: 4000),
                                                                                          backgroundColor: FlutterFlowTheme.of(context).rejected,
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  text: FFLocalizations.of(context).getText(
                                                                                    'kqpifr2s' /* Register Now */,
                                                                                  ),
                                                                                  options: FFButtonOptions(
                                                                                    width: 250.0,
                                                                                    height: 50.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(24.0, 13.0, 24.0, 13.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                          font: GoogleFonts.interTight(
                                                                                            fontWeight: FontWeight.w600,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                          ),
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderSide: BorderSide(
                                                                                      width: 1.0,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 10.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  if (FFAppState()
                                                                          .EmailVerifyShowHide !=
                                                                      '2')
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.1),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x1EFFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context.pushNamed(
                                                                      LoginOkviWidget
                                                                          .routeName);
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            8.0),
                                                                    child:
                                                                        RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'u4sbwntn' /* Already have an account?  */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          TextSpan(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              '9dvaaty8' /* Login */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                ),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 24.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height:
                                                                        10.0)),
                                                      ),
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
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.footerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: FooterWidget(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
