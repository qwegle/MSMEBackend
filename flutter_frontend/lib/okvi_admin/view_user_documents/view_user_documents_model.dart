import '/backend/api_requests/api_calls.dart';
import '/components/mainwebnav_okvi/mainwebnav_okvi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'view_user_documents_widget.dart' show ViewUserDocumentsWidget;
import 'package:flutter/material.dart';

class ViewUserDocumentsModel extends FlutterFlowModel<ViewUserDocumentsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainwebnavOkvi component.
  late MainwebnavOkviModel mainwebnavOkviModel;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultApproveFormI;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultRejectFormI;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultApproveFormV;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultRejectFormV;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultApproveFormVI;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultRejectFormVI;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultApproveAudit;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultRejectAudit;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultApproveBank;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultRejectBank;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Button widget.
  ApiCallResponse? apiResultApproveFinal;
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
