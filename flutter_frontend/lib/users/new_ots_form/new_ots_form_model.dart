import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/components/language/language_widget.dart';
import '/components/mainwebnav_osfc_user/mainwebnav_osfc_user_widget.dart';
import '/components/mobile_version_not_available/mobile_version_not_available_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'new_ots_form_widget.dart' show NewOtsFormWidget;
import 'package:flutter/material.dart';

class NewOtsFormModel extends FlutterFlowModel<NewOtsFormWidget> {
  ///  Local state fields for this page.

  String activeTab = 'general';

  String activemenu = 'settings';

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey4 = GlobalKey<FormState>();
  // Model for MainwebnavOsfcUser component.
  late MainwebnavOsfcUserModel mainwebnavOsfcUserModel;
  // Model for Language component.
  late LanguageModel languageModel;
  // State field(s) for Checkbox55 widget.
  bool? checkbox55Value;
  // State field(s) for Checkbox66 widget.
  bool? checkbox66Value;
  // State field(s) for Checkbox77 widget.
  bool? checkbox77Value;
  // State field(s) for Checkbox88 widget.
  bool? checkbox88Value;
  // Stores action output result for [Backend Call - API (Submit OTS Form)] action in Button widget.
  ApiCallResponse? aPIOtsFormApply;
  // State field(s) for first-name widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  String? _firstNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'fyyxp7hz' /* First Name is required */,
      );
    }

    return null;
  }

  // State field(s) for last-name widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  String? _lastNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'cejkkojq' /* Last Name is required */,
      );
    }

    return null;
  }

  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  String? _numberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'n69rnudw' /* Number is required */,
      );
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ubyv6wri' /* E-Mail Id is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        '4fkfnwbm' /* Please enter a valid email add... */,
      );
    }
    return null;
  }

  // State field(s) for Streetaddress widget.
  FocusNode? streetaddressFocusNode;
  TextEditingController? streetaddressTextController;
  String? Function(BuildContext, String?)? streetaddressTextControllerValidator;
  String? _streetaddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dkjw61tf' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for Branch widget.
  String? branchValue;
  FormFieldController<String>? branchValueController;
  // State field(s) for State widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateTextController;
  String? Function(BuildContext, String?)? stateTextControllerValidator;
  String? _stateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '246vk3ax' /* State is required. */,
      );
    }

    return null;
  }

  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityTextController;
  String? Function(BuildContext, String?)? cityTextControllerValidator;
  String? _cityTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jplmsyjt' /* City is required */,
      );
    }

    return null;
  }

  // State field(s) for PinCode widget.
  FocusNode? pinCodeFocusNode;
  TextEditingController? pinCodeTextController;
  String? Function(BuildContext, String?)? pinCodeTextControllerValidator;
  String? _pinCodeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uiubvxhf' /* Pin-Code is required */,
      );
    }

    return null;
  }

  // State field(s) for TotalOutstandingLiablitytoOSFCAsOnTheDateofApplication widget.
  FocusNode? totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode;
  TextEditingController?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController;
  String? Function(BuildContext, String?)?
      totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextControllerValidator;
  String?
      _totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextControllerValidator(
          BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uo333btb' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for Natureofindustryproducttypeoftheunitcompany widget.
  FocusNode? natureofindustryproducttypeoftheunitcompanyFocusNode;
  TextEditingController?
      natureofindustryproducttypeoftheunitcompanyTextController;
  String? Function(BuildContext, String?)?
      natureofindustryproducttypeoftheunitcompanyTextControllerValidator;
  String? _natureofindustryproducttypeoftheunitcompanyTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '5nyp4fxw' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for ThePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereof widget.
  FocusNode?
      thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofFocusNode;
  TextEditingController?
      thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofTextController;
  String? Function(BuildContext, String?)?
      thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofTextControllerValidator;
  String?
      _thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofTextControllerValidator(
          BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd1dgflaa' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for Reasonsofnon-paymentofCorporationsdues widget.
  FocusNode? reasonsofnonPaymentofCorporationsduesFocusNode;
  TextEditingController? reasonsofnonPaymentofCorporationsduesTextController;
  String? Function(BuildContext, String?)?
      reasonsofnonPaymentofCorporationsduesTextControllerValidator;
  String? _reasonsofnonPaymentofCorporationsduesTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jzg9308x' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for DetailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifany widget.
  FocusNode?
      detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyFocusNode;
  TextEditingController?
      detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyTextController;
  String? Function(BuildContext, String?)?
      detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyTextControllerValidator;
  String?
      _detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyTextControllerValidator(
          BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'm65xffgq' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for WhetherdefaultertootherBanksFlsifsostatusofNPA widget.
  FocusNode? whetherdefaultertootherBanksFlsifsostatusofNPAFocusNode;
  TextEditingController?
      whetherdefaultertootherBanksFlsifsostatusofNPATextController;
  String? Function(BuildContext, String?)?
      whetherdefaultertootherBanksFlsifsostatusofNPATextControllerValidator;
  String?
      _whetherdefaultertootherBanksFlsifsostatusofNPATextControllerValidator(
          BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'z82w8ike' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for Sailientop widget.
  FocusNode? sailientopFocusNode;
  TextEditingController? sailientopTextController;
  String? Function(BuildContext, String?)? sailientopTextControllerValidator;
  String? _sailientopTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'crearfb6' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for ReasonsforsettlementofloanduesunderOTS widget.
  FocusNode? reasonsforsettlementofloanduesunderOTSFocusNode;
  TextEditingController? reasonsforsettlementofloanduesunderOTSTextController;
  String? Function(BuildContext, String?)?
      reasonsforsettlementofloanduesunderOTSTextControllerValidator;
  String? _reasonsforsettlementofloanduesunderOTSTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h2pmc4hy' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for Sourcesofpaymentofsettlementamount widget.
  FocusNode? sourcesofpaymentofsettlementamountFocusNode;
  TextEditingController? sourcesofpaymentofsettlementamountTextController;
  String? Function(BuildContext, String?)?
      sourcesofpaymentofsettlementamountTextControllerValidator;
  String? _sourcesofpaymentofsettlementamountTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zh2ilsba' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for TermsofpaymentoftheporposedOTSamount widget.
  String? termsofpaymentoftheporposedOTSamountValue;
  FormFieldController<String>?
      termsofpaymentoftheporposedOTSamountValueController;
  // State field(s) for Anyotherparticularsthatmayberelevanttomention widget.
  FocusNode? anyotherparticularsthatmayberelevanttomentionFocusNode;
  TextEditingController?
      anyotherparticularsthatmayberelevanttomentionTextController;
  String? Function(BuildContext, String?)?
      anyotherparticularsthatmayberelevanttomentionTextControllerValidator;
  String? _anyotherparticularsthatmayberelevanttomentionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'imoalwi0' /* This field is required. */,
      );
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formProfile;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formRestDetails;
  // Model for footer component.
  late FooterModel footerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController19;
  String? Function(BuildContext, String?)? textController19Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController20;
  String? Function(BuildContext, String?)? textController20Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController21;
  String? Function(BuildContext, String?)? textController21Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
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
    firstNameTextControllerValidator = _firstNameTextControllerValidator;
    lastNameTextControllerValidator = _lastNameTextControllerValidator;
    numberTextControllerValidator = _numberTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
    streetaddressTextControllerValidator =
        _streetaddressTextControllerValidator;
    stateTextControllerValidator = _stateTextControllerValidator;
    cityTextControllerValidator = _cityTextControllerValidator;
    pinCodeTextControllerValidator = _pinCodeTextControllerValidator;
    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextControllerValidator =
        _totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextControllerValidator;
    natureofindustryproducttypeoftheunitcompanyTextControllerValidator =
        _natureofindustryproducttypeoftheunitcompanyTextControllerValidator;
    thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofTextControllerValidator =
        _thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofTextControllerValidator;
    reasonsofnonPaymentofCorporationsduesTextControllerValidator =
        _reasonsofnonPaymentofCorporationsduesTextControllerValidator;
    detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyTextControllerValidator =
        _detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyTextControllerValidator;
    whetherdefaultertootherBanksFlsifsostatusofNPATextControllerValidator =
        _whetherdefaultertootherBanksFlsifsostatusofNPATextControllerValidator;
    sailientopTextControllerValidator = _sailientopTextControllerValidator;
    reasonsforsettlementofloanduesunderOTSTextControllerValidator =
        _reasonsforsettlementofloanduesunderOTSTextControllerValidator;
    sourcesofpaymentofsettlementamountTextControllerValidator =
        _sourcesofpaymentofsettlementamountTextControllerValidator;
    anyotherparticularsthatmayberelevanttomentionTextControllerValidator =
        _anyotherparticularsthatmayberelevanttomentionTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
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

    streetaddressFocusNode?.dispose();
    streetaddressTextController?.dispose();

    stateFocusNode?.dispose();
    stateTextController?.dispose();

    cityFocusNode?.dispose();
    cityTextController?.dispose();

    pinCodeFocusNode?.dispose();
    pinCodeTextController?.dispose();

    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationFocusNode?.dispose();
    totalOutstandingLiablitytoOSFCAsOnTheDateofApplicationTextController
        ?.dispose();

    natureofindustryproducttypeoftheunitcompanyFocusNode?.dispose();
    natureofindustryproducttypeoftheunitcompanyTextController?.dispose();

    thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofFocusNode
        ?.dispose();
    thePresentLevelofoperationofvehiclewithRegnNoIncasetheunitcompanyisnotinoperationandreasonsthereofTextController
        ?.dispose();

    reasonsofnonPaymentofCorporationsduesFocusNode?.dispose();
    reasonsofnonPaymentofCorporationsduesTextController?.dispose();

    detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyFocusNode
        ?.dispose();
    detailsofduestootherinstitutionsFlsBanksIncludingdetailsofsettlementsreachedwiththemifanyTextController
        ?.dispose();

    whetherdefaultertootherBanksFlsifsostatusofNPAFocusNode?.dispose();
    whetherdefaultertootherBanksFlsifsostatusofNPATextController?.dispose();

    sailientopFocusNode?.dispose();
    sailientopTextController?.dispose();

    reasonsforsettlementofloanduesunderOTSFocusNode?.dispose();
    reasonsforsettlementofloanduesunderOTSTextController?.dispose();

    sourcesofpaymentofsettlementamountFocusNode?.dispose();
    sourcesofpaymentofsettlementamountTextController?.dispose();

    anyotherparticularsthatmayberelevanttomentionFocusNode?.dispose();
    anyotherparticularsthatmayberelevanttomentionTextController?.dispose();

    footerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController19?.dispose();

    textFieldFocusNode2?.dispose();
    textController20?.dispose();

    textFieldFocusNode3?.dispose();
    textController21?.dispose();

    textFieldFocusNode4?.dispose();
    textController22?.dispose();

    mobileVersionNotAvailableModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
