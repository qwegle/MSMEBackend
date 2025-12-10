import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainwebnav_osfc_branch_widget.dart' show MainwebnavOsfcBranchWidget;
import 'package:flutter/material.dart';

class MainwebnavOsfcBranchModel
    extends FlutterFlowModel<MainwebnavOsfcBranchWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Row widget.
  ApiCallResponse? apiResultfilterOtsDash;
  // Stores action output result for [Backend Call - API (CountApplications)] action in Row widget.
  ApiCallResponse? otsCount;
  // Stores action output result for [Backend Call - API (getCertificateCountDays)] action in Row widget.
  ApiCallResponse? certificateCountDays;
  // Stores action output result for [Backend Call - API (Get Ceritificate Count)] action in Row widget.
  ApiCallResponse? otsCertificateCount;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Row widget.
  ApiCallResponse? apiResultfilterOtss;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Row widget.
  ApiCallResponse? apiAckFilter;
  // Stores action output result for [Backend Call - API (Memos Filter)] action in Row widget.
  ApiCallResponse? apiResultfilterMemo;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Row widget.
  ApiCallResponse? apiCertificate;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Row widget.
  ApiCallResponse? apiResulti3pLoan;
  // Stores action output result for [Backend Call - API (logout)] action in Container widget.
  ApiCallResponse? logout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
