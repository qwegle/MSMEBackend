import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainwebnav_okvi_widget.dart' show MainwebnavOkviWidget;
import 'package:flutter/material.dart';

class MainwebnavOkviModel extends FlutterFlowModel<MainwebnavOkviWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Get Opening Stocks)] action in Row widget.
  ApiCallResponse? apiResultGetOpenStock;
  // Stores action output result for [Backend Call - API (Get Closing Stocks)] action in Row widget.
  ApiCallResponse? apiResultGetCloseStock;
  // Stores action output result for [Backend Call - API (Get Claim Data)] action in Row widget.
  ApiCallResponse? apiResulthAllForms;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
