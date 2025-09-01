import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/loader/loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mainwebnav_osfc_branch_model.dart';
export 'mainwebnav_osfc_branch_model.dart';

class MainwebnavOsfcBranchWidget extends StatefulWidget {
  const MainwebnavOsfcBranchWidget({
    super.key,
    Color? clr,
    Color? clr2,
    Color? clr3,
    Color? clr4,
    Color? clr5,
    Color? clr6,
    Color? clr7,
    this.backclr1,
    this.backclr2,
    this.backclr3,
    this.backclr4,
    this.backclr5,
    this.backclr6,
    this.backclr7,
  })  : this.clr = clr ?? const Color(0xFF57636C),
        this.clr2 = clr2 ?? const Color(0xFF57636C),
        this.clr3 = clr3 ?? const Color(0xFF57636C),
        this.clr4 = clr4 ?? const Color(0xFF57636C),
        this.clr5 = clr5 ?? const Color(0xFF57636C),
        this.clr6 = clr6 ?? const Color(0xFF57636C),
        this.clr7 = clr7 ?? const Color(0xFF57636C);

  final Color clr;
  final Color clr2;
  final Color clr3;
  final Color clr4;
  final Color clr5;
  final Color clr6;
  final Color clr7;
  final Color? backclr1;
  final Color? backclr2;
  final Color? backclr3;
  final Color? backclr4;
  final Color? backclr5;
  final Color? backclr6;
  final Color? backclr7;

  @override
  State<MainwebnavOsfcBranchWidget> createState() =>
      _MainwebnavOsfcBranchWidgetState();
}

