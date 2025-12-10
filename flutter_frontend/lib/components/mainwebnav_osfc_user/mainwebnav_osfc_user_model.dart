import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'mainwebnav_osfc_user_widget.dart' show MainwebnavOsfcUserWidget;
import 'package:flutter/material.dart';

class MainwebnavOsfcUserModel
    extends FlutterFlowModel<MainwebnavOsfcUserWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (User Stats)] action in Row widget.
  ApiCallResponse? apiUserCount1;
  // Stores action output result for [Backend Call - API (Filter OTS Forms)] action in Row widget.
  ApiCallResponse? otsAPIUser;
  // Stores action output result for [Backend Call - API (Filter Ack Forms)] action in Row widget.
  ApiCallResponse? apiAckFilterUsers;
  // Stores action output result for [Backend Call - API (Filter Orders)] action in Container widget.
  ApiCallResponse? apiUserOrder;
  // Stores action output result for [Backend Call - API (Filter Certificates)] action in Row widget.
  ApiCallResponse? apiUserNDCertificate;
  // Stores action output result for [Backend Call - API (FilterLoans)] action in Row widget.
  ApiCallResponse? apiResulti3pLoanUser;
  // Stores action output result for [Backend Call - API (logout)] action in Container widget.
  ApiCallResponse? logout;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
