import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'remark_widget.dart' show RemarkWidget;
import 'package:flutter/material.dart';

class RemarkModel extends FlutterFlowModel<RemarkWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Remarks widget.
  FocusNode? remarksFocusNode;
  TextEditingController? remarksTextController;
  String? Function(BuildContext, String?)? remarksTextControllerValidator;
  // Stores action output result for [Backend Call - API (updateMemoStatus)] action in Button widget.
  ApiCallResponse? apiResultpek;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    remarksFocusNode?.dispose();
    remarksTextController?.dispose();
  }
}
