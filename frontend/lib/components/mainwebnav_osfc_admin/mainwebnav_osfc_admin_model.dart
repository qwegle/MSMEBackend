import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainwebnav_osfc_admin_widget.dart' show MainwebnavOsfcAdminWidget;
import 'package:flutter/material.dart';

class MainwebnavOsfcAdminModel
    extends FlutterFlowModel<MainwebnavOsfcAdminWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Row widget.
  ApiCallResponse? apifilterOtsDashAdmin;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Row widget.
  ApiCallResponse? apifilterOtssAPPAdmin;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Row widget.
  ApiCallResponse? apiAckFiltersAdmin;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Row widget.
  ApiCallResponse? apiResultfilterMemoAdmin;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Container widget.
  ApiCallResponse? apiSettlementOrder;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Row widget.
  ApiCallResponse? apiCertificateAdmin;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Row widget.
  ApiCallResponse? apiResulti3pLoanAdmin;
  // Stores action output result for [Backend Call - API (logout)] action in Container widget.
  ApiCallResponse? logout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
