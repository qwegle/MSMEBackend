import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/loader/loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'mainwebnav_osic_model.dart';
export 'mainwebnav_osic_model.dart';

class MainwebnavOsicWidget extends StatefulWidget {
  const MainwebnavOsicWidget({
    super.key,
    this.clr,
    this.clr1,
    this.clr2,
    this.clr3,
    this.clr4,
    this.clr5,
    this.clr6,
    this.clr7,
    this.clr8,
    this.backroundclr,
    this.backroundclr1,
    this.backroundclr2,
    this.backroundclr3,
    this.backroundclr4,
    this.backroundclr5,
    this.backroundclr6,
    this.backroundclr7,
    this.backroundclr8,
  });

  final Color? clr;
  final Color? clr1;
  final Color? clr2;
  final Color? clr3;
  final Color? clr4;
  final Color? clr5;
  final Color? clr6;
  final Color? clr7;
  final Color? clr8;
  final Color? backroundclr;
  final Color? backroundclr1;
  final Color? backroundclr2;
  final Color? backroundclr3;
  final Color? backroundclr4;
  final Color? backroundclr5;
  final Color? backroundclr6;
  final Color? backroundclr7;
  final Color? backroundclr8;

  @override
  State<MainwebnavOsicWidget> createState() => _MainwebnavOsicWidgetState();
}

