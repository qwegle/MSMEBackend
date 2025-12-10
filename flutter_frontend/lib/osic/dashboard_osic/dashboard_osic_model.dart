import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osic/mainwebnav_osic_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dashboard_osic_widget.dart' show DashboardOsicWidget;
import 'package:flutter/material.dart';

class DashboardOsicModel extends FlutterFlowModel<DashboardOsicWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Dashboard Counts)] action in DashboardOsic widget.
  ApiCallResponse? oSICDashboardCount;
  // Model for MainwebnavOsic component.
  late MainwebnavOsicModel mainwebnavOsicModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<dynamic>();
  // State field(s) for Govt_limit_drop_down widget.
  String? govtLimitDropDownValue;
  FormFieldController<String>? govtLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Govt_limit_drop_down widget.
  ApiCallResponse? govOrderApiLimitChange;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapiFirst;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapiprevious;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapiNext;
  // Stores action output result for [Backend Call - API (Filter Government Orders)] action in Icon widget.
  ApiCallResponse? govOrderapIlast;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Tab widget.
  ApiCallResponse? apiFloatTender;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<dynamic>();
  // State field(s) for Float_limit_drop_down widget.
  String? floatLimitDropDownValue;
  FormFieldController<String>? floatLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Float_limit_drop_down widget.
  ApiCallResponse? floatTenderapiLimitChange;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiFirst;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiPrevious;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiNext;
  // Stores action output result for [Backend Call - API (filter Float Tenders)] action in Icon widget.
  ApiCallResponse? floatTenderapiLast;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Tab widget.
  ApiCallResponse? apiSUpplyOrder;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController3 =
      FlutterFlowDataTableController<dynamic>();
  // State field(s) for Supply_limit_drop_down widget.
  String? supplyLimitDropDownValue;
  FormFieldController<String>? supplyLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Supply_limit_drop_down widget.
  ApiCallResponse? supplyOrderapiLimitChange;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapiFirst;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapipreviousPage;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapiNext;
  // Stores action output result for [Backend Call - API (filter Supply Orders)] action in Icon widget.
  ApiCallResponse? supplyOrderapiLast;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Tab widget.
  ApiCallResponse? apiTenderResult;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController4 =
      FlutterFlowDataTableController<dynamic>();
  // State field(s) for Tender_limit_drop_down widget.
  String? tenderLimitDropDownValue;
  FormFieldController<String>? tenderLimitDropDownValueController;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Tender_limit_drop_down widget.
  ApiCallResponse? tenderResultapiLimitChange;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiFirst;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiPrevious;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiNext;
  // Stores action output result for [Backend Call - API (filter Tender Results)] action in Icon widget.
  ApiCallResponse? tenderResultapiLAst;
  // Model for footer component.
  late FooterModel footerModel;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsicModel = createModel(context, () => MainwebnavOsicModel());
    languageModel = createModel(context, () => LanguageModel());
    footerModel = createModel(context, () => FooterModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsicModel.dispose();
    languageModel.dispose();
    tabBarController?.dispose();
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
    paginatedDataTableController3.dispose();
    paginatedDataTableController4.dispose();
    footerModel.dispose();
    mobileVersionNotAvailableModel.dispose();
  }
}
