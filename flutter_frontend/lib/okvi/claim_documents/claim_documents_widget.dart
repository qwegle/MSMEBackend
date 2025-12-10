import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/mainwebnav_okvi/mainwebnav_okvi_widget.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'claim_documents_model.dart';
export 'claim_documents_model.dart';

class ClaimDocumentsWidget extends StatefulWidget {
  const ClaimDocumentsWidget({super.key});

  static String routeName = 'ClaimDocuments';
  static String routePath = '/claimDocuments';

  @override
  State<ClaimDocumentsWidget> createState() => _ClaimDocumentsWidgetState();
}

class _ClaimDocumentsWidgetState extends State<ClaimDocumentsWidget> {
  late ClaimDocumentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClaimDocumentsModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

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
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.mainwebnavOkviModel,
                        updateCallback: () => safeSetState(() {}),
                        child: MainwebnavOkviWidget(
                          clr3: FlutterFlowTheme.of(context).rejected,
                          backClr3: FlutterFlowTheme.of(context).redTrans,
                        ),
                      ),
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
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0.5,
                                            color: FlutterFlowTheme.of(context)
                                                .shadowCLr,
                                            offset: Offset(
                                              2.0,
                                              2.0,
                                            ),
                                            spreadRadius: 2.0,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            32.0, 0.0, 32.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.upload_file,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 28.0,
                                                      ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'fjwae5ur' /* Claim Document Submission */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'vql2otvs' /* Upload required documents for ... */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          fontSize: 12.0,
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
                                                ].divide(SizedBox(height: 5.0)),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.help_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'ezhj4nxi' /* Last login: Today, 09:30 AM */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      maxWidth: 1370.0,
                                    ),
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (loggedIn)
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    24.0,
                                                                    24.0,
                                                                    24.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
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
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .info_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'l9ldm2rz' /* Prerequisites */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .warning,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            's25958v6' /* Opening Stock Submitted */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Icon(
                                                                          Icons
                                                                              .warning,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                          size:
                                                                              16.0,
                                                                        ),
                                                                        Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'znyxdxqx' /* Closing Stock Submitted */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 8.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          12.0)),
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
                                                                      Container(
                                                                    width:
                                                                        240.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .yellowTrans,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .pending,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'nkahxcr4' /* Action Required */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                      ),
                                                                                      color: Color(0xFF957415),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'mc4504al' /* You must submit both opening a... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF957415),
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
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  24.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '3hr0t3bb' /* Select Festival Name */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'kkfr4pgw' /* Festival Name: */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          final _datePickedDate =
                                                                              await showDatePicker(
                                                                            context:
                                                                                context,
                                                                            initialDate:
                                                                                getCurrentTimestamp,
                                                                            firstDate:
                                                                                getCurrentTimestamp,
                                                                            lastDate:
                                                                                DateTime(2050),
                                                                            builder:
                                                                                (context, child) {
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

                                                                          if (_datePickedDate !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked = DateTime(
                                                                                _datePickedDate.year,
                                                                                _datePickedDate.month,
                                                                                _datePickedDate.day,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Text(
                                                                              getJsonField(
                                                                                FFAppState().GetClaimHeaderReff,
                                                                                r'''$.festivalName''',
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
                                                                          ].divide(SizedBox(width: 10.0)).addToStart(SizedBox(width: 10.0)).addToEnd(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          8.0)),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 24.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  24.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                    .start,
                                                            children: [
                                                              Column(
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
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'q627ag7i' /* Required Documents Status: */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.apiFormI =
                                                                                await OkviGroup.getClaimDataCall.call(
                                                                              type: 'form1',
                                                                              festival: getJsonField(
                                                                                FFAppState().GetClaimHeaderReff,
                                                                                r'''$.festivalName''',
                                                                              ).toString(),
                                                                              authToken: currentAuthenticationToken,
                                                                            );

                                                                            if ('No form found' ==
                                                                                getJsonField(
                                                                                  (_model.apiFormI?.jsonBody ?? ''),
                                                                                  r'''$.message''',
                                                                                ).toString()) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Alert'),
                                                                                    content: Text('Form I has already been submitted. You cannot submit it again.'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              context.pushNamed(FormIWidget.routeName);
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.description,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'bma5yjfi' /* Form I - Invoice Details */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          font: GoogleFonts.interTight(
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                                tablet: false,
                                                                                                tabletLandscape: false,
                                                                                                desktop: false,
                                                                                              ))
                                                                                                Flexible(
                                                                                                  child: Container(
                                                                                                    height: 30.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      border: Border.all(
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: RichText(
                                                                                                            textScaler: MediaQuery.of(context).textScaler,
                                                                                                            text: TextSpan(
                                                                                                              children: [
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    '4fm2de6z' /* Not Started */,
                                                                                                                  ),
                                                                                                                  style: TextStyle(),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    'ci6lzsdg' /*   */,
                                                                                                                  ),
                                                                                                                  style: TextStyle(),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    'gdvlm0ud' /* ( */,
                                                                                                                  ),
                                                                                                                  style: TextStyle(),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    'wvivfmdx' /* 0 */,
                                                                                                                  ),
                                                                                                                  style: TextStyle(),
                                                                                                                ),
                                                                                                                TextSpan(
                                                                                                                  text: FFLocalizations.of(context).getText(
                                                                                                                    'jzyvsahf' /* ) */,
                                                                                                                  ),
                                                                                                                  style: TextStyle(),
                                                                                                                )
                                                                                                              ],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              Icon(
                                                                                                Icons.arrow_forward_ios,
                                                                                                color: FlutterFlowTheme.of(context).isseued,
                                                                                                size: 20.0,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            _model.apiResultFormV =
                                                                                await OkviGroup.getClaimDataCall.call(
                                                                              authToken: currentAuthenticationToken,
                                                                              type: 'formv',
                                                                              festival: getJsonField(
                                                                                FFAppState().GetClaimHeaderReff,
                                                                                r'''$.festivalName''',
                                                                              ).toString(),
                                                                            );

                                                                            if ('No form found' ==
                                                                                getJsonField(
                                                                                  (_model.apiResultFormV?.jsonBody ?? ''),
                                                                                  r'''$.message''',
                                                                                ).toString()) {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Alert'),
                                                                                    content: Text('Please submit Form I before proceeding with Form V.'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            } else {
                                                                              FFAppState().OkviFormVReff = getJsonField(
                                                                                (_model.apiResultFormV?.jsonBody ?? ''),
                                                                                r'''$''',
                                                                              );
                                                                              safeSetState(() {});

                                                                              context.pushNamed(FormVWidget.routeName);
                                                                            }

                                                                            safeSetState(() {});
                                                                          },
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        height: 50.0,
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.description,
                                                                                                    color: FlutterFlowTheme.of(context).isseued,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'ykdzp2g1' /* Form V - Total Sale & Rebate */,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                          font: GoogleFonts.interTight(
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                              Icon(
                                                                                                Icons.arrow_forward_ios,
                                                                                                color: FlutterFlowTheme.of(context).isseued,
                                                                                                size: 20.0,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 10.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            24.0)),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      10.0)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.apiResultFormVI = await OkviGroup
                                                                          .getClaimDataCall
                                                                          .call(
                                                                        type:
                                                                            'formvi',
                                                                        festival:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .GetClaimHeaderReff,
                                                                          r'''$.festivalName''',
                                                                        ).toString(),
                                                                        authToken:
                                                                            currentAuthenticationToken,
                                                                      );

                                                                      if ('No form found' ==
                                                                          getJsonField(
                                                                            (_model.apiResultFormVI?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString()) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Alert'),
                                                                              content: Text('Please submit Form I and Form V before proceeding with Form VI.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        FFAppState().OkviFormVI =
                                                                            getJsonField(
                                                                          (_model.apiResultFormVI?.jsonBody ??
                                                                              ''),
                                                                          r'''$''',
                                                                        );
                                                                        safeSetState(
                                                                            () {});

                                                                        context.pushNamed(
                                                                            FormViWidget.routeName);
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.description,
                                                                                              color: FlutterFlowTheme.of(context).isseued,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '6hjbosji' /* Form VI - Center-wise Breakdow... */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                    font: GoogleFonts.interTight(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.arrow_forward_ios,
                                                                                          color: FlutterFlowTheme.of(context).isseued,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.apiResultDeclarationCertificate = await OkviGroup
                                                                          .getClaimDataCall
                                                                          .call(
                                                                        type:
                                                                            'declaration',
                                                                        festival:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .GetClaimHeaderReff,
                                                                          r'''$.festivalName''',
                                                                        ).toString(),
                                                                        authToken:
                                                                            currentAuthenticationToken,
                                                                      );

                                                                      if ('No form found' ==
                                                                          getJsonField(
                                                                            (_model.apiResultDeclarationCertificate?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString()) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Alert'),
                                                                              content: Text('Please submit Form I, Form V, Form VI, the Declaration Certificate, and the Audit Certificate before proceeding with the Bank Deposit.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        FFAppState().OkviDeclarationCertificateReff =
                                                                            getJsonField(
                                                                          (_model.apiResultDeclarationCertificate?.jsonBody ??
                                                                              ''),
                                                                          r'''$''',
                                                                        );
                                                                        safeSetState(
                                                                            () {});

                                                                        context.pushNamed(
                                                                            DeclarationCertificateWidget.routeName);
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.description,
                                                                                              color: FlutterFlowTheme.of(context).isseued,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                '0fo7oj0o' /* Declaration Certificate */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                    font: GoogleFonts.interTight(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.arrow_forward_ios,
                                                                                          color: FlutterFlowTheme.of(context).isseued,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 24.0)),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.apiResultAuditCertificate = await OkviGroup
                                                                          .getClaimDataCall
                                                                          .call(
                                                                        type:
                                                                            'audit',
                                                                        festival:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .GetClaimHeaderReff,
                                                                          r'''$.festivalName''',
                                                                        ).toString(),
                                                                        authToken:
                                                                            currentAuthenticationToken,
                                                                      );

                                                                      if ('No form found' ==
                                                                          getJsonField(
                                                                            (_model.apiResultAuditCertificate?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString()) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Alert'),
                                                                              content: Text('Please submit Form I, Form V, Form VI, and the Declaration Certificate before proceeding with the Audit Certificate.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        FFAppState().OkviAuditCertificateReff =
                                                                            getJsonField(
                                                                          (_model.apiResultAuditCertificate?.jsonBody ??
                                                                              ''),
                                                                          r'''$''',
                                                                        );
                                                                        safeSetState(
                                                                            () {});

                                                                        context.pushNamed(
                                                                            FormViWidget.routeName);
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.description,
                                                                                              color: FlutterFlowTheme.of(context).isseued,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'edld5xkz' /* Audit Certificate */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                    font: GoogleFonts.interTight(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.arrow_forward_ios,
                                                                                          color: FlutterFlowTheme.of(context).isseued,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      _model.apiResultBankProof = await OkviGroup
                                                                          .getClaimDataCall
                                                                          .call(
                                                                        type:
                                                                            'bank',
                                                                        festival:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .GetClaimHeaderReff,
                                                                          r'''$.festivalName''',
                                                                        ).toString(),
                                                                        authToken:
                                                                            currentAuthenticationToken,
                                                                      );

                                                                      if ('No form found' ==
                                                                          getJsonField(
                                                                            (_model.apiResultBankProof?.jsonBody ??
                                                                                ''),
                                                                            r'''$.message''',
                                                                          ).toString()) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Alert'),
                                                                              content: Text('Please submit Form I, Form V, Form VI, the Declaration Certificate, and the Audit Certificate before proceeding with the Bank Deposit.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        FFAppState().OkviBankDepositProofReff =
                                                                            getJsonField(
                                                                          (_model.apiResultBankProof?.jsonBody ??
                                                                              ''),
                                                                          r'''$''',
                                                                        );
                                                                        safeSetState(
                                                                            () {});

                                                                        context.pushNamed(
                                                                            ProofOfBankDepositWidget.routeName);
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Expanded(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 50.0,
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.description,
                                                                                              color: FlutterFlowTheme.of(context).isseued,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'd9aov5zg' /* Bank Deposit Proof */,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                    font: GoogleFonts.interTight(
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                        Icon(
                                                                                          Icons.arrow_forward_ios,
                                                                                          color: FlutterFlowTheme.of(context).isseued,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 8.0)),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 24.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  24.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5mts4unt' /* Final Submition Document List */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'uhkaxn0k' /* Document Type */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'exgx0t1p' /* Festival */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '0jrk84lo' /* Submitted */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '0grcsxge' /* Level 1 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'kpd8vjds' /* Level 2 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'kyz9ccay' /* Level 3 */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                                child: Divider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                                child:
                                                                    Container(),
                                                              ),
                                                              if (getJsonField(
                                                                    FFAppState()
                                                                        .ClaimDataReff,
                                                                    r'''$.forms''',
                                                                  ) ==
                                                                  null)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          50.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .description,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size:
                                                                            48.0,
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'kjh0mvy9' /* No documents uploaded yet. */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final claimDataFormI =
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .ClaimDataReff,
                                                                    r'''$.forms.form1.retailSales''',
                                                                  ).toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .fromLTRB(
                                                                      0,
                                                                      10.0,
                                                                      0,
                                                                      0,
                                                                    ),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        claimDataFormI
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                5.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            claimDataFormIIndex) {
                                                                      final claimDataFormIItem =
                                                                          claimDataFormI[
                                                                              claimDataFormIIndex];
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                32.0,
                                                                                0.0,
                                                                                32.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'pb8wqulq' /* Form I */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      FFAppState().ClaimDataReff,
                                                                                      r'''$.forms.form1.festival''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      FFAppState().ClaimDataReff,
                                                                                      r'''$.forms.form1.createdAt''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
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
                                                                                        height: 24.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: () {
                                                                                            if (('1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString()) ||
                                                                                                ('2' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).greenTrans;
                                                                                            } else if (('0' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                ('0' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).yellowTrans;
                                                                                            } else if (('1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                ('0' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).greenTrans;
                                                                                            } else if (('-1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                ('0' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).redTrans;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).shadowCLr;
                                                                                            }
                                                                                          }(),
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                          child: Text(
                                                                                            '1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString()
                                                                                                ? 'Approved'
                                                                                                : () {
                                                                                                    if ('0' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.forms.form1.approval_status''',
                                                                                                        ).toString()) {
                                                                                                      return 'Pending';
                                                                                                    } else if ('1' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.forms.form1.approval_status''',
                                                                                                        ).toString()) {
                                                                                                      return 'Approved';
                                                                                                    } else {
                                                                                                      return 'Rejected';
                                                                                                    }
                                                                                                  }(),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                  ),
                                                                                                  color: '1' ==
                                                                                                          getJsonField(
                                                                                                            FFAppState().ClaimDataReff,
                                                                                                            r'''$.claim.approval_level''',
                                                                                                          ).toString()
                                                                                                      ? FlutterFlowTheme.of(context).approved
                                                                                                      : () {
                                                                                                          if ('0' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).pending;
                                                                                                          } else if ('1' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).approved;
                                                                                                          } else if ('-1' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).rejected;
                                                                                                          } else {
                                                                                                            return FlutterFlowTheme.of(context).secondaryText;
                                                                                                          }
                                                                                                        }(),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 24.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: () {
                                                                                            if ('2' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.claim.approval_level''',
                                                                                                ).toString()) {
                                                                                              return FlutterFlowTheme.of(context).greenTrans;
                                                                                            } else if (('0' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                (('1' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()) ||
                                                                                                    ('0' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()))) {
                                                                                              return FlutterFlowTheme.of(context).yellowTrans;
                                                                                            } else if (('1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                ('1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).greenTrans;
                                                                                            } else if (('-1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                (('1' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()) ||
                                                                                                    ('0' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()))) {
                                                                                              return FlutterFlowTheme.of(context).redTrans;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).shadowCLr;
                                                                                            }
                                                                                          }(),
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                          child: Text(
                                                                                            '2' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString()
                                                                                                ? 'Approved'
                                                                                                : () {
                                                                                                    if ('0' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.forms.form1.approval_status''',
                                                                                                        ).toString()) {
                                                                                                      return 'Pending';
                                                                                                    } else if ('1' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.forms.form1.approval_status''',
                                                                                                        ).toString()) {
                                                                                                      return 'Approved';
                                                                                                    } else {
                                                                                                      return 'Rejected';
                                                                                                    }
                                                                                                  }(),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                  ),
                                                                                                  color: '2' ==
                                                                                                          getJsonField(
                                                                                                            FFAppState().ClaimDataReff,
                                                                                                            r'''$.claim.approval_level''',
                                                                                                          ).toString()
                                                                                                      ? FlutterFlowTheme.of(context).approved
                                                                                                      : () {
                                                                                                          if ('0' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).pending;
                                                                                                          } else if ('1' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).approved;
                                                                                                          } else if ('-1' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).rejected;
                                                                                                          } else {
                                                                                                            return FlutterFlowTheme.of(context).secondaryText;
                                                                                                          }
                                                                                                        }(),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 24.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: () {
                                                                                            if (('2' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString()) &&
                                                                                                ('1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_status''',
                                                                                                    ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).greenTrans;
                                                                                            } else if (('0' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                (('2' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()) ||
                                                                                                    ('1' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()) ||
                                                                                                    ('0' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()))) {
                                                                                              return FlutterFlowTheme.of(context).yellowTrans;
                                                                                            } else if (('1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                ('2' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString())) {
                                                                                              return FlutterFlowTheme.of(context).greenTrans;
                                                                                            } else if (('-1' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.forms.form1.approval_status''',
                                                                                                    ).toString()) &&
                                                                                                (('2' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()) ||
                                                                                                    ('1' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()) ||
                                                                                                    ('0' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.claim.approval_level''',
                                                                                                        ).toString()))) {
                                                                                              return FlutterFlowTheme.of(context).redTrans;
                                                                                            } else {
                                                                                              return FlutterFlowTheme.of(context).shadowCLr;
                                                                                            }
                                                                                          }(),
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                          child: Text(
                                                                                            '3' ==
                                                                                                    getJsonField(
                                                                                                      FFAppState().ClaimDataReff,
                                                                                                      r'''$.claim.approval_level''',
                                                                                                    ).toString()
                                                                                                ? 'Approved'
                                                                                                : () {
                                                                                                    if ('0' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.forms.form1.approval_status''',
                                                                                                        ).toString()) {
                                                                                                      return 'Pending';
                                                                                                    } else if ('1' ==
                                                                                                        getJsonField(
                                                                                                          FFAppState().ClaimDataReff,
                                                                                                          r'''$.forms.form1.approval_status''',
                                                                                                        ).toString()) {
                                                                                                      return 'Approved';
                                                                                                    } else {
                                                                                                      return 'Rejected';
                                                                                                    }
                                                                                                  }(),
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                  ),
                                                                                                  color: '3' ==
                                                                                                          getJsonField(
                                                                                                            FFAppState().ClaimDataReff,
                                                                                                            r'''$.claim.approval_level''',
                                                                                                          ).toString()
                                                                                                      ? FlutterFlowTheme.of(context).approved
                                                                                                      : () {
                                                                                                          if ('0' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).pending;
                                                                                                          } else if ('1' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).approved;
                                                                                                          } else if ('-1' ==
                                                                                                              getJsonField(
                                                                                                                FFAppState().ClaimDataReff,
                                                                                                                r'''$.forms.form1.approval_status''',
                                                                                                              ).toString()) {
                                                                                                            return FlutterFlowTheme.of(context).rejected;
                                                                                                          } else {
                                                                                                            return FlutterFlowTheme.of(context).secondaryText;
                                                                                                          }
                                                                                                        }(),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                1.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            32.0,
                                                                            0.0,
                                                                            32.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '33blp18m' /* Form V */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().GetClaimHeaderReff,
                                                                              r'''$.festivalName''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().ClaimDataReff,
                                                                              r'''$.forms.formV.createdAt''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '1' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '1' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formV.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formV.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '1' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '2' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '2' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formV.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formV.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '2' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '3' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formV.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '3' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formV.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formV.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '3' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formV.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            32.0,
                                                                            0.0,
                                                                            32.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              '3xejheno' /* Form VI */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().GetClaimHeaderReff,
                                                                              r'''$.festivalName''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().ClaimDataReff,
                                                                              r'''$.forms.formVI.createdAt''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '1' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '1' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formVI.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formVI.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '1' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '2' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '2' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formVI.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formVI.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '2' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '3' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.formVI.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '3' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formVI.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.formVI.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '3' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.formVI.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            32.0,
                                                                            0.0,
                                                                            32.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'esh2me2h' /* Declaration Certificate */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().GetClaimHeaderReff,
                                                                              r'''$.festivalName''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().ClaimDataReff,
                                                                              r'''$.forms.declaration.createdAt''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [],
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            32.0,
                                                                            0.0,
                                                                            32.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'xz0ju84e' /* Audit Certificate */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().GetClaimHeaderReff,
                                                                              r'''$.festivalName''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().ClaimDataReff,
                                                                              r'''$.forms.audit.createdAt''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '1' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '1' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.audit.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.audit.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '1' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '2' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '2' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.audit.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.audit.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '2' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '3' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.audit.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '3' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.audit.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.audit.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '3' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.audit.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            32.0,
                                                                            0.0,
                                                                            32.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            FFLocalizations.of(context).getText(
                                                                              'loahkdrg' /* Bank Deposit Proof */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().GetClaimHeaderReff,
                                                                              r'''$.festivalName''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Text(
                                                                            getJsonField(
                                                                              FFAppState().ClaimDataReff,
                                                                              r'''$.forms.bank.createdAt''',
                                                                            ).toString(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '1' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '1' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.bank.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.bank.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '1' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '2' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '2' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.bank.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.bank.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '2' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Container(
                                                                                height: 24.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: '3' ==
                                                                                          getJsonField(
                                                                                            FFAppState().ClaimDataReff,
                                                                                            r'''$.claim.approval_level''',
                                                                                          ).toString()
                                                                                      ? FlutterFlowTheme.of(context).greenTrans
                                                                                      : () {
                                                                                          if ('0' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).yellowTrans;
                                                                                          } else if ('1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).greenTrans;
                                                                                          } else if ('-1' ==
                                                                                              getJsonField(
                                                                                                FFAppState().ClaimDataReff,
                                                                                                r'''$.forms.bank.approval_status''',
                                                                                              ).toString()) {
                                                                                            return FlutterFlowTheme.of(context).redTrans;
                                                                                          } else {
                                                                                            return FlutterFlowTheme.of(context).shadowCLr;
                                                                                          }
                                                                                        }(),
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                  child: Text(
                                                                                    '3' ==
                                                                                            getJsonField(
                                                                                              FFAppState().ClaimDataReff,
                                                                                              r'''$.claim.approval_level''',
                                                                                            ).toString()
                                                                                        ? 'Approved'
                                                                                        : () {
                                                                                            if ('0' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.bank.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Pending';
                                                                                            } else if ('1' ==
                                                                                                getJsonField(
                                                                                                  FFAppState().ClaimDataReff,
                                                                                                  r'''$.forms.bank.approval_status''',
                                                                                                ).toString()) {
                                                                                              return 'Approved';
                                                                                            } else {
                                                                                              return 'Rejected';
                                                                                            }
                                                                                          }(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                          ),
                                                                                          color: '3' ==
                                                                                                  getJsonField(
                                                                                                    FFAppState().ClaimDataReff,
                                                                                                    r'''$.claim.approval_level''',
                                                                                                  ).toString()
                                                                                              ? FlutterFlowTheme.of(context).approved
                                                                                              : () {
                                                                                                  if ('0' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).pending;
                                                                                                  } else if ('1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).approved;
                                                                                                  } else if ('-1' ==
                                                                                                      getJsonField(
                                                                                                        FFAppState().ClaimDataReff,
                                                                                                        r'''$.forms.bank.approval_status''',
                                                                                                      ).toString()) {
                                                                                                    return FlutterFlowTheme.of(context).rejected;
                                                                                                  } else {
                                                                                                    return FlutterFlowTheme.of(context).secondaryText;
                                                                                                  }
                                                                                                }(),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                          if ('submitted' !=
                                                              getJsonField(
                                                                FFAppState()
                                                                    .ClaimDataReff,
                                                                r'''$.claim.status''',
                                                              ).toString())
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Flexible(
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      _model.apiResultlmtFinalSumbition = await OkviGroup
                                                                          .finalSubmitCall
                                                                          .call(
                                                                        festivalName:
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .GetClaimHeaderReff,
                                                                          r'''$.festivalName''',
                                                                        ).toString(),
                                                                        authToken:
                                                                            currentAuthenticationToken,
                                                                      );

                                                                      if ((_model
                                                                              .apiResultlmtFinalSumbition
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Form submitted successfully.',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        ScaffoldMessenger.of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content:
                                                                                Text(
                                                                              'Form not submitted. Please try again.',
                                                                              style: TextStyle(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                            ),
                                                                            duration:
                                                                                Duration(milliseconds: 4000),
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).rejected,
                                                                          ),
                                                                        );
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ydi8noro' /* Final Submit */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          44.0,
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .isseued,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                      elevation:
                                                                          0.0,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 20.0)),
                                                            ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  24.0,
                                                                  24.0,
                                                                  24.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'jg4aawb5' /* Submitted Documents */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.interTight(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '4asctogh' /* Festival */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '5utn16i4' /* Submitted date */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          '7yao0s4o' /* Approved Date */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'soiqzwxi' /* Status */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                                child: Divider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        0.0),
                                                                child:
                                                                    Container(),
                                                              ),
                                                              if (getJsonField(
                                                                    FFAppState()
                                                                        .OkviSumbitedDocuments,
                                                                    r'''$.claims''',
                                                                  ) ==
                                                                  null)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          50.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .description,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        size:
                                                                            48.0,
                                                                      ),
                                                                      Text(
                                                                        FFLocalizations.of(context)
                                                                            .getText(
                                                                          'i7wfdbiw' /* No documents uploaded yet. */,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            16.0)),
                                                                  ),
                                                                ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final claimDataFormI =
                                                                      getJsonField(
                                                                    FFAppState()
                                                                        .OkviSumbitedDocuments,
                                                                    r'''$.claims''',
                                                                  ).toList();

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .fromLTRB(
                                                                      0,
                                                                      10.0,
                                                                      0,
                                                                      0,
                                                                    ),
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        claimDataFormI
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                5.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            claimDataFormIIndex) {
                                                                      final claimDataFormIItem =
                                                                          claimDataFormI[
                                                                              claimDataFormIIndex];
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                32.0,
                                                                                0.0,
                                                                                32.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      claimDataFormIItem,
                                                                                      r'''$.festivalName''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      claimDataFormIItem,
                                                                                      r'''$.submittedAt''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      claimDataFormIItem,
                                                                                      r'''$.updatedAt''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    'submitted' ==
                                                                                            getJsonField(
                                                                                              claimDataFormIItem,
                                                                                              r'''$.status''',
                                                                                            ).toString()
                                                                                        ? 'Pending'
                                                                                        : getJsonField(
                                                                                            claimDataFormIItem,
                                                                                            r'''$.status''',
                                                                                          ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 10.0)),
                                                                            ),
                                                                          ),
                                                                          Divider(
                                                                            thickness:
                                                                                1.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 8.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 16.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]
                                            .divide(SizedBox(height: 16.0))
                                            .addToEnd(SizedBox(height: 16.0)),
                                      ),
                                    ),
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
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ))
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.asset(
                                          'assets/images/medium-logo.png',
                                          width: 60.0,
                                          height: 60.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        scaffoldKey.currentState!.openDrawer();
                                      },
                                      child: Icon(
                                        Icons.menu_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 32.0,
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
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 2.0),
                                    child: Container(
                                      width: double.infinity,
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
                                              0.0,
                                            ),
                                            spreadRadius: 2.0,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 16.0, 12.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4nqb13j5' /* Settings */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 28.0,
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Icon(
                                                    Icons.search_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 32.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: badges.Badge(
                                                    badgeContent: Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'q6whtpyl' /* 1 */,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .titleSmall
                                                          .override(
                                                            font: GoogleFonts
                                                                .interTight(
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                            ),
                                                            color: Colors.white,
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                    showBadge: true,
                                                    shape: badges
                                                        .BadgeShape.circle,
                                                    badgeColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    elevation: 4.0,
                                                    padding:
                                                        EdgeInsets.all(4.0),
                                                    position: badges
                                                        .BadgePosition.topEnd(),
                                                    animationType: badges
                                                        .BadgeAnimationType
                                                        .scale,
                                                    toAnimate: true,
                                                    child: Icon(
                                                      Icons
                                                          .circle_notifications_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 32.0,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.more_vert_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 32.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'txcpsp7n' /* General Settings */,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                                fontSize: 24.0,
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
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Flexible(
                                                    child: Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'r9jb0hdt' /* Update your profile and how pe... */,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
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
                                                                  fontSize:
                                                                      14.0,
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
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'gxv8u8ls' /* Profile details */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          fontSize: 18.0,
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
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '3ijhz03m' /* Edit */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          fontSize: 16.0,
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
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'zz8h3rm4' /* First name */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController1,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode1,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'txw9av7f' /* Amos */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  validator: _model
                                                                      .textController1Validator
                                                                      .asValidator(
                                                                          context),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'bxwmmej1' /* Last name */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .textController2,
                                                                  focusNode: _model
                                                                      .textFieldFocusNode2,
                                                                  autofocus:
                                                                      true,
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    labelStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '31iiledj' /* Ndeto */,
                                                                    ),
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  validator: _model
                                                                      .textController2Validator
                                                                      .asValidator(
                                                                          context),
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'b6owt98y' /* Email address */,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController3,
                                                                focusNode: _model
                                                                    .textFieldFocusNode3,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'kz1zgk06' /* anzacloud@gmail.com */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
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
                                                                validator: _model
                                                                    .textController3Validator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '4bacb6fe' /* Street address */,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController4,
                                                                focusNode: _model
                                                                    .textFieldFocusNode4,
                                                                autofocus: true,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  hintText: FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'x25spfi3' /* 1 Hackerway, SF */,
                                                                  ),
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          2.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
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
                                                                validator: _model
                                                                    .textController4Validator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 32.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      'lgki2hl3' /* Languages */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          fontSize: 18.0,
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
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child:
                                                                Image.network(
                                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png',
                                                              width: 20.0,
                                                              height: 20.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            '93noss4v' /* English */,
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
                                                    FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        '033rwjih' /* Change */,
                                                      ),
                                                      options: FFButtonOptions(
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .interTight(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Divider(
                                                            thickness: 2.0,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                      '90y3b39c' /* App appearance */,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
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
                                                          fontSize: 18.0,
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
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child:
                                                            FlutterFlowRadioButton(
                                                          options: [
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'tzx02qwr' /* Light mode */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'fo04vnht' /* Dark mode */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '73dqkboy' /* System preference */,
                                                            )
                                                          ].toList(),
                                                          onChanged: (val) =>
                                                              safeSetState(
                                                                  () {}),
                                                          controller: _model
                                                                  .radioButtonValueController ??=
                                                              FormFieldController<
                                                                      String>(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                            'bjcc8w5p' /* Dark mode */,
                                                          )),
                                                          optionHeight: 32.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .override(
                                                                    font: GoogleFonts
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
                                                          textPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      32.0,
                                                                      0.0),
                                                          buttonPosition:
                                                              RadioButtonPosition
                                                                  .left,
                                                          direction:
                                                              Axis.horizontal,
                                                          radioButtonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          inactiveRadioButtonColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryText,
                                                          toggleable: false,
                                                          horizontalAlignment:
                                                              WrapAlignment
                                                                  .start,
                                                          verticalAlignment:
                                                              WrapCrossAlignment
                                                                  .start,
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 32.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'bw6sefhx' /* Help and Support */,
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
                                                                  fontSize:
                                                                      18.0,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'tu5qpxyh' /* Looking for info about us? */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'rtf8zy7w' /* Learn more */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '0m0imkfo' /* Tips on how to use Pandora? */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          14.0,
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
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'la7twy1w' /* Learn more */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  32.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'gdp9ycpa' /* Need something else? */,
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
                                                                  fontSize:
                                                                      18.0,
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
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
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
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .support_agent_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1qmvk6ue' /* Contact support */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .solidQuestionCircle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '1gisqr2h' /* FAQs */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
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
            ],
          ),
        ),
      ),
    );
  }
}
