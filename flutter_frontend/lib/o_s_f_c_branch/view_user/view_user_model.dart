import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'view_user_widget.dart' show ViewUserWidget;
import 'package:flutter/material.dart';

class ViewUserModel extends FlutterFlowModel<ViewUserWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for first-name widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for last-name widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
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
  // State field(s) for TotalOutstandingLiablitytoOSFCAsOnTheDateofApplication widget.
  FocusNode? totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode1;
  TextEditingController?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController1;
  String? Function(BuildContext, String?)?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController1Validator;
  // State field(s) for Natureofindustryproducttypeoftheunitcompany widget.
  FocusNode? natureofindustryproducttypeoftheunitcompanyFocusNode1;
  TextEditingController?
      natureofindustryproducttypeoftheunitcompanyTextController1;
  String? Function(BuildContext, String?)?
      natureofindustryproducttypeoftheunitcompanyTextController1Validator;
  // State field(s) for TotalOutstandingLiablitytoOSFCAsOnTheDateofApplication widget.
  FocusNode? totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode2;
  TextEditingController?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController2;
  String? Function(BuildContext, String?)?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController2Validator;
  // State field(s) for Natureofindustryproducttypeoftheunitcompany widget.
  FocusNode? natureofindustryproducttypeoftheunitcompanyFocusNode2;
  TextEditingController?
      natureofindustryproducttypeoftheunitcompanyTextController2;
  String? Function(BuildContext, String?)?
      natureofindustryproducttypeoftheunitcompanyTextController2Validator;
  // State field(s) for TotalOutstandingLiablitytoOSFCAsOnTheDateofApplication widget.
  FocusNode? totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode3;
  TextEditingController?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController3;
  String? Function(BuildContext, String?)?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController3Validator;
  // State field(s) for Natureofindustryproducttypeoftheunitcompany widget.
  FocusNode? natureofindustryproducttypeoftheunitcompanyFocusNode3;
  TextEditingController?
      natureofindustryproducttypeoftheunitcompanyTextController3;
  String? Function(BuildContext, String?)?
      natureofindustryproducttypeoftheunitcompanyTextController3Validator;
  // State field(s) for TotalOutstandingLiablitytoOSFCAsOnTheDateofApplication widget.
  FocusNode? totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode4;
  TextEditingController?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController4;
  String? Function(BuildContext, String?)?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController4Validator;
  // State field(s) for TotalOutstandingLiablitytoOSFCAsOnTheDateofApplication widget.
  FocusNode? totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode5;
  TextEditingController?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController5;
  String? Function(BuildContext, String?)?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController5Validator;
  // State field(s) for Natureofindustryproducttypeoftheunitcompany widget.
  FocusNode? natureofindustryproducttypeoftheunitcompanyFocusNode4;
  TextEditingController?
      natureofindustryproducttypeoftheunitcompanyTextController4;
  String? Function(BuildContext, String?)?
      natureofindustryproducttypeoftheunitcompanyTextController4Validator;
  // State field(s) for TermsofpaymentoftheporposedOTSamount widget.
  String? termsofpaymentoftheporposedOTSamountValue;
  FormFieldController<String>?
      termsofpaymentoftheporposedOTSamountValueController;
  // State field(s) for Natureofindustryproducttypeoftheunitcompany widget.
  FocusNode? natureofindustryproducttypeoftheunitcompanyFocusNode5;
  TextEditingController?
      natureofindustryproducttypeoftheunitcompanyTextController5;
  String? Function(BuildContext, String?)?
      natureofindustryproducttypeoftheunitcompanyTextController5Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode7;
  TextEditingController? textController21;
  String? Function(BuildContext, String?)? textController21Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode8;
  TextEditingController? textController22;
  String? Function(BuildContext, String?)? textController22Validator;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Model for MobileVersionNotAvailable component.
  late MobileVersionNotAvailableModel mobileVersionNotAvailableModel;

  @override
  void initState(BuildContext context) {
    mainwebnavOsfcUserModel =
        createModel(context, () => MainwebnavOsfcUserModel());
    languageModel = createModel(context, () => LanguageModel());
    mobileVersionNotAvailableModel =
        createModel(context, () => MobileVersionNotAvailableModel());
  }

  @override
  void dispose() {
    mainwebnavOsfcUserModel.dispose();
    languageModel.dispose();
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    numberFocusNode?.dispose();
    numberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController5?.dispose();

    textFieldFocusNode2?.dispose();
    textController6?.dispose();

    textFieldFocusNode3?.dispose();
    textController7?.dispose();

    textFieldFocusNode4?.dispose();
    textController8?.dispose();

    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode1?.dispose();
    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController1
        ?.dispose();

    natureofindustryproducttypeoftheunitcompanyFocusNode1?.dispose();
    natureofindustryproducttypeoftheunitcompanyTextController1?.dispose();

    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode2?.dispose();
    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController2
        ?.dispose();

    natureofindustryproducttypeoftheunitcompanyFocusNode2?.dispose();
    natureofindustryproducttypeoftheunitcompanyTextController2?.dispose();

    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode3?.dispose();
    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController3
        ?.dispose();

    natureofindustryproducttypeoftheunitcompanyFocusNode3?.dispose();
    natureofindustryproducttypeoftheunitcompanyTextController3?.dispose();

    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode4?.dispose();
    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController4
        ?.dispose();

    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode5?.dispose();
    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController5
        ?.dispose();

    natureofindustryproducttypeoftheunitcompanyFocusNode4?.dispose();
    natureofindustryproducttypeoftheunitcompanyTextController4?.dispose();

    natureofindustryproducttypeoftheunitcompanyFocusNode5?.dispose();
    natureofindustryproducttypeoftheunitcompanyTextController5?.dispose();

    textFieldFocusNode5?.dispose();
    textController19?.dispose();

    textFieldFocusNode6?.dispose();
    textController20?.dispose();

    textFieldFocusNode7?.dispose();
    textController21?.dispose();

    textFieldFocusNode8?.dispose();
    textController22?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
