import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_admin/mainwebnav_osfc_admin_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_due_certificate_admin_model.dart';
export 'no_due_certificate_admin_model.dart';

class NoDueCertificateAdminWidget extends StatefulWidget {
  const NoDueCertificateAdminWidget({super.key});

  static String routeName = 'NoDueCertificateAdmin';
  static String routePath = '/osfc-admin-no-due-certificate';

  @override
  State<NoDueCertificateAdminWidget> createState() =>
      _NoDueCertificateAdminWidgetState();
}

class _NoDueCertificateAdminWidgetState
    extends State<NoDueCertificateAdminWidget> {
  late NoDueCertificateAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDueCertificateAdminModel());

    _model.loanNumberTextController ??= TextEditingController();
    _model.loanNumberFocusNode ??= FocusNode();

    _model.loansearch111TextController ??= TextEditingController();
    _model.loansearch111FocusNode ??= FocusNode();

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
                  model: _model.mainwebnavOsfcAdminModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MainwebnavOsfcAdminWidget(
                    clr6: FlutterFlowTheme.of(context).primary,
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
                                            '01gvh8p6' /* No Due Certificate */,
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
                                                              'zao4yt25' /* Overview */,
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
                        child: Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
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
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 16.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Text(
                                                                          FFLocalizations.of(context)
                                                                              .getText(
                                                                            'z2cvf28n' /* Upload No Due Certificate */,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Form(
                                                                    key: _model
                                                                        .formKey1,
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .disabled,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    width: 200.0,
                                                                                    child: TextFormField(
                                                                                      controller: _model.loanNumberTextController,
                                                                                      focusNode: _model.loanNumberFocusNode,
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
                                                                                          '864vsun2' /* Enter Loan number... */,
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
                                                                                      validator: _model.loanNumberTextControllerValidator.asValidator(context),
                                                                                      inputFormatters: [
                                                                                        FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              final selectedFiles = await selectFiles(
                                                                                                allowedExtensions: ['pdf'],
                                                                                                multiFile: false,
                                                                                              );
                                                                                              if (selectedFiles != null) {
                                                                                                safeSetState(() => _model.isDataUploading_sPDFFilesNDC = true);
                                                                                                var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                try {
                                                                                                  selectedUploadedFiles = selectedFiles
                                                                                                      .map((m) => FFUploadedFile(
                                                                                                            name: m.storagePath.split('/').last,
                                                                                                            bytes: m.bytes,
                                                                                                            originalFilename: m.originalFilename,
                                                                                                          ))
                                                                                                      .toList();
                                                                                                } finally {
                                                                                                  _model.isDataUploading_sPDFFilesNDC = false;
                                                                                                }
                                                                                                if (selectedUploadedFiles.length == selectedFiles.length) {
                                                                                                  safeSetState(() {
                                                                                                    _model.uploadedLocalFile_sPDFFilesNDC = selectedUploadedFiles.first;
                                                                                                  });
                                                                                                } else {
                                                                                                  safeSetState(() {});
                                                                                                  return;
                                                                                                }
                                                                                              }
                                                                                            },
                                                                                            text: FFLocalizations.of(context).getText(
                                                                                              'kbsax37k' /* Upload PDF */,
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
                                                                                        ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: FFButtonWidget(
                                                                                            onPressed: () async {
                                                                                              _model.ndcFormValidation = true;
                                                                                              if (_model.formKey1.currentState == null || !_model.formKey1.currentState!.validate()) {
                                                                                                safeSetState(() => _model.ndcFormValidation = false);
                                                                                                return;
                                                                                              }
                                                                                              if ((_model.uploadedLocalFile_sPDFFilesNDC.bytes ?? []).isEmpty) {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Upload No Due Certificate',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).rejected,
                                                                                                  ),
                                                                                                );
                                                                                                _model.ndcFormValidation = false;
                                                                                                safeSetState(() {});
                                                                                                return;
                                                                                              }
                                                                                              _model.certificateUpload = await MsmeOsfcGroup.uploadCertificateCall.call(
                                                                                                loanNumber: _model.loanNumberTextController.text,
                                                                                                pdf: _model.uploadedLocalFile_sPDFFilesNDC,
                                                                                                authToken: currentAuthenticationToken,
                                                                                              );

                                                                                              if ((_model.certificateUpload?.succeeded ?? true)) {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'The Certificate has been uploaded successfully',
                                                                                                      style: GoogleFonts.interTight(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).approved,
                                                                                                  ),
                                                                                                );
                                                                                                safeSetState(() {
                                                                                                  _model.isDataUploading_sPDFFilesNDC = false;
                                                                                                  _model.uploadedLocalFile_sPDFFilesNDC = FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
                                                                                                });

                                                                                                safeSetState(() {
                                                                                                  _model.loanNumberTextController?.clear();
                                                                                                });
                                                                                                _model.apiCertificateAdmin = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                                  authToken: currentAuthenticationToken,
                                                                                                );

                                                                                                FFAppState().NDCFilter = getJsonField(
                                                                                                  (_model.apiCertificateAdmin?.jsonBody ?? ''),
                                                                                                  r'''$''',
                                                                                                );
                                                                                                safeSetState(() {});
                                                                                              } else {
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Something went wrong while uploading the memorandum. Please try again.',
                                                                                                      style: GoogleFonts.interTight(
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
                                                                                              'mva27tje' /* Submit */,
                                                                                            ),
                                                                                            options: FFButtonOptions(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: 40.0,
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                              color: FlutterFlowTheme.of(context).isseued,
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
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 16.0)),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                if ((_model
                                                                            .uploadedLocalFile_sPDFFilesNDC
                                                                            .bytes
                                                                            ?.isNotEmpty ??
                                                                        false))
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: MediaQuery.sizeOf(context).height * 0.4,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: FlutterFlowPdfViewer(
                                                                                fileBytes: _model.uploadedLocalFile_sPDFFilesNDC.bytes,
                                                                                width: double.infinity,
                                                                                height: double.infinity,
                                                                                horizontalScroll: false,
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
                                                ),
                                              ),
                                            ],
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
                                              child: Visibility(
                                                visible: responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(16.0),
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
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
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
                                                                                'eh6ooxdt' /* No Due Certificate Status */,
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
                                                                              Container(
                                                                                width: 230.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: 200.0,
                                                                                  child: TextFormField(
                                                                                    controller: _model.loansearch111TextController,
                                                                                    focusNode: _model.loansearch111FocusNode,
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
                                                                                        'czl6cn0r' /* Search Loan Number */,
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
                                                                                    validator: _model.loansearch111TextControllerValidator.asValidator(context),
                                                                                    inputFormatters: [
                                                                                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  _model.formValidation = true;
                                                                                  if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                    safeSetState(() => _model.formValidation = false);
                                                                                    return;
                                                                                  }
                                                                                  _model.apiCertificate1Search = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                    authToken: currentAuthenticationToken,
                                                                                    loanNumber: _model.loansearch111TextController.text,
                                                                                  );

                                                                                  if ((_model.apiCertificate1Search?.succeeded ?? true)) {
                                                                                    FFAppState().NDCFilter = getJsonField(
                                                                                      (_model.apiCertificate1Search?.jsonBody ?? ''),
                                                                                      r'''$''',
                                                                                    );
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '8gjbn8vr' /* Search */,
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
                                                                                  _model.apiCertificatereset1 = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                    authToken: currentAuthenticationToken,
                                                                                  );

                                                                                  FFAppState().NDCFilter = getJsonField(
                                                                                    (_model.apiCertificatereset1?.jsonBody ?? ''),
                                                                                    r'''$''',
                                                                                  );
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                text: FFLocalizations.of(context).getText(
                                                                                  '050x6a29' /* Clear */,
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
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
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
                                                                                  'htk8ujxa' /* Loan Number */,
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
                                                                                'qodvznz0' /* User Name */,
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
                                                                              flex: 2,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '2fcgkd41' /* OTS Apply Date */,
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
                                                                                'v51phma4' /* Uploaded Date */,
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
                                                                                'sybgdmsl' /* Actions */,
                                                                              ),
                                                                              textAlign: TextAlign.end,
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
                                                                  if ('error' !=
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .NDCFilter,
                                                                        r'''$.status''',
                                                                      ).toString())
                                                                    Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final nDCFilters =
                                                                            getJsonField(
                                                                          FFAppState()
                                                                              .NDCFilter,
                                                                          r'''$.paginatedData''',
                                                                        ).toList();
                                                                        if (nDCFilters
                                                                            .isEmpty) {
                                                                          return Center(
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/images/9276419.png',
                                                                              height: 400.0,
                                                                            ),
                                                                          );
                                                                        }

                                                                        return ListView
                                                                            .builder(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              nDCFilters.length,
                                                                          itemBuilder:
                                                                              (context, nDCFiltersIndex) {
                                                                            final nDCFiltersItem =
                                                                                nDCFilters[nDCFiltersIndex];
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
                                                                                child: Padding(
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
                                                                                                              nDCFiltersItem,
                                                                                                              r'''$.otsDetails.loan_number''',
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
                                                                                                          nDCFiltersItem,
                                                                                                          r'''$.otsDetails.loan_number''',
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
                                                                                                                  nDCFiltersItem,
                                                                                                                  r'''$.otsDetails.first_name''',
                                                                                                                ).toString(),
                                                                                                                getJsonField(
                                                                                                                  nDCFiltersItem,
                                                                                                                  r'''$.otsDetails.last_name''',
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
                                                                                                        nDCFiltersItem,
                                                                                                        r'''$.otsDetails.createdAt''',
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
                                                                                                              nDCFiltersItem,
                                                                                                              r'''$.createdAt''',
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
                                                                                                        _model.userReffDetailsView = await MsmeOsfcGroup.filterOTSFormsCall.call(
                                                                                                          authToken: currentAuthenticationToken,
                                                                                                          otsId: getJsonField(
                                                                                                            nDCFiltersItem,
                                                                                                            r'''$.ots.loan_number''',
                                                                                                          ).toString(),
                                                                                                        );

                                                                                                        FFAppState().singleuserreff = getJsonField(
                                                                                                          (_model.userReffDetailsView?.jsonBody ?? ''),
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
                                                                  if ('error' !=
                                                                      getJsonField(
                                                                        FFAppState()
                                                                            .NDCFilter,
                                                                        r'''$.status''',
                                                                      ).toString())
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.only(
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'qyci8q1s' /* Rows per pages: */,
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
                                                                                      controller: _model.limitDropDownValueController ??= FormFieldController<String>(
                                                                                        _model.limitDropDownValue ??= getJsonField(
                                                                                          FFAppState().NDCFilter,
                                                                                          r'''$.limit''',
                                                                                        ).toString(),
                                                                                      ),
                                                                                      options: [
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'syogrjfz' /* 5 */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'meu25kon' /* 10 */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'r8emuepl' /* 25 */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'zq4c6pkp' /* 50 */,
                                                                                        ),
                                                                                        FFLocalizations.of(context).getText(
                                                                                          'ah459ock' /* 100 */,
                                                                                        )
                                                                                      ],
                                                                                      onChanged: (val) async {
                                                                                        safeSetState(() => _model.limitDropDownValue = val);
                                                                                        _model.apiCertificateLimitChange = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                          authToken: currentAuthenticationToken,
                                                                                          limit: valueOrDefault<String>(
                                                                                            _model.limitDropDownValue,
                                                                                            '10',
                                                                                          ),
                                                                                        );

                                                                                        FFAppState().NDCFilter = getJsonField(
                                                                                          (_model.apiCertificateLimitChange?.jsonBody ?? ''),
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
                                                                                        'khs9jntz' /* 10 */,
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  RichText(
                                                                                    textScaler: MediaQuery.of(context).textScaler,
                                                                                    text: TextSpan(
                                                                                      children: [
                                                                                        TextSpan(
                                                                                          text: valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              FFAppState().NDCFilter,
                                                                                              r'''$.page''',
                                                                                            )?.toString(),
                                                                                            '1',
                                                                                          ),
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            '610776oj' /* - */,
                                                                                          ),
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              FFAppState().NDCFilter,
                                                                                              r'''$.currentPageCount''',
                                                                                            )?.toString(),
                                                                                            '0',
                                                                                          ),
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: FFLocalizations.of(context).getText(
                                                                                            'kn97fks5' /*  of  */,
                                                                                          ),
                                                                                          style: TextStyle(),
                                                                                        ),
                                                                                        TextSpan(
                                                                                          text: valueOrDefault<String>(
                                                                                            getJsonField(
                                                                                              FFAppState().NDCFilter,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        _model.apiCertificateFirst = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                          authToken: currentAuthenticationToken,
                                                                                          limit: valueOrDefault<String>(
                                                                                            _model.limitDropDownValue,
                                                                                            '10',
                                                                                          ),
                                                                                          page: '1',
                                                                                        );

                                                                                        FFAppState().NDCFilter = getJsonField(
                                                                                          (_model.apiCertificateFirst?.jsonBody ?? ''),
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
                                                                                              FFAppState().NDCFilter,
                                                                                              r'''$.previousPage''',
                                                                                            ) !=
                                                                                            null) {
                                                                                          _model.apiCertificatePrevious = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                            authToken: currentAuthenticationToken,
                                                                                            limit: valueOrDefault<String>(
                                                                                              _model.limitDropDownValue,
                                                                                              '10',
                                                                                            ),
                                                                                            page: getJsonField(
                                                                                              FFAppState().NDCFilter,
                                                                                              r'''$.previousPage''',
                                                                                            ).toString(),
                                                                                          );

                                                                                          FFAppState().NDCFilter = getJsonField(
                                                                                            (_model.apiCertificatePrevious?.jsonBody ?? ''),
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
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      if (getJsonField(
                                                                                            FFAppState().NDCFilter,
                                                                                            r'''$.nextPage''',
                                                                                          ) !=
                                                                                          null) {
                                                                                        _model.apiCertificateNext = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                          authToken: currentAuthenticationToken,
                                                                                          limit: valueOrDefault<String>(
                                                                                            _model.limitDropDownValue,
                                                                                            '10',
                                                                                          ),
                                                                                          page: getJsonField(
                                                                                            FFAppState().NDCFilter,
                                                                                            r'''$.nextPage''',
                                                                                          ).toString(),
                                                                                        );

                                                                                        FFAppState().NDCFilter = getJsonField(
                                                                                          (_model.apiCertificateNext?.jsonBody ?? ''),
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
                                                                                      _model.apiCertificateLast = await MsmeOsfcGroup.filterCertificatesCall.call(
                                                                                        authToken: currentAuthenticationToken,
                                                                                        limit: valueOrDefault<String>(
                                                                                          _model.limitDropDownValue,
                                                                                          '10',
                                                                                        ),
                                                                                        page: getJsonField(
                                                                                          FFAppState().NDCFilter,
                                                                                          r'''$.totalPages''',
                                                                                        ).toString(),
                                                                                      );

                                                                                      FFAppState().NDCFilter = getJsonField(
                                                                                        (_model.apiCertificateLast?.jsonBody ?? ''),
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
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 24.0)),
                              ),
                            ),
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
              if (responsiveVisibility(
                context: context,
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
