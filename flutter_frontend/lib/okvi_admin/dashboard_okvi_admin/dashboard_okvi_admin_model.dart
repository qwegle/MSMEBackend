import '/components/mainwebnav_okvi_admin/mainwebnav_okvi_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dashboard_okvi_admin_widget.dart' show DashboardOkviAdminWidget;
import 'package:flutter/material.dart';

class DashboardOkviAdminModel
    extends FlutterFlowModel<DashboardOkviAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for MainwebnavOkviAdmin component.
  late MainwebnavOkviAdminModel mainwebnavOkviAdminModel;
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
    mainwebnavOkviAdminModel =
        createModel(context, () => MainwebnavOkviAdminModel());
  }

  @override
  void dispose() {
    mainwebnavOkviAdminModel.dispose();
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
