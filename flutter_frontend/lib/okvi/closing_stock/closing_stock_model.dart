import '/backend/api_requests/api_calls.dart';
import '/components/mainwebnav_okvi/mainwebnav_okvi_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'closing_stock_widget.dart' show ClosingStockWidget;
import 'package:flutter/material.dart';

class ClosingStockModel extends FlutterFlowModel<ClosingStockWidget> {
  ///  Local state fields for this page.

  List<dynamic> subHeadDetails = [];
  void addToSubHeadDetails(dynamic item) => subHeadDetails.add(item);
  void removeFromSubHeadDetails(dynamic item) => subHeadDetails.remove(item);
  void removeAtIndexFromSubHeadDetails(int index) =>
      subHeadDetails.removeAt(index);
  void insertAtIndexInSubHeadDetails(int index, dynamic item) =>
      subHeadDetails.insert(index, item);
  void updateSubHeadDetailsAtIndex(int index, Function(dynamic) updateFn) =>
      subHeadDetails[index] = updateFn(subHeadDetails[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for MainwebnavOkvi component.
  late MainwebnavOkviModel mainwebnavOkviModel;
  // State field(s) for FestivalNameDropDown widget.
  String? festivalNameDropDownValue;
  FormFieldController<String>? festivalNameDropDownValueController;
  // State field(s) for HeadDropDown widget.
  String? headDropDownValue;
  FormFieldController<String>? headDropDownValueController;
  // State field(s) for SubHeadProductNameTextField widget.
  FocusNode? subHeadProductNameTextFieldFocusNode;
  TextEditingController? subHeadProductNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      subHeadProductNameTextFieldTextControllerValidator;
  // State field(s) for UnitTypeDropDown widget.
  String? unitTypeDropDownValue;
  FormFieldController<String>? unitTypeDropDownValueController;
  // State field(s) for UnityPriceTextField widget.
  FocusNode? unityPriceTextFieldFocusNode;
  TextEditingController? unityPriceTextFieldTextController;
  String? Function(BuildContext, String?)?
      unityPriceTextFieldTextControllerValidator;
  // State field(s) for QuantityTextField widget.
  FocusNode? quantityTextFieldFocusNode;
  TextEditingController? quantityTextFieldTextController;
  String? Function(BuildContext, String?)?
      quantityTextFieldTextControllerValidator;
  // State field(s) for TotalPriceTextField widget.
  FocusNode? totalPriceTextFieldFocusNode;
  TextEditingController? totalPriceTextFieldTextController;
  String? Function(BuildContext, String?)?
      totalPriceTextFieldTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? form;
  // Stores action output result for [Backend Call - API (Close Stock Create)] action in Button widget.
  ApiCallResponse? apiResultmCloseStockCreate;
  // Stores action output result for [Backend Call - API (Get Closing Stocks)] action in Button widget.
  ApiCallResponse? apiResulteGetCLoseStock;
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
    mainwebnavOkviModel = createModel(context, () => MainwebnavOkviModel());
  }

  @override
  void dispose() {
    mainwebnavOkviModel.dispose();
    subHeadProductNameTextFieldFocusNode?.dispose();
    subHeadProductNameTextFieldTextController?.dispose();

    unityPriceTextFieldFocusNode?.dispose();
    unityPriceTextFieldTextController?.dispose();

    quantityTextFieldFocusNode?.dispose();
    quantityTextFieldTextController?.dispose();

    totalPriceTextFieldFocusNode?.dispose();
    totalPriceTextFieldTextController?.dispose();

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
