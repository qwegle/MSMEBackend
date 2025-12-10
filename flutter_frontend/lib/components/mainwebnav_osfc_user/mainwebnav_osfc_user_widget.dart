import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/loader/loader_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mainwebnav_osfc_user_model.dart';
export 'mainwebnav_osfc_user_model.dart';

class MainwebnavOsfcUserWidget extends StatefulWidget {
  const MainwebnavOsfcUserWidget({
    super.key,
    this.colour1,
    this.clr2,
    this.clr3,
    this.clr4,
    this.clr5,
    this.clr6,
    this.clr7,
    Color? clr8,
    this.backColor1,
    this.backColor2,
    this.backColor3,
    this.backColor4,
    this.backColor5,
    this.backColor6,
    this.backColor7,
    this.backColor8,
  }) : this.clr8 = clr8 ?? const Color(0xFF57636C);

  final Color? colour1;
  final Color? clr2;
  final Color? clr3;
  final Color? clr4;
  final Color? clr5;
  final Color? clr6;
  final Color? clr7;
  final Color clr8;
  final Color? backColor1;
  final Color? backColor2;
  final Color? backColor3;
  final Color? backColor4;
  final Color? backColor5;
  final Color? backColor6;
  final Color? backColor7;
  final Color? backColor8;

  @override
  State<MainwebnavOsfcUserWidget> createState() =>
      _MainwebnavOsfcUserWidgetState();
}

