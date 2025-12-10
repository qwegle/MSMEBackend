import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'acknowledgement_widget.dart' show AcknowledgementWidget;
import 'package:flutter/material.dart';

class AcknowledgementModel extends FlutterFlowModel<AcknowledgementWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // Model for footer component.
  late FooterModel footerModel;
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
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    footerModel.dispose();
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
