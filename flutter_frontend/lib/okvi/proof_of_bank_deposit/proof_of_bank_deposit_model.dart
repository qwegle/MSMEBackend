import '/backend/api_requests/api_calls.dart';
import '/components/mainwebnav_okvi/mainwebnav_okvi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'proof_of_bank_deposit_widget.dart' show ProofOfBankDepositWidget;
import 'package:flutter/material.dart';

class ProofOfBankDepositModel
    extends FlutterFlowModel<ProofOfBankDepositWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainwebnavOkvi component.
  late MainwebnavOkviModel mainwebnavOkviModel;
  bool isDataUploading_uploadProofofBankDeposit = false;
  FFUploadedFile uploadedLocalFile_uploadProofofBankDeposit =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // Stores action output result for [Backend Call - API (Claim Documents Bank Deposit Proof)] action in Button widget.
  ApiCallResponse? apiResulGetBankProof;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    mainwebnavOkviModel = createModel(context, () => MainwebnavOkviModel());
  }

  @override
  void dispose() {
    mainwebnavOkviModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
