import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainwebnav_osic_widget.dart' show MainwebnavOsicWidget;
import 'package:flutter/material.dart';

class MainwebnavOsicModel extends FlutterFlowModel<MainwebnavOsicWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Row widget.
  ApiCallResponse? apiGovOrderApi;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Row widget.
  ApiCallResponse? apiFloatTender;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Row widget.
  ApiCallResponse? apiTenderDetails;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Row widget.
  ApiCallResponse? apiSupplyOrder;
  // Stores action output result for [Backend Call - API (Gget All Sanction Orders)] action in Row widget.
  ApiCallResponse? sanctionOrderApi;
  // Stores action output result for [Backend Call - API (logout)] action in Container widget.
  ApiCallResponse? logout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
