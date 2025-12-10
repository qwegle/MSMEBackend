import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/loader/loader_widget.dart';
import '/components/mainwebnav_osfc_branch/mainwebnav_osfc_branch_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'application_list_branch_model.dart';
export 'application_list_branch_model.dart';

class ApplicationListBranchWidget extends StatefulWidget {
  const ApplicationListBranchWidget({super.key});

  static String routeName = 'ApplicationListBranch';
  static String routePath = '/osfc-branch-application';

  @override
  State<ApplicationListBranchWidget> createState() =>
      _ApplicationListBranchWidgetState();
}

class _ApplicationListBranchWidgetState
    extends State<ApplicationListBranchWidget> with TickerProviderStateMixin {
  late ApplicationListBranchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ApplicationListBranchModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.loansearchTextController1 ??= TextEditingController();
    _model.loansearchFocusNode1 ??= FocusNode();

    _model.loansearchTextController2 ??= TextEditingController();
    _model.loansearchFocusNode2 ??= FocusNode();

    _model.loansearchTextController3 ??= TextEditingController();
    _model.loansearchFocusNode3 ??= FocusNode();

    _model.loansearchTextController4 ??= TextEditingController();
    _model.loansearchFocusNode4 ??= FocusNode();

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
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                wrapWithModel(
                  model: _model.mainwebnavOsfcBranchModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MainwebnavOsfcBranchWidget(
                    clr: FlutterFlowTheme.of(context).secondaryText,
                    clr2: FlutterFlowTheme.of(context).secondary,
                    backclr2: Color(0xFFDDFFFE),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 0.5,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      offset: Offset(
                                        2.0,
                                        2.0,
                                      ),
                                      spreadRadius: 2.0,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Container(
                                      width: 2.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'qxmhejy1' /* Applications */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 26.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                              Expanded(
                                                flex: 87,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 1.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (responsiveVisibility(
                                                          context: context,
                                                          phone: false,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
                                                          desktop: false,
                                                        ))
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'rhdgdd70' /* Overview */,
                                                            ),
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                wrapWithModel(
                                                  model: _model.languageModel,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: LanguageWidget(),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderRadius: 50.0,
                                                    buttonSize: 40.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    icon: Icon(
                                                      Icons.person_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            FFAppState()
                                                                .userReff,
                                                            r'''$.user.username''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyLarge
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          getJsonField(
                                                            FFAppState()
                                                                .userReff,
                                                            r'''$.user.email''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
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
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment(0.0, 0),
                              child: TabBar(
                                labelColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                unselectedLabelStyle: FlutterFlowTheme.of(
                                        context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                indicatorColor:
                                    FlutterFlowTheme.of(context).primary,
                                tabs: [
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'rxckc9a1' /* All */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'xuawflro' /* Pending */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      'xx68sljx' /* Approved */,
                                    ),
                                  ),
                                  Tab(
                                    text: FFLocalizations.of(context).getText(
                                      '0bqgxcai' /* Rejected */,
                                    ),
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [
                                    () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: LoaderWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      _model.apiResulOtsAll =
                                          await MsmeOsfcGroup.filterOTSFormsCall
                                              .call(
                                        branch: FFAppState().branch,
                                        authToken: currentAuthenticationToken,
                                      );

                                      FFAppState().OTSForm = getJsonField(
                                        (_model.apiResulOtsAll?.jsonBody ?? ''),
                                        r'''$''',
                                      );
                                      safeSetState(() {});
                                      Navigator.pop(context);

                                      safeSetState(() {});
                                    },
                                    () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: LoaderWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      _model.apiResulOtsPending =
                                          await MsmeOsfcGroup.filterOTSFormsCall
                                              .call(
                                        branch: FFAppState().branch,
                                        status: '0',
                                        authToken: currentAuthenticationToken,
                                      );

                                      FFAppState().OTSForm = getJsonField(
                                        (_model.apiResulOtsPending?.jsonBody ??
                                            ''),
                                        r'''$''',
                                      );
                                      safeSetState(() {});
                                      Navigator.pop(context);

                                      safeSetState(() {});
                                    },
                                    () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: LoaderWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      _model.apiResulOtsApproved =
                                          await MsmeOsfcGroup.filterOTSFormsCall
                                              .call(
                                        branch: FFAppState().branch,
                                        status: '1',
                                        authToken: currentAuthenticationToken,
                                      );

                                      FFAppState().OTSForm = getJsonField(
                                        (_model.apiResulOtsApproved?.jsonBody ??
                                            ''),
                                        r'''$''',
                                      );
                                      safeSetState(() {});
                                      Navigator.pop(context);

                                      safeSetState(() {});
                                    },
                                    () async {
                                      showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: LoaderWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      _model.apiResulOtsReject =
                                          await MsmeOsfcGroup.filterOTSFormsCall
                                              .call(
                                        branch: FFAppState().branch,
                                        status: '2',
                                        authToken: currentAuthenticationToken,
                                      );

                                      FFAppState().OTSForm = getJsonField(
                                        (_model.apiResulOtsReject?.jsonBody ??
                                            ''),
                                        r'''$''',
                                      );
                                      safeSetState(() {});
                                      Navigator.pop(context);

                                      safeSetState(() {});
                                    }
                                  ][i]();
                                },
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  SingleChildScrollView(
                                    primary: false,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          phone: false,
                                          tablet: false,
                                          tabletLandscape: false,
                                        ))
                                          Expanded(
                                            flex: 12,
                                            child: Container(
                                              width: double.infinity,
                                              constraints: BoxConstraints(
                                                maxWidth: 1270.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
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
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'ynmvtjtb' /* OTS Form Applications */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 22.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Expanded(
                                                                    child: Form(
                                                                      key: _model
                                                                          .formKey3,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Flexible(
                                                                              child: Container(
                                                                                width: 230.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.loansearchTextController1,
                                                                                    focusNode: _model.loansearchFocusNode1,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
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
                                                                                        'o2o28lhu' /* Search your loan number... */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                    keyboardType: TextInputType.number,
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.loansearchTextController1Validator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.formvalis1 = true;
                                                                                if (_model.formKey3.currentState == null || !_model.formKey3.currentState!.validate()) {
                                                                                  safeSetState(() => _model.formvalis1 = false);
                                                                                  return;
                                                                                }
                                                                                _model.apiResulloanSearchAll = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                  otsId: _model.loansearchTextController1.text,
                                                                                );

                                                                                if ((_model.apiResulloanSearchAll?.succeeded ?? true)) {
                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.apiResulloanSearchAll?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '6wn86c5e' /* Search */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.apiResulALLOTS = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                );

                                                                                FFAppState().OTSForm = getJsonField(
                                                                                  (_model.apiResulALLOTS?.jsonBody ?? ''),
                                                                                  r'''$''',
                                                                                );
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'u4ao7ak2' /* Clear */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 40.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if (responsiveVisibility(
                                                                        context:
                                                                            context,
                                                                        phone:
                                                                            false,
                                                                        tablet:
                                                                            false,
                                                                      ))
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'xvff9zk8' /* Loan Number */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      Expanded(
                                                                        flex: 4,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'hrw3t1w4' /* User Name */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (responsiveVisibility(
                                                                        context:
                                                                            context,
                                                                        phone:
                                                                            false,
                                                                      ))
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'zmlfva7m' /* Apply Date */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'qv155vz1' /* Status */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 1,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '41ykf7cd' /* Actions */,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final applicationList =
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .OTSForm,
                                                                    r'''$.paginatedData''',
                                                                  ).toList();
                                                                  if (applicationList
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/9276419.png',
                                                                        height:
                                                                            400.0,
                                                                      ),
                                                                    );
                                                                  }

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        applicationList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            applicationListIndex) {
                                                                      final applicationListItem =
                                                                          applicationList[
                                                                              applicationListIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            1.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                                tablet: false,
                                                                                              ))
                                                                                                Flexible(
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      getJsonField(
                                                                                                        applicationListItem,
                                                                                                        r'''$.ots.loan_number''',
                                                                                                      )?.toString(),
                                                                                                      '0',
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
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  await Clipboard.setData(ClipboardData(
                                                                                                      text: getJsonField(
                                                                                                    applicationListItem,
                                                                                                    r'''$.ots.loan_number''',
                                                                                                  ).toString()));
                                                                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                                                                    SnackBar(
                                                                                                      content: Text(
                                                                                                        'Copied',
                                                                                                        style: TextStyle(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        ),
                                                                                                      ),
                                                                                                      duration: Duration(milliseconds: 4000),
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                                child: Icon(
                                                                                                  Icons.content_copy,
                                                                                                  color: FlutterFlowTheme.of(context).isseued,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 4,
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
                                                                                                      (String var1, String var2) {
                                                                                                        return var1 + " " + var2;
                                                                                                      }(
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.first_name''',
                                                                                                          ).toString(),
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.last_name''',
                                                                                                          ).toString()),
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
                                                                                        if (responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                        ))
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                getJsonField(
                                                                                                  applicationListItem,
                                                                                                  r'''$.ots.createdAt''',
                                                                                                )?.toString(),
                                                                                                '0',
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
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Container(
                                                                                                height: 32.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: () {
                                                                                                    if ('0' ==
                                                                                                        getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.status''',
                                                                                                        ).toString()) {
                                                                                                      return FlutterFlowTheme.of(context).yellowTrans;
                                                                                                    } else if ('1' ==
                                                                                                        getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.status''',
                                                                                                        ).toString()) {
                                                                                                      return FlutterFlowTheme.of(context).greenTrans;
                                                                                                    } else if ('2' ==
                                                                                                        getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.status''',
                                                                                                        ).toString()) {
                                                                                                      return FlutterFlowTheme.of(context).redTrans;
                                                                                                    } else {
                                                                                                      return Color(0xFFD6D7D8);
                                                                                                    }
                                                                                                  }(),
                                                                                                  borderRadius: BorderRadius.circular(40.0),
                                                                                                  border: Border.all(
                                                                                                    color: () {
                                                                                                      if ('0' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).pending;
                                                                                                      } else if ('1' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).approved;
                                                                                                      } else if ('2' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).rejected;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).secondaryText;
                                                                                                      }
                                                                                                    }(),
                                                                                                  ),
                                                                                                ),
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                  child: Text(
                                                                                                    () {
                                                                                                      if ('0' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return 'Pending';
                                                                                                      } else if ('1' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return 'Approved';
                                                                                                      } else {
                                                                                                        return 'Rejected';
                                                                                                      }
                                                                                                    }(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: () {
                                                                                                            if ('0' ==
                                                                                                                getJsonField(
                                                                                                                  applicationListItem,
                                                                                                                  r'''$.ots.status''',
                                                                                                                ).toString()) {
                                                                                                              return FlutterFlowTheme.of(context).pending;
                                                                                                            } else if ('1' ==
                                                                                                                getJsonField(
                                                                                                                  applicationListItem,
                                                                                                                  r'''$.ots.status''',
                                                                                                                ).toString()) {
                                                                                                              return FlutterFlowTheme.of(context).approved;
                                                                                                            } else if ('2' ==
                                                                                                                getJsonField(
                                                                                                                  applicationListItem,
                                                                                                                  r'''$.ots.status''',
                                                                                                                ).toString()) {
                                                                                                              return FlutterFlowTheme.of(context).rejected;
                                                                                                            } else {
                                                                                                              return FlutterFlowTheme.of(context).secondaryText;
                                                                                                            }
                                                                                                          }(),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: Color(0xFFDBEDFB),
                                                                                                icon: Icon(
                                                                                                  Icons.remove_red_eye_outlined,
                                                                                                  color: FlutterFlowTheme.of(context).isseued,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  _model.userReffDetailsView1 = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                    authToken: currentAuthenticationToken,
                                                                                                    branch: FFAppState().branch,
                                                                                                    otsId: getJsonField(
                                                                                                      applicationListItem,
                                                                                                      r'''$.ots.loan_number''',
                                                                                                    ).toString(),
                                                                                                  );

                                                                                                  FFAppState().singleuserreff = getJsonField(
                                                                                                    (_model.userReffDetailsView1?.jsonBody ?? ''),
                                                                                                    r'''$''',
                                                                                                  );
                                                                                                  safeSetState(() {});

                                                                                                  context.pushNamed(
                                                                                                    OtsFormViewUsersWidget.routeName,
                                                                                                    extra: <String, dynamic>{
                                                                                                      kTransitionInfoKey: TransitionInfo(
                                                                                                        hasTransition: true,
                                                                                                        transitionType: PageTransitionType.fade,
                                                                                                        duration: Duration(milliseconds: 1000),
                                                                                                      ),
                                                                                                    },
                                                                                                  );

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Divider(
                                                                                  thickness: 2.0,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children:
                                                                              [
                                                                            RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'ingh8xqt' /* Rows per pages: */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xBA57636C),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Container(
                                                                              child: FlutterFlowDropDown<String>(
                                                                                controller: _model.limitDropDownValueController1 ??= FormFieldController<String>(
                                                                                  _model.limitDropDownValue1 ??= getJsonField(
                                                                                    FFAppState().OTSForm,
                                                                                    r'''$.limit''',
                                                                                  ).toString(),
                                                                                ),
                                                                                options: [
                                                                                  FFLocalizations.of(context).getText(
                                                                                    '383mro3x' /* 5 */,
                                                                                  ),
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'l8i04zkn' /* 10 */,
                                                                                  ),
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'by4v3jfj' /* 25 */,
                                                                                  ),
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'dvqdq74e' /* 50 */,
                                                                                  ),
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'udw7sz1a' /* 100 */,
                                                                                  )
                                                                                ],
                                                                                onChanged: (val) async {
                                                                                  safeSetState(() => _model.limitDropDownValue1 = val);
                                                                                  _model.apiLimitChange = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                    branch: FFAppState().branch,
                                                                                    authToken: currentAuthenticationToken,
                                                                                    limit: valueOrDefault<String>(
                                                                                      _model.limitDropDownValue1,
                                                                                      '10',
                                                                                    ),
                                                                                  );

                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.apiLimitChange?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                width: 73.0,
                                                                                height: 30.0,
                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xBA57636C),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'wsn7s8mb' /* 10 */,
                                                                                ),
                                                                                icon: Icon(
                                                                                  Icons.arrow_drop_down,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 24.0,
                                                                                ),
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                elevation: 2.0,
                                                                                borderColor: Colors.transparent,
                                                                                borderWidth: 0.0,
                                                                                borderRadius: 8.0,
                                                                                margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                hidesUnderline: true,
                                                                                isOverButton: false,
                                                                                isSearchable: false,
                                                                                isMultiSelect: false,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            RichText(
                                                                              textScaler: MediaQuery.of(context).textScaler,
                                                                              text: TextSpan(
                                                                                children: [
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.page''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      '6a9wpbvc' /* - */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.currentPageCount''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: FFLocalizations.of(context).getText(
                                                                                      'cr7gabbu' /*  of  */,
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  ),
                                                                                  TextSpan(
                                                                                    text: valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.totalItems''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
                                                                                    style: TextStyle(),
                                                                                  )
                                                                                ],
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xBA57636C),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 20.0)),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.apiFirst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                    branch: FFAppState().branch,
                                                                                    authToken: currentAuthenticationToken,
                                                                                    page: '1',
                                                                                    limit: valueOrDefault<String>(
                                                                                      _model.limitDropDownValue1,
                                                                                      '10',
                                                                                    ),
                                                                                  );

                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.apiFirst?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.first_page,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.previousPage''',
                                                                                      ) !=
                                                                                      null) {
                                                                                    _model.apiprevious = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      page: getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.previousPage''',
                                                                                      ).toString(),
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue1,
                                                                                        '10',
                                                                                      ),
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.apiprevious?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.keyboard_arrow_left,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                if (getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.nextPage''',
                                                                                    ) !=
                                                                                    null) {
                                                                                  _model.apiNext = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                    branch: FFAppState().branch,
                                                                                    authToken: currentAuthenticationToken,
                                                                                    page: getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.nextPage''',
                                                                                    ).toString(),
                                                                                    limit: valueOrDefault<String>(
                                                                                      _model.limitDropDownValue1,
                                                                                      '10',
                                                                                    ),
                                                                                  );

                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.apiNext?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.keyboard_arrow_right,
                                                                                color: Color(0xBA57636C),
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.apiLAst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  authToken: currentAuthenticationToken,
                                                                                  branch: FFAppState().branch,
                                                                                  page: getJsonField(
                                                                                    FFAppState().OTSForm,
                                                                                    r'''$.totalPages''',
                                                                                  ).toString(),
                                                                                  limit: valueOrDefault<String>(
                                                                                    _model.limitDropDownValue1,
                                                                                    '10',
                                                                                  ),
                                                                                );

                                                                                FFAppState().OTSForm = getJsonField(
                                                                                  (_model.apiLAst?.jsonBody ?? ''),
                                                                                  r'''$''',
                                                                                );
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.last_page_outlined,
                                                                                color: Color(0xBA57636C),
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 20.0)),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 30.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Expanded(
                                              flex: 12,
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxWidth: 1270.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'rnnl8u49' /* OTS Pending Applications */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Form(
                                                                        key: _model
                                                                            .formKey2,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.disabled,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Flexible(
                                                                              child: Container(
                                                                                width: 230.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 230.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.loansearchTextController2,
                                                                                    focusNode: _model.loansearchFocusNode2,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
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
                                                                                        'like2gk2' /* Search Loan Number */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                    keyboardType: TextInputType.number,
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.loansearchTextController2Validator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.form2 = true;
                                                                                if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                  safeSetState(() => _model.form2 = false);
                                                                                  return;
                                                                                }
                                                                                _model.papiResulloanSearch = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                  otsId: _model.loansearchTextController2.text,
                                                                                  status: '0',
                                                                                );

                                                                                if ((_model.papiResulloanSearch?.succeeded ?? true)) {
                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.papiResulloanSearch?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                't57rsv3v' /* Search */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.papiResulALLOTS = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                  status: '0',
                                                                                );

                                                                                FFAppState().OTSForm = getJsonField(
                                                                                  (_model.papiResulALLOTS?.jsonBody ?? ''),
                                                                                  r'''$''',
                                                                                );
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'vq3usvtj' /* Clear */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'uiye3r3g' /* Loan Number */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              4,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'gsc39bvg' /* User Name */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'x7j6m109' /* Apply Date */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '9oh9ngbu' /* Status */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'lc3pc60z' /* Actions */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final applicationList =
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .OTSForm,
                                                                      r'''$.paginatedData''',
                                                                    ).toList();
                                                                    if (applicationList
                                                                        .isEmpty) {
                                                                      return Center(
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/9276419.png',
                                                                          height:
                                                                              400.0,
                                                                        ),
                                                                      );
                                                                    }

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          applicationList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              applicationListIndex) {
                                                                        final applicationListItem =
                                                                            applicationList[applicationListIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (responsiveVisibility(
                                                                                                  context: context,
                                                                                                  phone: false,
                                                                                                  tablet: false,
                                                                                                ))
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.loan_number''',
                                                                                                        )?.toString(),
                                                                                                        '0',
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await Clipboard.setData(ClipboardData(
                                                                                                        text: getJsonField(
                                                                                                      applicationListItem,
                                                                                                      r'''$.ots.loan_number''',
                                                                                                    ).toString()));
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'Copied',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.content_copy,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 4,
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
                                                                                                        (String var1, String var2) {
                                                                                                          return var1 + " " + var2;
                                                                                                        }(
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.first_name''',
                                                                                                            ).toString(),
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.last_name''',
                                                                                                            ).toString()),
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
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    applicationListItem,
                                                                                                    r'''$.ots.createdAt''',
                                                                                                  )?.toString(),
                                                                                                  '0',
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
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  height: 32.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: () {
                                                                                                      if ('0' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).yellowTrans;
                                                                                                      } else if ('1' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).greenTrans;
                                                                                                      } else if ('2' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).redTrans;
                                                                                                      } else {
                                                                                                        return Color(0xFFE0E0E1);
                                                                                                      }
                                                                                                    }(),
                                                                                                    borderRadius: BorderRadius.circular(40.0),
                                                                                                    border: Border.all(
                                                                                                      color: () {
                                                                                                        if ('0' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).pending;
                                                                                                        } else if ('1' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).approved;
                                                                                                        } else if ('2' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).rejected;
                                                                                                        } else {
                                                                                                          return FlutterFlowTheme.of(context).secondaryText;
                                                                                                        }
                                                                                                      }(),
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      () {
                                                                                                        if ('0' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return 'Pending';
                                                                                                        } else if ('1' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return 'Approved';
                                                                                                        } else {
                                                                                                          return 'Rejected';
                                                                                                        }
                                                                                                      }(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: () {
                                                                                                              if ('0' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).pending;
                                                                                                              } else if ('1' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).approved;
                                                                                                              } else if ('2' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).rejected;
                                                                                                              } else {
                                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                                              }
                                                                                                            }(),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
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
                                                                                                  tabletLandscape: false,
                                                                                                  desktop: false,
                                                                                                ))
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 44.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.remove_red_eye_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      _model.puserReffDetailsView = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                        authToken: currentAuthenticationToken,
                                                                                                        branch: FFAppState().branch,
                                                                                                        otsId: getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.loan_number''',
                                                                                                        ).toString(),
                                                                                                      );

                                                                                                      FFAppState().singleuserreff = getJsonField(
                                                                                                        (_model.puserReffDetailsView?.jsonBody ?? ''),
                                                                                                        r'''$''',
                                                                                                      );
                                                                                                      safeSetState(() {});

                                                                                                      context.pushNamed(
                                                                                                        OtsFormViewUsersWidget.routeName,
                                                                                                        extra: <String, dynamic>{
                                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                                            hasTransition: true,
                                                                                                            transitionType: PageTransitionType.fade,
                                                                                                            duration: Duration(milliseconds: 1000),
                                                                                                          ),
                                                                                                        },
                                                                                                      );

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                  ),
                                                                                                FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 40.0,
                                                                                                  fillColor: Color(0xFFDBEDFB),
                                                                                                  icon: Icon(
                                                                                                    Icons.remove_red_eye_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    _model.puserReffDetailsView2 = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                      authToken: currentAuthenticationToken,
                                                                                                      branch: FFAppState().branch,
                                                                                                      otsId: getJsonField(
                                                                                                        applicationListItem,
                                                                                                        r'''$.ots.loan_number''',
                                                                                                      ).toString(),
                                                                                                    );

                                                                                                    FFAppState().singleuserreff = (_model.puserReffDetailsView2?.jsonBody ?? '');
                                                                                                    safeSetState(() {});

                                                                                                    context.pushNamed(
                                                                                                      OtsFormViewUsersWidget.routeName,
                                                                                                      extra: <String, dynamic>{
                                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                                          hasTransition: true,
                                                                                                          transitionType: PageTransitionType.fade,
                                                                                                          duration: Duration(milliseconds: 1000),
                                                                                                        ),
                                                                                                      },
                                                                                                    );

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Divider(
                                                                                    thickness: 2.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'ezbt3knc' /* Rows per pages: */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  controller: _model.limitDropDownValueController2 ??= FormFieldController<String>(
                                                                                    _model.limitDropDownValue2 ??= getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.limit''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                  options: [
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '7vxioior' /* 5 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'w20e83eh' /* 10 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'ug3ozx3a' /* 25 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '8he68a4h' /* 50 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'oadlqt7y' /* 100 */,
                                                                                    )
                                                                                  ],
                                                                                  onChanged: (val) async {
                                                                                    safeSetState(() => _model.limitDropDownValue2 = val);
                                                                                    _model.papiLimitChange = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue2,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '0',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.papiLimitChange?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  width: 73.0,
                                                                                  height: 30.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'y82f50de' /* 10 */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.arrow_drop_down,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Colors.transparent,
                                                                                  borderWidth: 0.0,
                                                                                  borderRadius: 8.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  hidesUnderline: true,
                                                                                  isOverButton: false,
                                                                                  isSearchable: false,
                                                                                  isMultiSelect: false,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.page''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '79jkz1kx' /* - */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.currentPageCount''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'y69chczg' /*  of  */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.totalItems''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.papiFirst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      page: '1',
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue2,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '0',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.papiFirst?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.first_page,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.previousPage''',
                                                                                        ) !=
                                                                                        null) {
                                                                                      _model.papiprevious = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                        branch: FFAppState().branch,
                                                                                        authToken: currentAuthenticationToken,
                                                                                        page: getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.previousPage''',
                                                                                        ).toString(),
                                                                                        limit: valueOrDefault<String>(
                                                                                          _model.limitDropDownValue2,
                                                                                          '10',
                                                                                        ),
                                                                                        status: '0',
                                                                                      );

                                                                                      FFAppState().OTSForm = getJsonField(
                                                                                        (_model.papiprevious?.jsonBody ?? ''),
                                                                                        r'''$''',
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                    }

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.keyboard_arrow_left,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 20.0)),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.nextPage''',
                                                                                      ) !=
                                                                                      null) {
                                                                                    _model.papiNext = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      page: getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.nextPage''',
                                                                                      ).toString(),
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue2,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '0',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.papiNext?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.keyboard_arrow_right,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.papiLAst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                    authToken: currentAuthenticationToken,
                                                                                    branch: FFAppState().branch,
                                                                                    page: getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.totalPages''',
                                                                                    ).toString(),
                                                                                    limit: valueOrDefault<String>(
                                                                                      _model.limitDropDownValue2,
                                                                                      '10',
                                                                                    ),
                                                                                    status: '0',
                                                                                  );

                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.papiLAst?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.last_page_outlined,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                        ].divide(SizedBox(width: 30.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Expanded(
                                              flex: 12,
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxWidth: 1270.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '0xoxjagb' /* OTS Approved Applications */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Form(
                                                                        key: _model
                                                                            .formKey4,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.disabled,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Flexible(
                                                                              child: Container(
                                                                                width: 230.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.loansearchTextController3,
                                                                                    focusNode: _model.loansearchFocusNode3,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
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
                                                                                        '7av5m231' /* Search Loan Number */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                    keyboardType: TextInputType.number,
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.loansearchTextController3Validator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.formvalidation3 = true;
                                                                                if (_model.formKey4.currentState == null || !_model.formKey4.currentState!.validate()) {
                                                                                  safeSetState(() => _model.formvalidation3 = false);
                                                                                  return;
                                                                                }
                                                                                _model.aapiResulloanSearchApproved = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                  otsId: _model.loansearchTextController3.text,
                                                                                  status: '1',
                                                                                );

                                                                                if ((_model.aapiResulloanSearchApproved?.succeeded ?? true)) {
                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.aapiResulloanSearchApproved?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '9g8uzxsb' /* Search */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.aapiResulALLOTS = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                  status: '1',
                                                                                );

                                                                                FFAppState().OTSForm = getJsonField(
                                                                                  (_model.aapiResulALLOTS?.jsonBody ?? ''),
                                                                                  r'''$''',
                                                                                );
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                '47r2mfoe' /* Clear */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'ml0twf6k' /* Loan Number */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              4,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'vjw44wye' /* User Name */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'q84rguwm' /* Apply Date */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'caw48e8n' /* Status */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'sue3p8tn' /* Actions */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final applicationList =
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .OTSForm,
                                                                      r'''$.paginatedData''',
                                                                    ).toList();
                                                                    if (applicationList
                                                                        .isEmpty) {
                                                                      return Center(
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/9276419.png',
                                                                          height:
                                                                              400.0,
                                                                        ),
                                                                      );
                                                                    }

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          applicationList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              applicationListIndex) {
                                                                        final applicationListItem =
                                                                            applicationList[applicationListIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (responsiveVisibility(
                                                                                                  context: context,
                                                                                                  phone: false,
                                                                                                  tablet: false,
                                                                                                ))
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.loan_number''',
                                                                                                        )?.toString(),
                                                                                                        '0',
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await Clipboard.setData(ClipboardData(
                                                                                                        text: getJsonField(
                                                                                                      applicationListItem,
                                                                                                      r'''$.ots.loan_number''',
                                                                                                    ).toString()));
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'Copied',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.content_copy,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 4,
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
                                                                                                        (String var1, String var2) {
                                                                                                          return var1 + " " + var2;
                                                                                                        }(
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.first_name''',
                                                                                                            ).toString(),
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.last_name''',
                                                                                                            ).toString()),
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
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    applicationListItem,
                                                                                                    r'''$.ots.createdAt''',
                                                                                                  )?.toString(),
                                                                                                  '0',
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
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  height: 32.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: () {
                                                                                                      if ('0' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).yellowTrans;
                                                                                                      } else if ('1' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).greenTrans;
                                                                                                      } else if ('2' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).redTrans;
                                                                                                      } else {
                                                                                                        return Color(0xFFDDDDDE);
                                                                                                      }
                                                                                                    }(),
                                                                                                    borderRadius: BorderRadius.circular(40.0),
                                                                                                    border: Border.all(
                                                                                                      color: () {
                                                                                                        if ('0' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).pending;
                                                                                                        } else if ('1' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).approved;
                                                                                                        } else if ('2' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).rejected;
                                                                                                        } else {
                                                                                                          return FlutterFlowTheme.of(context).secondaryText;
                                                                                                        }
                                                                                                      }(),
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      () {
                                                                                                        if ('0' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return 'Pending';
                                                                                                        } else if ('1' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return 'Approved';
                                                                                                        } else {
                                                                                                          return 'Rejected';
                                                                                                        }
                                                                                                      }(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: () {
                                                                                                              if ('0' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).pending;
                                                                                                              } else if ('1' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).approved;
                                                                                                              } else if ('2' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).rejected;
                                                                                                              } else {
                                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                                              }
                                                                                                            }(),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
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
                                                                                                  tabletLandscape: false,
                                                                                                  desktop: false,
                                                                                                ))
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 44.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.remove_red_eye_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      _model.auserReffDetailsView = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                        authToken: currentAuthenticationToken,
                                                                                                        branch: FFAppState().branch,
                                                                                                        otsId: getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.loan_number''',
                                                                                                        ).toString(),
                                                                                                      );

                                                                                                      FFAppState().singleuserreff = getJsonField(
                                                                                                        (_model.auserReffDetailsView?.jsonBody ?? ''),
                                                                                                        r'''$''',
                                                                                                      );
                                                                                                      safeSetState(() {});

                                                                                                      context.pushNamed(
                                                                                                        OtsFormViewUsersWidget.routeName,
                                                                                                        extra: <String, dynamic>{
                                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                                            hasTransition: true,
                                                                                                            transitionType: PageTransitionType.fade,
                                                                                                            duration: Duration(milliseconds: 1000),
                                                                                                          ),
                                                                                                        },
                                                                                                      );

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                  ),
                                                                                                FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 40.0,
                                                                                                  fillColor: Color(0xFFDBEDFB),
                                                                                                  icon: Icon(
                                                                                                    Icons.remove_red_eye_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    _model.auserReffDetailsView3 = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                      authToken: currentAuthenticationToken,
                                                                                                      branch: FFAppState().branch,
                                                                                                      otsId: getJsonField(
                                                                                                        applicationListItem,
                                                                                                        r'''$.ots.loan_number''',
                                                                                                      ).toString(),
                                                                                                    );

                                                                                                    FFAppState().singleuserreff = getJsonField(
                                                                                                      (_model.auserReffDetailsView3?.jsonBody ?? ''),
                                                                                                      r'''$''',
                                                                                                    );
                                                                                                    safeSetState(() {});

                                                                                                    context.pushNamed(
                                                                                                      OtsFormViewUsersWidget.routeName,
                                                                                                      extra: <String, dynamic>{
                                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                                          hasTransition: true,
                                                                                                          transitionType: PageTransitionType.fade,
                                                                                                          duration: Duration(milliseconds: 1000),
                                                                                                        ),
                                                                                                      },
                                                                                                    );

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Divider(
                                                                                    thickness: 2.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'nyxigj8t' /* Rows per pages: */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  controller: _model.limitDropDownValueController3 ??= FormFieldController<String>(
                                                                                    _model.limitDropDownValue3 ??= getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.limit''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                  options: [
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'z9s8s9wc' /* 5 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '3npjzoow' /* 10 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'proiom9w' /* 25 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '46prscv9' /* 50 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '4tofyh4i' /* 100 */,
                                                                                    )
                                                                                  ],
                                                                                  onChanged: (val) async {
                                                                                    safeSetState(() => _model.limitDropDownValue3 = val);
                                                                                    _model.aapiLimitChange = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue3,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '1',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.aapiLimitChange?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  width: 73.0,
                                                                                  height: 30.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    '7389xneb' /* 10 */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.arrow_drop_down,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Colors.transparent,
                                                                                  borderWidth: 0.0,
                                                                                  borderRadius: 8.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  hidesUnderline: true,
                                                                                  isOverButton: false,
                                                                                  isSearchable: false,
                                                                                  isMultiSelect: false,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.page''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '14wnnck8' /* - */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.currentPageCount''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'mgua8coc' /*  of  */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.totalItems''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.aapiFirst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      page: '1',
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue3,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '1',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.aapiFirst?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.first_page,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.previousPage''',
                                                                                        ) !=
                                                                                        null) {
                                                                                      _model.aapiprevious = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                        branch: FFAppState().branch,
                                                                                        authToken: currentAuthenticationToken,
                                                                                        page: getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.previousPage''',
                                                                                        ).toString(),
                                                                                        limit: valueOrDefault<String>(
                                                                                          _model.limitDropDownValue3,
                                                                                          '10',
                                                                                        ),
                                                                                        status: '1',
                                                                                      );

                                                                                      FFAppState().OTSForm = getJsonField(
                                                                                        (_model.aapiprevious?.jsonBody ?? ''),
                                                                                        r'''$''',
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                    }

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.keyboard_arrow_left,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 20.0)),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.nextPage''',
                                                                                      ) !=
                                                                                      null) {
                                                                                    _model.aapiNext = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      page: getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.nextPage''',
                                                                                      ).toString(),
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue3,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '1',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.aapiNext?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.keyboard_arrow_right,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.aapiLAst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                    authToken: currentAuthenticationToken,
                                                                                    branch: FFAppState().branch,
                                                                                    page: getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.totalPages''',
                                                                                    ).toString(),
                                                                                    limit: valueOrDefault<String>(
                                                                                      _model.limitDropDownValue3,
                                                                                      '10',
                                                                                    ),
                                                                                    status: '1',
                                                                                  );

                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.aapiLAst?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.last_page_outlined,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                        ].divide(SizedBox(width: 30.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                            tabletLandscape: false,
                                          ))
                                            Expanded(
                                              flex: 12,
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxWidth: 1270.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(16.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'g3zcdho7' /* OTS Form Applications */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 22.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Form(
                                                                        key: _model
                                                                            .formKey1,
                                                                        autovalidateMode:
                                                                            AutovalidateMode.disabled,
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Flexible(
                                                                              child: Container(
                                                                                width: 230.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.loansearchTextController4,
                                                                                    focusNode: _model.loansearchFocusNode4,
                                                                                    autofocus: false,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
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
                                                                                        '2jp8oupm' /* Search Loan Number */,
                                                                                      ),
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                                                                                    keyboardType: TextInputType.number,
                                                                                    cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    validator: _model.loansearchTextController4Validator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.formval4 = true;
                                                                                if (_model.formKey1.currentState == null || !_model.formKey1.currentState!.validate()) {
                                                                                  safeSetState(() => _model.formval4 = false);
                                                                                  return;
                                                                                }
                                                                                _model.apiResulloanSearchReject = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                  otsId: _model.loansearchTextController4.text,
                                                                                  status: '2',
                                                                                );

                                                                                if ((_model.apiResulloanSearchReject?.succeeded ?? true)) {
                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.apiResulloanSearchReject?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'xbcph7fj' /* Search */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                            FFButtonWidget(
                                                                              onPressed: () async {
                                                                                _model.apiResulALLOTSR = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                  branch: FFAppState().branch,
                                                                                  authToken: currentAuthenticationToken,
                                                                                  status: '2',
                                                                                );

                                                                                FFAppState().OTSForm = getJsonField(
                                                                                  (_model.apiResulALLOTSR?.jsonBody ?? ''),
                                                                                  r'''$''',
                                                                                );
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              text: FFLocalizations.of(context).getText(
                                                                                'p0dogi0a' /* Clear */,
                                                                              ),
                                                                              options: FFButtonOptions(
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      font: GoogleFonts.interTight(
                                                                                        fontWeight: FontWeight.normal,
                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                elevation: 0.0,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 8.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      16.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              8.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'zwdf2k9j' /* Loan Number */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              4,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '5i2kvadk' /* User Name */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        if (responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                        ))
                                                                          Expanded(
                                                                            flex:
                                                                                2,
                                                                            child:
                                                                                Text(
                                                                              FFLocalizations.of(context).getText(
                                                                                'zjs2kd9o' /* Apply Date */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'eb2rtiun' /* Status */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              1,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '574fjvfl' /* Actions */,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.end,
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final applicationList =
                                                                        getJsonField(
                                                                      FFAppState()
                                                                          .OTSForm,
                                                                      r'''$.paginatedData''',
                                                                    ).toList();
                                                                    if (applicationList
                                                                        .isEmpty) {
                                                                      return Center(
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/images/9276419.png',
                                                                          height:
                                                                              400.0,
                                                                        ),
                                                                      );
                                                                    }

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          applicationList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              applicationListIndex) {
                                                                        final applicationListItem =
                                                                            applicationList[applicationListIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              1.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(
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
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (responsiveVisibility(
                                                                                                  context: context,
                                                                                                  phone: false,
                                                                                                  tablet: false,
                                                                                                ))
                                                                                                  Flexible(
                                                                                                    child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.loan_number''',
                                                                                                        )?.toString(),
                                                                                                        '0',
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
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    await Clipboard.setData(ClipboardData(
                                                                                                        text: getJsonField(
                                                                                                      applicationListItem,
                                                                                                      r'''$.ots.loan_number''',
                                                                                                    ).toString()));
                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                      SnackBar(
                                                                                                        content: Text(
                                                                                                          'Copied',
                                                                                                          style: TextStyle(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          ),
                                                                                                        ),
                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                  child: Icon(
                                                                                                    Icons.content_copy,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 4,
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
                                                                                                        (String var1, String var2) {
                                                                                                          return var1 + " " + var2;
                                                                                                        }(
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.first_name''',
                                                                                                            ).toString(),
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.last_name''',
                                                                                                            ).toString()),
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
                                                                                          if (responsiveVisibility(
                                                                                            context: context,
                                                                                            phone: false,
                                                                                            tablet: false,
                                                                                          ))
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Text(
                                                                                                valueOrDefault<String>(
                                                                                                  getJsonField(
                                                                                                    applicationListItem,
                                                                                                    r'''$.ots.createdAt''',
                                                                                                  )?.toString(),
                                                                                                  '0',
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
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  height: 32.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: () {
                                                                                                      if ('0' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).yellowTrans;
                                                                                                      } else if ('1' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).greenTrans;
                                                                                                      } else if ('2' ==
                                                                                                          getJsonField(
                                                                                                            applicationListItem,
                                                                                                            r'''$.ots.status''',
                                                                                                          ).toString()) {
                                                                                                        return FlutterFlowTheme.of(context).redTrans;
                                                                                                      } else {
                                                                                                        return Color(0xFFE0E0E1);
                                                                                                      }
                                                                                                    }(),
                                                                                                    borderRadius: BorderRadius.circular(40.0),
                                                                                                    border: Border.all(
                                                                                                      color: () {
                                                                                                        if ('0' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).pending;
                                                                                                        } else if ('1' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).approved;
                                                                                                        } else if ('2' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return FlutterFlowTheme.of(context).rejected;
                                                                                                        } else {
                                                                                                          return FlutterFlowTheme.of(context).secondaryText;
                                                                                                        }
                                                                                                      }(),
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      () {
                                                                                                        if ('0' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return 'Pending';
                                                                                                        } else if ('1' ==
                                                                                                            getJsonField(
                                                                                                              applicationListItem,
                                                                                                              r'''$.ots.status''',
                                                                                                            ).toString()) {
                                                                                                          return 'Approved';
                                                                                                        } else {
                                                                                                          return 'Rejected';
                                                                                                        }
                                                                                                      }(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: () {
                                                                                                              if ('0' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).pending;
                                                                                                              } else if ('1' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).approved;
                                                                                                              } else if ('2' ==
                                                                                                                  getJsonField(
                                                                                                                    applicationListItem,
                                                                                                                    r'''$.ots.status''',
                                                                                                                  ).toString()) {
                                                                                                                return FlutterFlowTheme.of(context).rejected;
                                                                                                              } else {
                                                                                                                return FlutterFlowTheme.of(context).secondaryText;
                                                                                                              }
                                                                                                            }(),
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
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
                                                                                                  tabletLandscape: false,
                                                                                                  desktop: false,
                                                                                                ))
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 44.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.remove_red_eye_outlined,
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      _model.ruserReffDetailsView = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                        authToken: currentAuthenticationToken,
                                                                                                        branch: FFAppState().branch,
                                                                                                        otsId: getJsonField(
                                                                                                          applicationListItem,
                                                                                                          r'''$.ots.loan_number''',
                                                                                                        ).toString(),
                                                                                                      );

                                                                                                      FFAppState().singleuserreff = getJsonField(
                                                                                                        (_model.ruserReffDetailsView?.jsonBody ?? ''),
                                                                                                        r'''$''',
                                                                                                      );
                                                                                                      safeSetState(() {});

                                                                                                      context.pushNamed(
                                                                                                        OtsFormViewUsersWidget.routeName,
                                                                                                        extra: <String, dynamic>{
                                                                                                          kTransitionInfoKey: TransitionInfo(
                                                                                                            hasTransition: true,
                                                                                                            transitionType: PageTransitionType.fade,
                                                                                                            duration: Duration(milliseconds: 1000),
                                                                                                          ),
                                                                                                        },
                                                                                                      );

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                  ),
                                                                                                FlutterFlowIconButton(
                                                                                                  borderRadius: 8.0,
                                                                                                  buttonSize: 40.0,
                                                                                                  fillColor: Color(0xFFDBEDFB),
                                                                                                  icon: Icon(
                                                                                                    Icons.remove_red_eye_outlined,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    _model.ruserReffDetailsView4 = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                      authToken: currentAuthenticationToken,
                                                                                                      branch: FFAppState().branch,
                                                                                                      otsId: getJsonField(
                                                                                                        applicationListItem,
                                                                                                        r'''$.ots.loan_number''',
                                                                                                      ).toString(),
                                                                                                    );

                                                                                                    FFAppState().singleuserreff = getJsonField(
                                                                                                      (_model.ruserReffDetailsView4?.jsonBody ?? ''),
                                                                                                      r'''$''',
                                                                                                    );
                                                                                                    safeSetState(() {});

                                                                                                    context.pushNamed(
                                                                                                      OtsFormViewUsersWidget.routeName,
                                                                                                      extra: <String, dynamic>{
                                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                                          hasTransition: true,
                                                                                                          transitionType: PageTransitionType.fade,
                                                                                                          duration: Duration(milliseconds: 1000),
                                                                                                        ),
                                                                                                      },
                                                                                                    );

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Divider(
                                                                                    thickness: 2.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(0.0),
                                                                        bottomRight:
                                                                            Radius.circular(0.0),
                                                                        topLeft:
                                                                            Radius.circular(8.0),
                                                                        topRight:
                                                                            Radius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '71kl43vq' /* Rows per pages: */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Container(
                                                                                child: FlutterFlowDropDown<String>(
                                                                                  controller: _model.limitDropDownValueController4 ??= FormFieldController<String>(
                                                                                    _model.limitDropDownValue4 ??= getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.limit''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                  options: [
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '2t1vse57' /* 5 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'f3wi6udy' /* 10 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'hqt5gtwn' /* 25 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'g6z2wps8' /* 50 */,
                                                                                    ),
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '0apnbf7d' /* 100 */,
                                                                                    )
                                                                                  ],
                                                                                  onChanged: (val) async {
                                                                                    safeSetState(() => _model.limitDropDownValue4 = val);
                                                                                    _model.rapiLimitChange = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue4,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '2',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.rapiLimitChange?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  width: 73.0,
                                                                                  height: 30.0,
                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    '8ktc2wr8' /* 10 */,
                                                                                  ),
                                                                                  icon: Icon(
                                                                                    Icons.arrow_drop_down,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  elevation: 2.0,
                                                                                  borderColor: Colors.transparent,
                                                                                  borderWidth: 0.0,
                                                                                  borderRadius: 8.0,
                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  hidesUnderline: true,
                                                                                  isOverButton: false,
                                                                                  isSearchable: false,
                                                                                  isMultiSelect: false,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.page''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'biby9272' /* - */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.currentPageCount''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'x5vxotxo' /*  of  */,
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.totalItems''',
                                                                                        )?.toString(),
                                                                                        '0',
                                                                                      ),
                                                                                      style: TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        color: Color(0xBA57636C),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                15.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    _model.rapiFirst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      page: '1',
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue4,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '2',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.rapiFirst?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.first_page,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 24.0,
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    if (getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.previousPage''',
                                                                                        ) !=
                                                                                        null) {
                                                                                      _model.rapiprevious = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                        branch: FFAppState().branch,
                                                                                        authToken: currentAuthenticationToken,
                                                                                        page: getJsonField(
                                                                                          FFAppState().OTSForm,
                                                                                          r'''$.previousPage''',
                                                                                        ).toString(),
                                                                                        limit: valueOrDefault<String>(
                                                                                          _model.limitDropDownValue4,
                                                                                          '10',
                                                                                        ),
                                                                                        status: '2',
                                                                                      );

                                                                                      FFAppState().OTSForm = getJsonField(
                                                                                        (_model.rapiprevious?.jsonBody ?? ''),
                                                                                        r'''$''',
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                    }

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.keyboard_arrow_left,
                                                                                    color: Color(0xBA57636C),
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 20.0)),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  if (getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.nextPage''',
                                                                                      ) !=
                                                                                      null) {
                                                                                    _model.rapiNext = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                      branch: FFAppState().branch,
                                                                                      authToken: currentAuthenticationToken,
                                                                                      page: getJsonField(
                                                                                        FFAppState().OTSForm,
                                                                                        r'''$.nextPage''',
                                                                                      ).toString(),
                                                                                      limit: valueOrDefault<String>(
                                                                                        _model.limitDropDownValue4,
                                                                                        '10',
                                                                                      ),
                                                                                      status: '2',
                                                                                    );

                                                                                    FFAppState().OTSForm = getJsonField(
                                                                                      (_model.rapiNext?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.keyboard_arrow_right,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.rapiLAst = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                    authToken: currentAuthenticationToken,
                                                                                    branch: FFAppState().branch,
                                                                                    page: getJsonField(
                                                                                      FFAppState().OTSForm,
                                                                                      r'''$.totalPages''',
                                                                                    ).toString(),
                                                                                    limit: valueOrDefault<String>(
                                                                                      _model.limitDropDownValue4,
                                                                                      '10',
                                                                                    ),
                                                                                    status: '2',
                                                                                  );

                                                                                  FFAppState().OTSForm = getJsonField(
                                                                                    (_model.rapiLAst?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.last_page_outlined,
                                                                                  color: Color(0xBA57636C),
                                                                                  size: 24.0,
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 20.0)),
                                                                          ),
                                                                        ].divide(SizedBox(width: 30.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                          ],
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
              if (responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.mobileVersionNotAvailableModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MobileVersionNotAvailableWidget(),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
