import '/backend/api_requests/api_calls.dart';
import '/components/mainwebnav_okvi/mainwebnav_okvi_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'documents_model.dart';
export 'documents_model.dart';

class DocumentsWidget extends StatefulWidget {
  const DocumentsWidget({super.key});

  static String routeName = 'Documents';
  static String routePath = '/documents';

  @override
  State<DocumentsWidget> createState() => _DocumentsWidgetState();
}

class _DocumentsWidgetState extends State<DocumentsWidget> {
  late DocumentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocumentsModel());

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
                        child: MainwebnavOkviWidget(),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'pasw5y9b' /* Claim Documents */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                            ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
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
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              if (responsiveVisibility(
                                                                context:
                                                                    context,
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
                                                                    'd24rsypd' /* Overview */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displaySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .displaySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .displaySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                            ],
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
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                '5vry2f9o' /* A- */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'fuydywwt' /* A */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'tip057of' /* A+ */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 120.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ),
                                                          child:
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                            controller: _model
                                                                    .dropDownValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    null),
                                                            options: [
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'u2l4sm6l' /* Oriya */,
                                                              ),
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'eqp1p5ei' /* English */,
                                                              )
                                                            ],
                                                            onChanged: (val) =>
                                                                safeSetState(() =>
                                                                    _model.dropDownValue =
                                                                        val),
                                                            width: 200.0,
                                                            height: 40.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
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
                                                            hintText:
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                              'yed4zh7r' /* Language */,
                                                            ),
                                                            icon: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 24.0,
                                                            ),
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            elevation: 2.0,
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderWidth: 0.0,
                                                            borderRadius: 8.0,
                                                            margin:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            hidesUnderline:
                                                                true,
                                                            isOverButton: false,
                                                            isSearchable: false,
                                                            isMultiSelect:
                                                                false,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                12.0,
                                                                16.0,
                                                                12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x55E0E3E7),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/govt-of-odisha-by-rupesh-logo-BC6FE21B9A-seeklogo.com.png',
                                                                width: 44.0,
                                                                height: 44.0,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '06dafdv4' /* OKVI */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodyLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
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
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'dxcw47ew' /* admin@gmail.com */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
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
                                          if (responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                constraints: BoxConstraints(
                                                  maxWidth: 1370.0,
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '074gx2te' /* Card Header */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.interTight(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ocugwkxn' /* Create tables and ui elements ... */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
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
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: () {
                                                              print(
                                                                  'Button pressed ...');
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'fwmuamrw' /* Add New */,
                                                            ),
                                                            icon: Icon(
                                                              Icons.add_rounded,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .interTight(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 2.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
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
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
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
                                                            padding:
                                                                EdgeInsetsDirectional
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
                                                                  phone: false,
                                                                  tablet: false,
                                                                ))
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        'aiezd2rt' /* Work Type */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 4,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'vhfely0i' /* Assigned User */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                if (responsiveVisibility(
                                                                  context:
                                                                      context,
                                                                  phone: false,
                                                                ))
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Text(
                                                                      FFLocalizations.of(
                                                                              context)
                                                                          .getText(
                                                                        '8npqr2j1' /* Contract Amount */,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'k1kv0n5r' /* Status */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child: Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'sa1viy13' /* Actions */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      ListView(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'hxnieqnm' /* Design Work */,
                                                                          ),
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
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '2m9m9iwk' /* Randy Peterson */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ea27836f' /* Business Name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'wkc8v6gq' /* $2,100 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'wni8bk84' /* Paid */,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                44.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'wf737msb' /* Design Work */,
                                                                          ),
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
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  'https://images.unsplash.com/photo-1474176857210-7287d38d27c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'c55fzk64' /* Randy Peterson */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'udoafarf' /* Business Name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '4sgs5gdc' /* $2,100 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'zrhsnkxa' /* Paid */,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                44.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'g3frqiqu' /* Design Work */,
                                                                          ),
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
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  'https://images.unsplash.com/photo-1474176857210-7287d38d27c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '7zoz2qm8' /* Randy Peterson */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'qba1issw' /* Business Name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'yt4jmj4h' /* $2,100 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'je9qkj0r' /* Paid */,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                44.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '0igo2i3j' /* Design Work */,
                                                                          ),
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
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  'https://images.unsplash.com/photo-1474176857210-7287d38d27c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fHVzZXJzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'warbg9h2' /* Randy Peterson */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'sk0v6zky' /* Business Name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '85qwz7tc' /* $2,100 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent2,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                              ),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'uf1k613u' /* Paid */,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                44.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'tzpfd0mu' /* Design Work */,
                                                                          ),
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
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '7hfzy2xy' /* Randy Peterson */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'aa8o0ogh' /* Business Name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'b5dcjo63' /* $2,100 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'l46lsxzl' /* Pending */,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                44.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            '3wt6dnc1' /* Design Work */,
                                                                          ),
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
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '0r19myvc' /* Randy Peterson */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'oqu38zm8' /* Business Name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'fhsnee10' /* $2,100 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'b90j76ul' /* Pending */,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                44.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
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
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        1.0),
                                                            child: Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    offset:
                                                                        Offset(
                                                                      0.0,
                                                                      1.0,
                                                                    ),
                                                                  )
                                                                ],
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
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'lm89mqja' /* Design Work */,
                                                                          ),
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
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            12.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(40.0),
                                                                                child: Image.network(
                                                                                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fHByb2ZpbGV8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60',
                                                                                  width: 32.0,
                                                                                  height: 32.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        '3kfz83y9' /* Randy Peterson */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '4mof57sz' /* Business Name */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                    if (responsiveVisibility(
                                                                      context:
                                                                          context,
                                                                      phone:
                                                                          false,
                                                                    ))
                                                                      Expanded(
                                                                        flex: 2,
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'h22irv08' /* $2,100 */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.interTight(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            height:
                                                                                32.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(40.0),
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'f56ngq7f' /* Pending */,
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          FlutterFlowIconButton(
                                                                            borderColor:
                                                                                Colors.transparent,
                                                                            borderRadius:
                                                                                30.0,
                                                                            borderWidth:
                                                                                1.0,
                                                                            buttonSize:
                                                                                44.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.more_vert,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 20.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
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
                                            ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(16.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.55,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            16.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      FFLocalizations.of(context).getText(
                                                                                        'lt2yliec' /* List of Documents to be Filled... */,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            fontSize: 20.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Divider(
                                                                                            thickness: 1.0,
                                                                                            color: FlutterFlowTheme.of(context).alternate,
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
                                                                    ),
                                                                    Form(
                                                                      key: _model
                                                                          .formKey,
                                                                      autovalidateMode:
                                                                          AutovalidateMode
                                                                              .disabled,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            16.0),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'ra8m7e4y' /* Festive Name */,
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: FlutterFlowDropDown<String>(
                                                                                                  controller: _model.festiveNameValueController1 ??= FormFieldController<String>(null),
                                                                                                  options: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '8v8kbnz0' /* 0 */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '4wamci7w' /* 1 */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.festiveNameValue1 = val),
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
                                                                                                    'q170vzul' /* Select FestiveName */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
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
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              FFLocalizations.of(context).getText(
                                                                                                'mm6k7kbo' /* Document List */,
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: FlutterFlowDropDown<String>(
                                                                                                  controller: _model.documentListValueController ??= FormFieldController<String>(null),
                                                                                                  options: [
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'wufuoatp' /* Select Document */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'ogk6scvc' /* FORM V */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'n5icdzfj' /* FORM VI */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      '3b1r8jy1' /* Declaration Certificate */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'he3wgzc9' /* Audit Certificate from Charter... */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'ukw8p5mh' /* Proof of Bank Deposit of Sale ... */,
                                                                                                    ),
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'napswwlc' /* Opening Stock Report */,
                                                                                                    )
                                                                                                  ],
                                                                                                  onChanged: (val) => safeSetState(() => _model.documentListValue = val),
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
                                                                                                    'xionw5lr' /* Select Document */,
                                                                                                  ),
                                                                                                  icon: Icon(
                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  elevation: 2.0,
                                                                                                  borderColor: FlutterFlowTheme.of(context).alternate,
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
                                                                                      ),
                                                                                    ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ))
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    FFLocalizations.of(context).getText(
                                                                                                      'oousrau0' /* Upload */,
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
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: 100.0,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () {
                                                                                                          print('Button pressed ...');
                                                                                                        },
                                                                                                        text: FFLocalizations.of(context).getText(
                                                                                                          'bnle76hz' /* Upload File */,
                                                                                                        ),
                                                                                                        options: FFButtonOptions(
                                                                                                          height: 30.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                font: GoogleFonts.interTight(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                ),
                                                                                                                color: Colors.white,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                              ),
                                                                                                          elevation: 0.0,
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            child: Image.network(
                                                                                              'https://picsum.photos/seed/811/600',
                                                                                              width: 100.0,
                                                                                              height: 70.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                  ].divide(SizedBox(width: 20.0)),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              16.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.end,
                                                                        children:
                                                                            [
                                                                          FFButtonWidget(
                                                                            onPressed:
                                                                                () {
                                                                              print('Button pressed ...');
                                                                            },
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'vfzosqod' /* Submit */,
                                                                            ),
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    font: GoogleFonts.interTight(
                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 16.0)),
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
                                            ),
                                          Expanded(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ))
                                                  Expanded(
                                                    flex: 12,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 1270.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            primary: false,
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
                                                                              '4nixzrff' /* Submitted Documents for Rebate... */,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                  font: GoogleFonts.interTight(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            FlutterFlowDropDown<String>(
                                                                              controller: _model.financialYearValueController1 ??= FormFieldController<String>(null),
                                                                              options: [
                                                                                FFLocalizations.of(context).getText(
                                                                                  'yz932xm9' /* 0 */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  'ulftl277' /* 1 */,
                                                                                )
                                                                              ],
                                                                              onChanged: (val) => safeSetState(() => _model.financialYearValue1 = val),
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
                                                                                'guonw2an' /* Select Document */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              hidesUnderline: true,
                                                                              isOverButton: false,
                                                                              isSearchable: false,
                                                                              isMultiSelect: false,
                                                                            ),
                                                                            FlutterFlowDropDown<String>(
                                                                              controller: _model.festiveNameValueController2 ??= FormFieldController<String>(null),
                                                                              options: [
                                                                                FFLocalizations.of(context).getText(
                                                                                  '8zw7j5fn' /* 0 */,
                                                                                ),
                                                                                FFLocalizations.of(context).getText(
                                                                                  'qzl3aid0' /* 1 */,
                                                                                )
                                                                              ],
                                                                              onChanged: (val) => safeSetState(() => _model.festiveNameValue2 = val),
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
                                                                                'hqsp3skd' /* Select Festive Name */,
                                                                              ),
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                              hidesUnderline: true,
                                                                              isOverButton: false,
                                                                              isSearchable: false,
                                                                              isMultiSelect: false,
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                        FFButtonWidget(
                                                                          onPressed:
                                                                              () {
                                                                            print('Button pressed ...');
                                                                          },
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'f84tcny2' /* Clear Filter */,
                                                                          ),
                                                                          options:
                                                                              FFButtonOptions(
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).error,
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
                                                                            elevation:
                                                                                0.0,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                          ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 10.0)),
                                                                    ),
                                                                  ],
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
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
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
                                                                              flex: 2,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '2fhqm586' /* Sl. No */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
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
                                                                                'j3q2e7d7' /* Financial Year */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
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
                                                                              flex: 2,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'qiccr79c' /* Festive Name */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
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
                                                                              flex: 2,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '1lu5xngi' /* Spell Start Date */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                      font: GoogleFonts.inter(
                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
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
                                                                                'ks1phnf2' /* Spell End Date */,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
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
                                                                                'e6f6sv65' /* Actions */,
                                                                              ),
                                                                              textAlign: TextAlign.end,
                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                    font: GoogleFonts.inter(
                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                ListView(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  children: [
                                                                    Padding(
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
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      'y8qridvm' /* 1 */,
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
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'b6fuw33m' /* 15/04/2024 */,
                                                                                                ),
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
                                                                                            ],
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
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'fyd07ioz' /* Tapan Mohanty */,
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
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '5wtvfv7x' /* 15/04/2024 */,
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
                                                                                ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '6ecdo1m4' /* 15/04/2024 */,
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
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'rk9o2l85' /* View */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      '7bd3tpzz' /* 2 */,
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
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'bbas4zg3' /* 15/04/2024 */,
                                                                                                ),
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
                                                                                            ],
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
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'yh1mgigz' /* Chittaranjan Panda */,
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
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'uisd49jh' /* 15/04/2024 */,
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
                                                                                ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'i46h342h' /* 15/04/2024 */,
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
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'xq11e53l' /* View */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      'vonrc05f' /* 3 */,
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
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '8y5enjar' /* 15/04/2024 */,
                                                                                                ),
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
                                                                                            ],
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
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '314tvikc' /* Ajay Kumar Mohapatra */,
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
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'zlv8ibzs' /* 15/04/2024 */,
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
                                                                                ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '2yr5gmal' /* 15/04/2024 */,
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
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'hwjsf1xy' /* View */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      '5rvnqaae' /* 4 */,
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
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'fesxbf1p' /* 15/04/2024 */,
                                                                                                ),
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
                                                                                            ],
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
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      't63nj6p8' /* Tapas Sahu */,
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
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'u28athnu' /* 15/04/2024 */,
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
                                                                                ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ynxf4ioc' /* 15/04/2024 */,
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
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '99ssfdy1' /* View */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      'mh541pyq' /* 5 */,
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
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '5bziufjy' /* 15/04/2024 */,
                                                                                                ),
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
                                                                                            ],
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
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'xqe9i0l7' /* Rajkishore Das */,
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
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '8nljz1s8' /* 15/04/2024 */,
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
                                                                                ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'gd9jmqap' /* 15/04/2024 */,
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
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'pt4edi56' /* View */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      'smzf1tcr' /* 6 */,
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
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'vf4czavz' /* 15/04/2024 */,
                                                                                                ),
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
                                                                                            ],
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
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'xq68jtiv' /* Rajkishore Das */,
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
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'dvc9lpz3' /* 15/04/2024 */,
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
                                                                                ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            '60rtgftg' /* 15/04/2024 */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                font: GoogleFonts.interTight(
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                ),
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.normal,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
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
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        '9bh01sgc' /* View */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                              16.0,
                                                                              10.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                      '0k2q95hs' /* 7 */,
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
                                                                                flex: 4,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 12.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'mfqzp0uv' /* 15/04/2024 */,
                                                                                                ),
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
                                                                                            ],
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
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '0v7whfx9' /* Rajkishore Das */,
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
                                                                                ),
                                                                              if (responsiveVisibility(
                                                                                context: context,
                                                                                phone: false,
                                                                              ))
                                                                                Expanded(
                                                                                  flex: 2,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'ca7qdqib' /* 15/04/2024 */,
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
                                                                                ),
                                                                              Expanded(
                                                                                flex: 2,
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                    ))
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'xphvz9yp' /* 15/04/2024 */,
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
                                                                                    FFButtonWidget(
                                                                                      onPressed: () {
                                                                                        print('Button pressed ...');
                                                                                      },
                                                                                      text: FFLocalizations.of(context).getText(
                                                                                        'ieb8ch8p' /* View */,
                                                                                      ),
                                                                                      options: FFButtonOptions(
                                                                                        height: 40.0,
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              font: GoogleFonts.interTight(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                              ),
                                                                                              color: Colors.white,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                            ),
                                                                                        elevation: 0.0,
                                                                                        borderRadius: BorderRadius.circular(8.0),
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
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ]
                                                  .divide(SizedBox(width: 16.0))
                                                  .addToStart(
                                                      SizedBox(width: 16.0)),
                                            ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      phone: false,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                    ))
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: MsmeOsfcGroup
                                                                .getAllOTSFormsCall
                                                                .call(),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      valueColor:
                                                                          AlwaysStoppedAnimation<
                                                                              Color>(
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final cardTable6GetAllOTSFormsResponse =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 600.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  maxWidth:
                                                                      1270.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 1.0,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
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
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                          child: Text(
                                                                                            FFLocalizations.of(context).getText(
                                                                                              'uhdk3izl' /* Submitted Documents for Rebate... */,
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                  font: GoogleFonts.interTight(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            FlutterFlowDropDown<String>(
                                                                                              controller: _model.financialYearValueController2 ??= FormFieldController<String>(null),
                                                                                              options: [
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'elkr39rh' /* 0 */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'j005fa8q' /* 1 */,
                                                                                                )
                                                                                              ],
                                                                                              onChanged: (val) => safeSetState(() => _model.financialYearValue2 = val),
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
                                                                                                'a6pcmp2g' /* Select Document */,
                                                                                              ),
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                              borderWidth: 0.0,
                                                                                              borderRadius: 8.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                              hidesUnderline: true,
                                                                                              isOverButton: false,
                                                                                              isSearchable: false,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                            FlutterFlowDropDown<String>(
                                                                                              controller: _model.festiveNameValueController3 ??= FormFieldController<String>(null),
                                                                                              options: [
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  'rbyawys5' /* 0 */,
                                                                                                ),
                                                                                                FFLocalizations.of(context).getText(
                                                                                                  '59mn87ek' /* 1 */,
                                                                                                )
                                                                                              ],
                                                                                              onChanged: (val) => safeSetState(() => _model.festiveNameValue3 = val),
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
                                                                                                'le2cz5m6' /* Select Festive Name */,
                                                                                              ),
                                                                                              icon: Icon(
                                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              elevation: 2.0,
                                                                                              borderColor: FlutterFlowTheme.of(context).alternate,
                                                                                              borderWidth: 0.0,
                                                                                              borderRadius: 8.0,
                                                                                              margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                              hidesUnderline: true,
                                                                                              isOverButton: false,
                                                                                              isSearchable: false,
                                                                                              isMultiSelect: false,
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () {
                                                                                            print('Button pressed ...');
                                                                                          },
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            '7qpyi3zp' /* Clear Filter */,
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
                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              20.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            height:
                                                                                200.0,
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final submittedDocumentsforRebateProposal = getJsonField(
                                                                                  cardTable6GetAllOTSFormsResponse.jsonBody,
                                                                                  r'''$''',
                                                                                ).toList();

                                                                                return FlutterFlowDataTable<dynamic>(
                                                                                  controller: _model.paginatedDataTableController,
                                                                                  data: submittedDocumentsforRebateProposal,
                                                                                  columnsBuilder: (onSortChanged) => [
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'x7u34d0i' /* Sl. No */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'f06268ad' /* Festive Name */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'cux0u249' /* Documents */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'zhnxs14g' /* Attachment */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    DataColumn2(
                                                                                      label: DefaultTextStyle.merge(
                                                                                        softWrap: true,
                                                                                        child: Text(
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'u63nmp7w' /* Status */,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                  dataRowBuilder: (submittedDocumentsforRebateProposalItem, submittedDocumentsforRebateProposalIndex, selected, onSelectChanged) => DataRow(
                                                                                    color: WidgetStateProperty.all(
                                                                                      submittedDocumentsforRebateProposalIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                                    ),
                                                                                    cells: [
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'f83qhspy' /* 1 */,
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
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          '55nngiec' /* Randy Peterson  */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FontWeight.bold,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'kdpmufnq' /* FORM I */,
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
                                                                                      FFButtonWidget(
                                                                                        onPressed: () {
                                                                                          print('Button pressed ...');
                                                                                        },
                                                                                        text: FFLocalizations.of(context).getText(
                                                                                          'kn8i01mp' /* Download PDF */,
                                                                                        ),
                                                                                        options: FFButtonOptions(
                                                                                          height: 30.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).error,
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
                                                                                      Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'cj32ubty' /*  */,
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
                                                                                    ].map((c) => DataCell(c)).toList(),
                                                                                  ),
                                                                                  paginated: true,
                                                                                  selectable: false,
                                                                                  hidePaginator: false,
                                                                                  showFirstLastButtons: true,
                                                                                  headingRowHeight: 56.0,
                                                                                  dataRowHeight: 80.0,
                                                                                  columnSpacing: 20.0,
                                                                                  headingRowColor: Color(0xFFABF9F0),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  addHorizontalDivider: true,
                                                                                  addTopAndBottomDivider: false,
                                                                                  hideDefaultHorizontalDivider: true,
                                                                                  horizontalDividerColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  horizontalDividerThickness: 1.0,
                                                                                  addVerticalDivider: false,
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                  ]
                                                      .divide(
                                                          SizedBox(width: 16.0))
                                                      .addToStart(SizedBox(
                                                          width: 16.0)),
                                                ),
                                              ),
                                            ),
                                        ].addToEnd(SizedBox(height: 24.0)),
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
                                                'gsmdape8' /* Settings */,
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
                                                        'i29h73x8' /* 1 */,
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
                                                        'gnw4zuan' /* General Settings */,
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
                                                          'ocmlyf0n' /* Update your profile and how pe... */,
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
                                                      'tmal12st' /* Profile details */,
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
                                                      '72t0zoil' /* Edit */,
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
                                                                'v2prcefh' /* First name */,
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
                                                                      '8n7h9eiw' /* Amos */,
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
                                                                'm3g24joi' /* Last name */,
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
                                                                      '51dx20jp' /* Ndeto */,
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
                                                              'gd0rroic' /* Email address */,
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
                                                                    'vfsno106' /* anzacloud@gmail.com */,
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
                                                              '49o60kmu' /* Street address */,
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
                                                                    'ckev7hr9' /* 1 Hackerway, SF */,
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
                                                      'rttzpxgi' /* Languages */,
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
                                                            'zufks7y7' /* English */,
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
                                                        'rfupqazh' /* Change */,
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
                                                      '77rml2h2' /* App appearance */,
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
                                                              'ssm05l9r' /* Light mode */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'itijb3bk' /* Dark mode */,
                                                            ),
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'wsybmyty' /* System preference */,
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
                                                            'ma35phjg' /* Dark mode */,
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
                                                              'y9w4lz11' /* Help and Support */,
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
                                                                  'e31mwxaf' /* Looking for info about us? */,
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
                                                                    'kr698rf3' /* Learn more */,
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
                                                                  'f2v9k9b8' /* Tips on how to use Pandora? */,
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
                                                                    'nphsaxk8' /* Learn more */,
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
                                                              'o7pshqua' /* Need something else? */,
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
                                                                      'z6ig8wii' /* Contact support */,
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
                                                                        '9qpuqi9v' /* FAQs */,
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF201B47),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ddq16isu' /* © 2025 Directorate of Industri... */,
                                    ),
                                    textAlign: TextAlign.center,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
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
                                if (responsiveVisibility(
                                  context: context,
                                  desktop: false,
                                ))
                                  Flexible(
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'eq31yhqk' /* Design & Developed by Qwegle, ... */,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
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
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                          ))
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'cgw6bj1w' /* Design & Developed by Qwegle, ... */,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
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
                        ],
                      ),
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
