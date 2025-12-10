import '/backend/api_requests/api_calls.dart';
import '/components/mainwebnav_okvi_admin/mainwebnav_okvi_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'master_data_widget.dart' show MasterDataWidget;
import 'package:flutter/material.dart';

class MasterDataModel extends FlutterFlowModel<MasterDataWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for MainwebnavOkviAdmin component.
  late MainwebnavOkviAdminModel mainwebnavOkviAdminModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for FestivalNameTypeDropDown widget.
  String? festivalNameTypeDropDownValue;
  FormFieldController<String>? festivalNameTypeDropDownValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for TypeDropDown widget.
  String? typeDropDownValue;
  FormFieldController<String>? typeDropDownValueController;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? validform;
  // Stores action output result for [Backend Call - API (Create holiday)] action in Button widget.
  ApiCallResponse? apiResultHolidaysCreat;
  // State field(s) for Head-NameTextField widget.
  FocusNode? headNameTextFieldFocusNode;
  TextEditingController? headNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      headNameTextFieldTextControllerValidator;
  String? _headNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '45atc0v2' /* Enter Head Name is required */,
      );
    }

    return null;
  }

  // State field(s) for Head-DescriptionTextField widget.
  FocusNode? headDescriptionTextFieldFocusNode;
  TextEditingController? headDescriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      headDescriptionTextFieldTextControllerValidator;
  String? _headDescriptionTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bht5nq14' /* TextField is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? validform1;
  // Stores action output result for [Backend Call - API (Create head type)] action in Button widget.
  ApiCallResponse? apiResultHeadCreat;
  // State field(s) for Unit-NameTextField widget.
  FocusNode? unitNameTextFieldFocusNode;
  TextEditingController? unitNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      unitNameTextFieldTextControllerValidator;
  String? _unitNameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3mf1hzua' /* Enter your name is required */,
      );
    }

    return null;
  }

  // State field(s) for Unit-DescTextField widget.
  FocusNode? unitDescTextFieldFocusNode;
  TextEditingController? unitDescTextFieldTextController;
  String? Function(BuildContext, String?)?
      unitDescTextFieldTextControllerValidator;
  String? _unitDescTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ztvx0f62' /* Description is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? form3;
  // Stores action output result for [Backend Call - API (Create unit type)] action in Button widget.
  ApiCallResponse? apiResultUnitCreat;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;

  @override
  void initState(BuildContext context) {
    mainwebnavOkviAdminModel =
        createModel(context, () => MainwebnavOkviAdminModel());
    headNameTextFieldTextControllerValidator =
        _headNameTextFieldTextControllerValidator;
    headDescriptionTextFieldTextControllerValidator =
        _headDescriptionTextFieldTextControllerValidator;
    unitNameTextFieldTextControllerValidator =
        _unitNameTextFieldTextControllerValidator;
    unitDescTextFieldTextControllerValidator =
        _unitDescTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    mainwebnavOkviAdminModel.dispose();
    tabBarController?.dispose();
    headNameTextFieldFocusNode?.dispose();
    headNameTextFieldTextController?.dispose();

    headDescriptionTextFieldFocusNode?.dispose();
    headDescriptionTextFieldTextController?.dispose();

    unitNameTextFieldFocusNode?.dispose();
    unitNameTextFieldTextController?.dispose();

    unitDescTextFieldFocusNode?.dispose();
    unitDescTextFieldTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController5?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();

    textFieldFocusNode3?.dispose();
    textController7?.dispose();

    textFieldFocusNode4?.dispose();
    textController8?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