class _MainwebnavOsfcBranchWidgetState
    extends State<MainwebnavOsfcBranchWidget> {
  late MainwebnavOsfcBranchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainwebnavOsfcBranchModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 220.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.0,
            color: Color(0x33000000),
            offset: Offset(
              1.0,
              0.0,
            ),
          )
        ],
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
        ),
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
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
                        ),
                        Expanded(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'xacy9zll' /* MSME */,
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
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: widget.backclr1,
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

                                  _model.apiResultfilterOtsDash =
                                      await MsmeOsfcGroup.filterOTSFormsCall
                                          .call(
                                    branch: FFAppState().branch,
                                    authToken: currentAuthenticationToken,
                                  );

                                  _model.otsCount = await MsmeOsfcGroup
                                      .countApplicationsCall
                                      .call(
                                    authToken: currentAuthenticationToken,
                                    branch: FFAppState().branch,
                                  );

                                  _model.certificateCountDays =
                                      await MsmeOsfcGroup
                                          .getCertificateCountDaysCall
                                          .call(
                                    authToken: currentAuthenticationToken,
                                  );

                                  _model.otsCertificateCount =
                                      await MsmeOsfcGroup
                                          .getCeritificateCountCall
                                          .call(
                                    authToken: currentAuthenticationToken,
                                    branch: FFAppState().branch,
                                  );

                                  FFAppState().OTSForm = getJsonField(
                                    (_model.apiResultfilterOtsDash?.jsonBody ??
                                        ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  FFAppState().otsCertificateCount =
                                      getJsonField(
                                    (_model.otsCertificateCount?.jsonBody ??
                                        ''),
                                    r'''$''',
                                  );
                                  FFAppState().CertificateCountBarChart =
                                      getJsonField(
                                    (_model.certificateCountDays?.jsonBody ??
                                        ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiResultfilterOtsDash
                                              ?.statusCode ??
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
                                      DashboardOsfcWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 1000),
                                        ),
                                      },
                                    );
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
                                        Icons.home_rounded,
                                        color: widget.clr,
                                        size: 20.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'r3ztxpak' /* Dashboard */,
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
                                              color: widget.clr,
                                              fontSize: 14.0,
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
                              color: widget.backclr2,
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
                                  FFAppState().deletePreCurrentPage();
                                  FFAppState().PreCurrentPage = 0;

                                  FFAppState().deleteRowPerPage();
                                  FFAppState().RowPerPage = 0;

                                  safeSetState(() {});
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

                                  _model.apiResultfilterOtss =
                                      await MsmeOsfcGroup.filterOTSFormsCall
                                          .call(
                                    branch: FFAppState().branch,
                                    authToken: currentAuthenticationToken,
                                  );

                                  FFAppState().OTSForm = getJsonField(
                                    (_model.apiResultfilterOtss?.jsonBody ??
                                        ''),
                                    r'''$''',
                                  );
                                  FFAppState().currentPage = getJsonField(
                                    (_model.apiResultfilterOtss?.jsonBody ??
                                        ''),
                                    r'''$.paginatedData''',
                                  );
                                  FFAppState().RowPerPage = getJsonField(
                                    (_model.apiResultfilterOtss?.jsonBody ??
                                        ''),
                                    r'''$.paginatedData''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiResultfilterOtss?.statusCode ??
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
                                      ApplicationListBranchWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 1000),
                                        ),
                                      },
                                    );
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
                                        Icons.inventory_sharp,
                                        color: widget.clr2,
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '5wyhl98j' /* Application List */,
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
                                                color: widget.clr2,
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
                              color: widget.backclr3,
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

                                  _model.apiAckFilter = await MsmeOsfcGroup
                                      .filterAckFormsCall
                                      .call(
                                    authToken: currentAuthenticationToken,
                                    branch: FFAppState().branch,
                                  );

                                  FFAppState().ackFilter = getJsonField(
                                    (_model.apiAckFilter?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiAckFilter?.statusCode ??
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
                                      AckSlipBranchWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 1000),
                                        ),
                                      },
                                    );
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
                                        Icons.inventory_sharp,
                                        color: widget.clr3,
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '63i6ppe2' /* Acknowledgement */,
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
                                                color: widget.clr3,
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
                              color: widget.backclr4,
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

                                  _model.apiResultfilterMemo =
                                      await MsmeOsfcGroup.memosFilterCall.call(
                                    authToken: currentAuthenticationToken,
                                    branch: FFAppState().branch,
                                  );

                                  FFAppState().MemoReff = getJsonField(
                                    (_model.apiResultfilterMemo?.jsonBody ??
                                        ''),
                                    r'''$''',
                                    true,
                                  )!
                                      .toList()
                                      .cast<dynamic>();
                                  FFAppState().memoFilter = getJsonField(
                                    (_model.apiResultfilterMemo?.jsonBody ??
                                        ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiResultfilterMemo?.statusCode ??
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
                                      MemorandomBranchWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 1000),
                                        ),
                                      },
                                    );
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
                                        Icons.list_alt,
                                        color: widget.clr4,
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '3leiu11p' /* Memorandom */,
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
                                                color: widget.clr4,
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
                              color: widget.backclr5,
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

                                  _model.apiCertificate = await MsmeOsfcGroup
                                      .filterCertificatesCall
                                      .call(
                                    branch: FFAppState().branch,
                                    authToken: currentAuthenticationToken,
                                  );

                                  FFAppState().NDCFilter = getJsonField(
                                    (_model.apiCertificate?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiCertificate?.statusCode ??
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
                                      NoDueCertificateviewWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 1000),
                                        ),
                                      },
                                    );
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
                                        Icons.receipt,
                                        color: widget.clr5,
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0xbbe4mt' /* No Due Certificate */,
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
                                                color: widget.clr5,
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
                              color: widget.backclr6,
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

                                  _model.apiResulti3pLoan =
                                      await MsmeOsfcGroup.filterLoansCall.call(
                                    authToken: currentAuthenticationToken,
                                    branch: FFAppState().branch,
                                  );

                                  FFAppState().ExistingLoanReff = getJsonField(
                                    (_model.apiResulti3pLoan?.jsonBody ?? ''),
                                    r'''$''',
                                  );
                                  safeSetState(() {});
                                  Navigator.pop(context);
                                  if ((_model.apiResulti3pLoan?.statusCode ??
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
                                      ExLoanAplicStaBranchWidget.routeName,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration:
                                              Duration(milliseconds: 1000),
                                        ),
                                      },
                                    );
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
                                        Icons.inventory_sharp,
                                        color: widget.clr6,
                                        size: 20.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '0n6skauk' /* Existing Loan */,
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
                                                color: widget.clr6,
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                          .divide(SizedBox(height: 8.0))
                          .addToStart(SizedBox(height: 12.0))
                          .addToEnd(SizedBox(height: 12.0)),
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

                        FFAppState().deleteEmailVerifyShowHide();
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
                                    'zvylmsn7' /* Log Out */,
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