class _MainwebnavOsfcUserWidgetState extends State<MainwebnavOsfcUserWidget> {
  late MainwebnavOsfcUserModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainwebnavOsfcUserModel());

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
                              'f95o7e85' /* MSME */,
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: widget.backColor1,
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
                                    _model.apiUserCount1 =
                                        await MsmeOsfcGroup.userStatsCall.call(
                                      userId: getJsonField(
                                        FFAppState().userReff,
                                        r'''$.user.id''',
                                      ).toString(),
                                      authToken: currentAuthenticationToken,
                                    );

                                    FFAppState().otsCount = getJsonField(
                                      (_model.apiUserCount1?.jsonBody ?? ''),
                                      r'''$''',
                                    );
                                    safeSetState(() {});
                                    if ((_model.apiUserCount1?.statusCode ??
                                            200) ==
                                        401) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Session ended — expired or logged in elsewhere. Please log in again.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
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
                                          DashboardUserWidget.routeName);
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
                                          color: widget.colour1,
                                          size: 20.0,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '76rrw6qe' /* Dashboard */,
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
                                                color: widget.colour1,
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
                                color: widget.backColor2,
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
                                        .pushNamed(NewOtsFormWidget.routeName);
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'mrzcqj1j' /* Application Form */,
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
                                color: widget.backColor3,
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
                                    _model.otsAPIUser = await MsmeOsfcGroup
                                        .filterOTSFormsCall
                                        .call(
                                      authToken: currentAuthenticationToken,
                                      userId: getJsonField(
                                        FFAppState().userReff,
                                        r'''$.user.id''',
                                      ).toString(),
                                    );

                                    FFAppState().OTSForm = getJsonField(
                                      (_model.otsAPIUser?.jsonBody ?? ''),
                                      r'''$''',
                                    );
                                    safeSetState(() {});
                                    if ((_model.otsAPIUser?.statusCode ??
                                            200) ==
                                        401) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Session ended — expired or logged in elsewhere. Please log in again.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
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
                                          OtsFormStatusWidget.routeName);
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
                                          Icons.query_stats_rounded,
                                          color: widget.clr3,
                                          size: 24.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'lhb21jo0' /* Submitted OTS Forms */,
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
                                color: widget.backColor4,
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

                                    _model.apiAckFilterUsers =
                                        await MsmeOsfcGroup.filterAckFormsCall
                                            .call(
                                      authToken: currentAuthenticationToken,
                                      userId: getJsonField(
                                        FFAppState().userReff,
                                        r'''$.user.id''',
                                      ).toString(),
                                    );

                                    FFAppState().ackFilter = getJsonField(
                                      (_model.apiAckFilterUsers?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    if ((_model.apiAckFilterUsers?.statusCode ??
                                            200) ==
                                        401) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Session ended — expired or logged in elsewhere. Please log in again.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
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
                                          AcknowledgementSlipUserWidget
                                              .routeName);
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
                                          Icons.library_books,
                                          color: widget.clr4,
                                          size: 20.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '63y25qf3' /* Acknowledgement Slip */,
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
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: LoaderWidget(),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                _model.apiUserOrder =
                                    await MsmeOsfcGroup.filterOrdersCall.call(
                                  authToken: currentAuthenticationToken,
                                  userId: getJsonField(
                                    FFAppState().userReff,
                                    r'''$.user.id''',
                                  ).toString(),
                                );

                                FFAppState().SettOrderReff = getJsonField(
                                  (_model.apiUserOrder?.jsonBody ?? ''),
                                  r'''$''',
                                );
                                safeSetState(() {});
                                Navigator.pop(context);
                                if ((_model.apiUserOrder?.statusCode ?? 200) ==
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
                                          FlutterFlowTheme.of(context).isseued,
                                    ),
                                  );
                                  authManager.updateAuthUserData(
                                    authenticationToken: '',
                                  );

                                  context.pushNamed(LoginWidget.routeName);
                                } else {
                                  context.pushNamed(
                                      SettlementOrderUserWidget.routeName);
                                }

                                safeSetState(() {});
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: widget.backColor5,
                                  borderRadius: BorderRadius.circular(8.0),
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
                                          Icons.receipt,
                                          color: widget.clr5,
                                          size: 20.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'vki8cxvo' /* Settlement Order */,
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
                                color: widget.backColor6,
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

                                    _model.apiUserNDCertificate =
                                        await MsmeOsfcGroup
                                            .filterCertificatesCall
                                            .call(
                                      authToken: currentAuthenticationToken,
                                      userId: getJsonField(
                                        FFAppState().userReff,
                                        r'''$.user.id''',
                                      ).toString(),
                                    );

                                    FFAppState().NDCFilter = getJsonField(
                                      (_model.apiUserNDCertificate?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    if ((_model.apiUserNDCertificate
                                                ?.statusCode ??
                                            200) ==
                                        401) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Session ended — expired or logged in elsewhere. Please log in again.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
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
                                          NoDueCertificatesUserWidget
                                              .routeName);
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
                                          color: widget.clr6,
                                          size: 20.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'b6clr57f' /* No Due Certificate */,
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
                                color: widget.backColor7,
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

                                    _model.apiResulti3pLoanUser =
                                        await MsmeOsfcGroup.filterLoansCall
                                            .call(
                                      authToken: currentAuthenticationToken,
                                    );

                                    FFAppState().ExistingLoanReff =
                                        getJsonField(
                                      (_model.apiResulti3pLoanUser?.jsonBody ??
                                          ''),
                                      r'''$''',
                                    );
                                    safeSetState(() {});
                                    Navigator.pop(context);
                                    if ((_model.apiResulti3pLoanUser
                                                ?.statusCode ??
                                            200) ==
                                        401) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Session ended — expired or logged in elsewhere. Please log in again.',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
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
                                          ExsitingLoanApplicationStatusWidget
                                              .routeName);
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
                                          Icons.account_balance_outlined,
                                          color: widget.clr7,
                                          size: 20.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'cbeb0px8' /* Exsiting Loan */,
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
                                                  color: widget.clr7,
                                                  letterSpacing: 0.0,
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
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(ProfileUserWidget.routeName);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: widget.backColor8,
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
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: LoaderWidget(),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      context.pushNamed(
                                          ProfileUserWidget.routeName);

                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 8.0, 0.0, 8.0),
                                          child: Icon(
                                            Icons.person,
                                            color: widget.clr8,
                                            size: 24.0,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '9xhgxvyc' /* Profile */,
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
                                                  color: widget.clr8,
                                                  letterSpacing: 0.0,
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
                      ),
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
                                    '4y91bxfn' /* Log Out */,
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
