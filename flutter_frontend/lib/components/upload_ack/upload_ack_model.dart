import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'upload_ack_widget.dart' show UploadAckWidget;
import 'package:flutter/material.dart';

class UploadAckModel extends FlutterFlowModel<UploadAckWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for LoanNumberUpload widget.
  FocusNode? loanNumberUploadFocusNode;
  TextEditingController? loanNumberUploadTextController;
  String? Function(BuildContext, String?)?
      loanNumberUploadTextControllerValidator;
  String? _loanNumberUploadTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fh6k6mit' /*  Loan number is required */,
      );
    }

    return null;
  }

  // State field(s) for ReceivingOfficerName widget.
  FocusNode? receivingOfficerNameFocusNode;
  TextEditingController? receivingOfficerNameTextController;
  String? Function(BuildContext, String?)?
      receivingOfficerNameTextControllerValidator;
  String? _receivingOfficerNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8c3i5x6i' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked1;
  // State field(s) for DipositAmountUpload widget.
  FocusNode? dipositAmountUploadFocusNode;
  TextEditingController? dipositAmountUploadTextController;
  String? Function(BuildContext, String?)?
      dipositAmountUploadTextControllerValidator;
  String? _dipositAmountUploadTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '9xu46mnk' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for RACAMount widget.
  FocusNode? rACAMountFocusNode;
  TextEditingController? rACAMountTextController;
  String? Function(BuildContext, String?)? rACAMountTextControllerValidator;
  String? _rACAMountTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jy1q8w1u' /* Field is required */,
      );
    }

    return null;
  }

  DateTime? datePicked2;
  // State field(s) for DepositType widget.
  String? depositTypeValue;
  FormFieldController<String>? depositTypeValueController;
  DateTime? datePicked3;
  // State field(s) for OSFCMRNo widget.
  FocusNode? oSFCMRNoFocusNode;
  TextEditingController? oSFCMRNoTextController;
  String? Function(BuildContext, String?)? oSFCMRNoTextControllerValidator;
  String? _oSFCMRNoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ucvdxv60' /* Field is required */,
      );
    }

    return null;
  }

  bool isDataUploading_uploadPDFACK = false;
  FFUploadedFile uploadedLocalFile_uploadPDFACK =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation;
  // Stores action output result for [Backend Call - API (Upload Acknowledgement)] action in Button widget.
  ApiCallResponse? apiACkUpload;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Button widget.
  ApiCallResponse? apiAckFiltercallback;

  @override
  void initState(BuildContext context) {
    loanNumberUploadTextControllerValidator =
        _loanNumberUploadTextControllerValidator;
    receivingOfficerNameTextControllerValidator =
        _receivingOfficerNameTextControllerValidator;
    dipositAmountUploadTextControllerValidator =
        _dipositAmountUploadTextControllerValidator;
    rACAMountTextControllerValidator = _rACAMountTextControllerValidator;
    oSFCMRNoTextControllerValidator = _oSFCMRNoTextControllerValidator;
  }

  @override
  void dispose() {
    loanNumberUploadFocusNode?.dispose();
    loanNumberUploadTextController?.dispose();

    receivingOfficerNameFocusNode?.dispose();
    receivingOfficerNameTextController?.dispose();

    dipositAmountUploadFocusNode?.dispose();
    dipositAmountUploadTextController?.dispose();

    rACAMountFocusNode?.dispose();
    rACAMountTextController?.dispose();

    oSFCMRNoFocusNode?.dispose();
    oSFCMRNoTextController?.dispose();
  }
}
