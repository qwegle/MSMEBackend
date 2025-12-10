import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'upload_ack_model.dart';
export 'upload_ack_model.dart';

class UploadAckWidget extends StatefulWidget {
  const UploadAckWidget({super.key});

  @override
  State<UploadAckWidget> createState() => _UploadAckWidgetState();
}

class _UploadAckWidgetState extends State<UploadAckWidget> {
  late UploadAckModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UploadAckModel());

    _model.loanNumberUploadTextController ??= TextEditingController();
    _model.loanNumberUploadFocusNode ??= FocusNode();

    _model.receivingOfficerNameTextController ??= TextEditingController();
    _model.receivingOfficerNameFocusNode ??= FocusNode();

    _model.dipositAmountUploadTextController ??= TextEditingController();
    _model.dipositAmountUploadFocusNode ??= FocusNode();

    _model.rACAMountTextController ??= TextEditingController();
    _model.rACAMountFocusNode ??= FocusNode();

    _model.oSFCMRNoTextController ??= TextEditingController();
    _model.oSFCMRNoFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).height * 0.8,
            constraints: BoxConstraints(
              maxWidth: 750.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 2.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        primary: false,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          'xe3nf5c4' /* Upload Acknowledgement Slip */,
                                        ),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderRadius: 8.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).isseued,
                                      icon: Icon(
                                        Icons.close,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model
                                                .loanNumberUploadTextController,
                                            focusNode: _model
                                                .loanNumberUploadFocusNode,
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText:
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                'vuz2mkqa' /* Enter Loan number... */,
                                              ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
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
                                            keyboardType: TextInputType.number,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .loanNumberUploadTextControllerValidator
                                                .asValidator(context),
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[0-9]'))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'c5n7mqoj' /* Receiving Officer Name */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .receivingOfficerNameTextController,
                                                        focusNode: _model
                                                            .receivingOfficerNameFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
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
                                                          hintStyle:
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
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
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
                                                        keyboardType:
                                                            TextInputType.name,
                                                        validator: _model
                                                            .receivingOfficerNameTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[a-zA-Z]'))
                                                        ],
                                                      ),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'jop5js86' /* SIgneture Date */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 49.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    10.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .isseued,
                                                              icon: Icon(
                                                                Icons
                                                                    .date_range_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final _datePicked1Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      getCurrentTimestamp,
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (_datePicked1Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked1 =
                                                                        DateTime(
                                                                      _datePicked1Date
                                                                          .year,
                                                                      _datePicked1Date
                                                                          .month,
                                                                      _datePicked1Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                } else if (_model
                                                                        .datePicked1 !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked1 =
                                                                        getCurrentTimestamp;
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "yyyy-MM-dd",
                                                                  _model
                                                                      .datePicked1,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          15.0,
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
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'url67djj' /* Deposit Amount */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .dipositAmountUploadTextController,
                                                        focusNode: _model
                                                            .dipositAmountUploadFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
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
                                                          hintStyle:
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
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
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
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .dipositAmountUploadTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '2b9oxzha' /* RAC Amount */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .rACAMountTextController,
                                                        focusNode: _model
                                                            .rACAMountFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
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
                                                          hintStyle:
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
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
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
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        validator: _model
                                                            .rACAMountTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[0-9]'))
                                                        ],
                                                      ),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '26bh6egm' /* RAC Date */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 49.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    10.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .isseued,
                                                              icon: Icon(
                                                                Icons
                                                                    .date_range_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final _datePicked2Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      getCurrentTimestamp,
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (_datePicked2Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked2 =
                                                                        DateTime(
                                                                      _datePicked2Date
                                                                          .year,
                                                                      _datePicked2Date
                                                                          .month,
                                                                      _datePicked2Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                } else if (_model
                                                                        .datePicked2 !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked2 =
                                                                        getCurrentTimestamp;
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "yyyy-MM-dd",
                                                                  _model
                                                                      .datePicked2,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          15.0,
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
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'a7bj631z' /* Deposit Type */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child:
                                                          FlutterFlowDropDown<
                                                              String>(
                                                        controller: _model
                                                                .depositTypeValueController ??=
                                                            FormFieldController<
                                                                String>(null),
                                                        options: [
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'f8wxryzj' /* dd */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'stlgnkkn' /* cash */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'xiodlhrd' /* pay order */,
                                                          ),
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                            'd929ne5m' /* bankers  cheque */,
                                                          )
                                                        ],
                                                        onChanged: (val) =>
                                                            safeSetState(() =>
                                                                _model.depositTypeValue =
                                                                    val),
                                                        width: 200.0,
                                                        height: 40.0,
                                                        textStyle:
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
                                                          'c18z7loj' /* Select... */,
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
                                                            .secondaryBackground,
                                                        elevation: 2.0,
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderWidth: 0.0,
                                                        borderRadius: 8.0,
                                                        margin:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        hidesUnderline: true,
                                                        isOverButton: false,
                                                        isSearchable: false,
                                                        isMultiSelect: false,
                                                      ),
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
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    '7o9ek9d8' /* Deposit Date */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 49.0,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    5.0,
                                                                    10.0,
                                                                    5.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderRadius: 8.0,
                                                              buttonSize: 40.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .isseued,
                                                              icon: Icon(
                                                                Icons
                                                                    .date_range_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                size: 24.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final _datePicked3Date =
                                                                    await showDatePicker(
                                                                  context:
                                                                      context,
                                                                  initialDate:
                                                                      getCurrentTimestamp,
                                                                  firstDate:
                                                                      DateTime(
                                                                          1900),
                                                                  lastDate:
                                                                      DateTime(
                                                                          2050),
                                                                  builder:
                                                                      (context,
                                                                          child) {
                                                                    return wrapInMaterialDatePickerTheme(
                                                                      context,
                                                                      child!,
                                                                      headerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      headerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      headerTextStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.interTight(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                32.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                          ),
                                                                      pickerBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      pickerForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      selectedDateTimeBackgroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                      selectedDateTimeForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .info,
                                                                      actionButtonForegroundColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      iconSize:
                                                                          24.0,
                                                                    );
                                                                  },
                                                                );

                                                                if (_datePicked3Date !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked3 =
                                                                        DateTime(
                                                                      _datePicked3Date
                                                                          .year,
                                                                      _datePicked3Date
                                                                          .month,
                                                                      _datePicked3Date
                                                                          .day,
                                                                    );
                                                                  });
                                                                } else if (_model
                                                                        .datePicked3 !=
                                                                    null) {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.datePicked3 =
                                                                        getCurrentTimestamp;
                                                                  });
                                                                }
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "yyyy-MM-dd",
                                                                  _model
                                                                      .datePicked3,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          15.0,
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
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'orfj4sk1' /* OSFC MR No. */,
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .oSFCMRNoTextController,
                                                        focusNode: _model
                                                            .oSFCMRNoFocusNode,
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelStyle:
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
                                                          hintStyle:
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
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
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
                                                            .oSFCMRNoTextControllerValidator
                                                            .asValidator(
                                                                context),
                                                        inputFormatters: [
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  '[a-zA-Z0-9]'))
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
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              final selectedFiles =
                                                  await selectFiles(
                                                allowedExtensions: ['pdf'],
                                                multiFile: false,
                                              );
                                              if (selectedFiles != null) {
                                                safeSetState(() => _model
                                                        .isDataUploading_uploadPDFACK =
                                                    true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                try {
                                                  selectedUploadedFiles =
                                                      selectedFiles
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                originalFilename:
                                                                    m.originalFilename,
                                                              ))
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading_uploadPDFACK =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                        .length ==
                                                    selectedFiles.length) {
                                                  safeSetState(() {
                                                    _model.uploadedLocalFile_uploadPDFACK =
                                                        selectedUploadedFiles
                                                            .first;
                                                  });
                                                } else {
                                                  safeSetState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '2a06don3' /* Upload Slip */,
                                            ),
                                            options: FFButtonOptions(
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((_model.uploadedLocalFile_uploadPDFACK
                                              .bytes?.isNotEmpty ??
                                          false))
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.2,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FlutterFlowPdfViewer(
                                        fileBytes: _model
                                            .uploadedLocalFile_uploadPDFACK
                                            .bytes,
                                        width: double.infinity,
                                        height: double.infinity,
                                        horizontalScroll: false,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              _model.formValidation = true;
                                              if (_model.formKey.currentState ==
                                                      null ||
                                                  !_model.formKey.currentState!
                                                      .validate()) {
                                                safeSetState(() => _model
                                                    .formValidation = false);
                                                return;
                                              }
                                              if (_model.datePicked1 == null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Signeture date is required',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                _model.formValidation = false;
                                                safeSetState(() {});
                                                return;
                                              }
                                              if (_model.datePicked2 == null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'RAC date is required',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                _model.formValidation = false;
                                                safeSetState(() {});
                                                return;
                                              }
                                              if (_model.depositTypeValue ==
                                                  null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Deposit Type is required',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                _model.formValidation = false;
                                                safeSetState(() {});
                                                return;
                                              }
                                              if (_model.datePicked3 == null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Deposit date is required',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                _model.formValidation = false;
                                                safeSetState(() {});
                                                return;
                                              }
                                              if ((_model.uploadedLocalFile_uploadPDFACK
                                                              .bytes ??
                                                          [])
                                                      .isEmpty) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Slip is required',
                                                      style: TextStyle(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                );
                                                _model.formValidation = false;
                                                safeSetState(() {});
                                                return;
                                              }
                                              _model.apiACkUpload =
                                                  await MsmeOsfcGroup
                                                      .uploadAcknowledgementCall
                                                      .call(
                                                authToken:
                                                    currentAuthenticationToken,
                                                otsFormId: _model
                                                    .loanNumberUploadTextController
                                                    .text,
                                                depositAmount: _model
                                                    .dipositAmountUploadTextController
                                                    .text,
                                                depositType:
                                                    _model.depositTypeValue,
                                                ofscNo: _model
                                                    .oSFCMRNoTextController
                                                    .text,
                                                depositDate: dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  _model.datePicked3,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                currentDate: dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  _model.datePicked2,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                pdfFile: _model
                                                    .uploadedLocalFile_uploadPDFACK,
                                                nameOfRecievingOfficer: _model
                                                    .receivingOfficerNameTextController
                                                    .text,
                                                dateOfSignature: dateTimeFormat(
                                                  "yyyy-MM-dd",
                                                  _model.datePicked1,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                              );

                                              if ((_model.apiACkUpload
                                                      ?.succeeded ??
                                                  true)) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'The Acknowledgement Form has been uploaded successfully',
                                                      style: GoogleFonts
                                                          .interTight(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .approved,
                                                  ),
                                                );
                                                _model.apiAckFiltercallback =
                                                    await MsmeOsfcGroup
                                                        .filterAckFormsCall
                                                        .call(
                                                  authToken:
                                                      currentAuthenticationToken,
                                                  branch: FFAppState().branch,
                                                );

                                                FFAppState().ackFilter =
                                                    getJsonField(
                                                  (_model.apiAckFiltercallback
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$''',
                                                );
                                                safeSetState(() {});
                                                Navigator.pop(context);
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      getJsonField(
                                                        (_model.apiACkUpload
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$.message''',
                                                      ).toString(),
                                                      style: GoogleFonts
                                                          .interTight(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                    ),
                                                    duration: Duration(
                                                        milliseconds: 4000),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .rejected,
                                                  ),
                                                );
                                              }

                                              safeSetState(() {});
                                            },
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '3ijiqhdb' /* Submit */,
                                            ),
                                            options: FFButtonOptions(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: 40.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .isseued,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.interTight(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              elevation: 0.0,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