class _MainwebnavOsicWidgetState extends State<MainwebnavOsicWidget> {
  late MainwebnavOsicModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainwebnavOsicModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x33000000),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/govt-of-odisha-by-rupesh-logo-BC6FE21B9A-seeklogo.com.png',
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'tlu0ni83' /* MSME */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                          Divider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).alternate,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.backroundclr,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 8.0, 10.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context
                                      .pushNamed(DashboardOsicWidget.routeName);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Icon(
                                        Icons.home_rounded,
                                        color: valueOrDefault<Color>(
                                          widget.clr,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '92se715r' /* Dashboard */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                widget.clr,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.backroundclr1,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 8.0, 10.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LoaderWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.apiGovOrderApi = await MsmeOsicGroup
                                      .filterGovernmentOrdersCall
                                      .call(
                                    authToken: currentAuthenticationToken,
                                  );

                                  FFAppState().GovtOrder = getJsonField(
                                    (_model.apiGovOrderApi?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiGovOrderApi?.statusCode ??
                                          200) ==
                                      401) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Session ended — expired or logged in elsewhere. Please log in again.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .isseued,
                                      ),
                                    );
                                    authManager.updateAuthUserData(
                                      authenticationToken: '',
                                    );

                                    context.pushNamed(LoginWidget.routeName);
                                  } else {
                                    context
                                        .pushNamed(GovtOrderWidget.routeName);
                                  }

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Icon(
                                        Icons.article_sharp,
                                        color: valueOrDefault<Color>(
                                          widget.clr1,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '9aqfpvlq' /* Govt. Order */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                widget.clr1,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.backroundclr2,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 8.0, 10.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LoaderWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.apiFloatTender = await MsmeOsicGroup
                                      .filterFloatTendersCall
                                      .call(
                                    authToken: currentAuthenticationToken,
                                  );

                                  FFAppState().floatTender = getJsonField(
                                    (_model.apiFloatTender?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiFloatTender?.statusCode ??
                                          200) ==
                                      401) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Session ended — expired or logged in elsewhere. Please log in again.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .isseued,
                                      ),
                                    );
                                    authManager.updateAuthUserData(
                                      authenticationToken: '',
                                    );

                                    context.pushNamed(LoginWidget.routeName);
                                  } else {
                                    context
                                        .pushNamed(FloatTenderWidget.routeName);
                                  }

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Icon(
                                        Icons.file_copy,
                                        color: valueOrDefault<Color>(
                                          widget.clr2,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'tngemb24' /* Float Tender */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                widget.clr2,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.backroundclr3,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 8.0, 10.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LoaderWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.apiTenderDetails = await MsmeOsicGroup
                                      .filterTenderResultsCall
                                      .call(
                                    authToken: currentAuthenticationToken,
                                  );

                                  FFAppState().TenderResult = getJsonField(
                                    (_model.apiTenderDetails?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiTenderDetails?.statusCode ??
                                          200) ==
                                      401) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Session ended — expired or logged in elsewhere. Please log in again.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .isseued,
                                      ),
                                    );
                                    authManager.updateAuthUserData(
                                      authenticationToken: '',
                                    );

                                    context.pushNamed(LoginWidget.routeName);
                                  } else {
                                    context.pushNamed(
                                        TenderDetailsWidget.routeName);
                                  }

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Icon(
                                        Icons.restore_sharp,
                                        color: valueOrDefault<Color>(
                                          widget.clr3,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'ck3o78si' /* Tender Details */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                widget.clr3,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        if (responsiveVisibility(
                          context: context,
                          phone: false,
                          tablet: false,
                          tabletLandscape: false,
                          desktop: false,
                        ))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: widget.backroundclr4,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 8.0, 10.0, 8.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: LoaderWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    Navigator.pop(context);

                                    context.pushNamed(
                                        ChoseL1bidderWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.cookie,
                                          color: valueOrDefault<Color>(
                                            widget.clr4,
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          size: 20.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'quo1hpzk' /* Chose  Bidder */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: valueOrDefault<Color>(
                                                  widget.clr4,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.backroundclr5,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 8.0, 10.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LoaderWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.apiSupplyOrder = await MsmeOsicGroup
                                      .filterSupplyOrdersCall
                                      .call(
                                    authToken: currentAuthenticationToken,
                                  );

                                  FFAppState().SupplyOrder = getJsonField(
                                    (_model.apiSupplyOrder?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiSupplyOrder?.statusCode ??
                                          200) ==
                                      401) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Session ended — expired or logged in elsewhere. Please log in again.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .isseued,
                                      ),
                                    );
                                    authManager.updateAuthUserData(
                                      authenticationToken: '',
                                    );

                                    context.pushNamed(LoginWidget.routeName);
                                  } else {
                                    context
                                        .pushNamed(SupplyOrderWidget.routeName);
                                  }

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.accusoft,
                                        color: valueOrDefault<Color>(
                                          widget.clr5,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'y4ne4pnb' /* Supply order */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                widget.clr5,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.backroundclr6,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 8.0, 10.0, 8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: LoaderWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));

                                  _model.sanctionOrderApi = await MsmeOsicGroup
                                      .ggetAllSanctionOrdersCall
                                      .call(
                                    authToken: currentAuthenticationToken,
                                  );

                                  FFAppState().SanctionOrder = getJsonField(
                                    (_model.sanctionOrderApi?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.sanctionOrderApi?.statusCode ??
                                          200) ==
                                      401) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Session ended — expired or logged in elsewhere. Please log in again.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .isseued,
                                      ),
                                    );
                                    authManager.updateAuthUserData(
                                      authenticationToken: '',
                                    );

                                    context.pushNamed(LoginWidget.routeName);
                                  } else {
                                    context.pushNamed(
                                        SanctionOrderWidget.routeName);
                                  }

                                  safeSetState(() {});
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Icon(
                                        Icons.border_color,
                                        color: valueOrDefault<Color>(
                                          widget.clr6,
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'd8yrq6o4' /* Sanction Order */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: valueOrDefault<Color>(
                                                widget.clr6,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Visibility(
                              visible: responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 8.0, 10.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 8.0),
                                      child: Icon(
                                        Icons.person,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'u4gkgd2e' /* Profile */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
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
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().deleteAuthToken();
                        FFAppState().authToken = '';

                        FFAppState().deleteUserReff();
                        FFAppState().userReff = null;

                        FFAppState().deleteBranch();
                        FFAppState().branch = '';

                        FFAppState().deleteShowHide();
                        FFAppState().ShowHide = '';

                        FFAppState().deleteOTSForm();
                        FFAppState().OTSForm = null;

                        FFAppState().deleteImage();
                        FFAppState().image = '';

                        FFAppState().deleteOtsCount();
                        FFAppState().otsCount = null;

                        FFAppState().deleteOtsCertificateCount();
                        FFAppState().otsCertificateCount = null;

                        FFAppState().deleteAckFilter();
                        FFAppState().ackFilter = null;

                        FFAppState().deleteCertificateCountBarChart();
                        FFAppState().CertificateCountBarChart = null;

                        FFAppState().deleteCurrentPage();
                        FFAppState().currentPage = 0;

                        FFAppState().deleteRowPerPage();
                        FFAppState().RowPerPage = 0;

                        FFAppState().deleteIsPreviousEnabled();
                        FFAppState().isPreviousEnabled = false;

                        FFAppState().deletePreCurrentPage();
                        FFAppState().PreCurrentPage = 0;

                        FFAppState().deleteNDCFilter();
                        FFAppState().NDCFilter = null;

                        FFAppState().deleteSingleuserreff();
                        FFAppState().singleuserreff = null;

                        FFAppState().deleteMemoReff();
                        FFAppState().MemoReff = [];

                        FFAppState().deleteSettlementOrderReff();
                        FFAppState().SettlementOrderReff = [];

                        FFAppState().deleteGovtOrder();
                        FFAppState().GovtOrder = null;

                        FFAppState().deleteFloatTender();
                        FFAppState().floatTender = null;

                        FFAppState().deleteSupplyOrder();
                        FFAppState().SupplyOrder = null;

                        FFAppState().deleteTenderResult();
                        FFAppState().TenderResult = null;

                        FFAppState().deleteOSICDashHideShow();
                        FFAppState().OSICDashHideShow = '';

                        FFAppState().deleteOSICDashboardCount();
                        FFAppState().OSICDashboardCount = null;

                        FFAppState().deleteTest();
                        FFAppState().test = null;

                        FFAppState().deleteMemoFilter();
                        FFAppState().memoFilter = null;

                        FFAppState().deleteSettOrderReff();
                        FFAppState().SettOrderReff = null;

                        FFAppState().deleteLoader();
                        FFAppState().loader = false;

                        FFAppState().EmailVerifyShowHide = '';
                        FFAppState().deleteExistingLoanReff();
                        FFAppState().ExistingLoanReff = null;

                        FFAppState().resetPassHideShow = '';
                        FFAppState().deleteAttimerEnd();
                        FFAppState().AttimerEnd = false;

                        FFAppState().deleteTrackStatusOSFC();
                        FFAppState().TrackStatusOSFC = null;

                        FFAppState().appCheckToken = '';
                        FFAppState().deleteSanctionOrder();
                        FFAppState().SanctionOrder = null;

                        FFAppState().deleteChoseL1Bidders();
                        FFAppState().ChoseL1Bidders = null;

                        safeSetState(() {});
                        _model.logout = await MsmeOsfcGroup.logoutCall.call(
                          authToken: currentAuthenticationToken,
                        );

                        context.pushNamed(LoginWidget.routeName);

                        safeSetState(() {});
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFDDFFFE),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'iydm1egu' /* Log Out */,
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                              Icon(
                                Icons.logout,
                                color: FlutterFlowTheme.of(context).secondary,
                                size: 24.0,
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
