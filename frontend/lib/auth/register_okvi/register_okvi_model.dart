import '/backend/api_requests/api_calls.dart';
import '/components/footer/footer_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'register_okvi_widget.dart' show RegisterOkviWidget;
import 'package:flutter/material.dart';

class RegisterOkviModel extends FlutterFlowModel<RegisterOkviWidget> {
  ///  Local state fields for this page.

  List<dynamic> commite = [];
  void addToCommite(dynamic item) => commite.add(item);
  void removeFromCommite(dynamic item) => commite.remove(item);
  void removeAtIndexFromCommite(int index) => commite.removeAt(index);
  void insertAtIndexInCommite(int index, dynamic item) =>
      commite.insert(index, item);
  void updateCommiteAtIndex(int index, Function(dynamic) updateFn) =>
      commite[index] = updateFn(commite[index]);

  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for VerifyEmailTextField widget.
  FocusNode? verifyEmailTextFieldFocusNode;
  TextEditingController? verifyEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      verifyEmailTextFieldTextControllerValidator;
  String? _verifyEmailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i51d64kf' /* ⚠️ Please enter your email add... */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (Email Verifys)] action in Button widget.
  ApiCallResponse? sendEmailAPi;
  // State field(s) for OTPVerifyEmailTextField widget.
  FocusNode? oTPVerifyEmailTextFieldFocusNode;
  TextEditingController? oTPVerifyEmailTextFieldTextController;
  String? Function(BuildContext, String?)?
      oTPVerifyEmailTextFieldTextControllerValidator;
  String? _oTPVerifyEmailTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'tkiq8ait' /* ⚠️ Please enter the OTP sent t... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (OKVI Login)] action in Button widget.
  ApiCallResponse? otpVerifiedAPI;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nfbjem0o' /* Enter institution Name is requ... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode1;
  TextEditingController? emailTextFieldTextController1;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController1Validator;
  String? _emailTextFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iw9u8cri' /* Enter institution email ID is ... */,
      );
    }

    return null;
  }

  // State field(s) for DistrictDropDown widget.
  String? districtDropDownValue;
  FormFieldController<String>? districtDropDownValueController;
  // State field(s) for AadhaarNoTextField widget.
  FocusNode? aadhaarNoTextFieldFocusNode;
  TextEditingController? aadhaarNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      aadhaarNoTextFieldTextControllerValidator;
  String? _aadhaarNoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'nww8s927' /* Aadhaar No is required */,
      );
    }

    return null;
  }

  // State field(s) for GMDICRICTypeDropDown widget.
  String? gMDICRICTypeDropDownValue;
  FormFieldController<String>? gMDICRICTypeDropDownValueController;
  // State field(s) for PANNoTextField widget.
  FocusNode? pANNoTextFieldFocusNode;
  TextEditingController? pANNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      pANNoTextFieldTextControllerValidator;
  String? _pANNoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x0qf4wvy' /* PaAN No (Ex. AAOPG6543T) is re... */,
      );
    }

    return null;
  }

  // State field(s) for GSTRegistrationNoTextField widget.
  FocusNode? gSTRegistrationNoTextFieldFocusNode;
  TextEditingController? gSTRegistrationNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      gSTRegistrationNoTextFieldTextControllerValidator;
  String? _gSTRegistrationNoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'uxptvogi' /* GST Registration No  (Ex. 07AA... */,
      );
    }

    return null;
  }

  // State field(s) for AddressTextField widget.
  FocusNode? addressTextFieldFocusNode;
  TextEditingController? addressTextFieldTextController;
  String? Function(BuildContext, String?)?
      addressTextFieldTextControllerValidator;
  String? _addressTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ngq7eiau' /* Enter institution address is r... */,
      );
    }

    return null;
  }

  // State field(s) for RegdWithADMDICTextField widget.
  FocusNode? regdWithADMDICTextFieldFocusNode;
  TextEditingController? regdWithADMDICTextFieldTextController;
  String? Function(BuildContext, String?)?
      regdWithADMDICTextFieldTextControllerValidator;
  String? _regdWithADMDICTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'iw7jko5n' /* Enter regd. with ADM/DIC is re... */,
      );
    }

    return null;
  }

  // State field(s) for ADMDICRegdNoTextField widget.
  FocusNode? aDMDICRegdNoTextFieldFocusNode;
  TextEditingController? aDMDICRegdNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      aDMDICRegdNoTextFieldTextControllerValidator;
  String? _aDMDICRegdNoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0ltuqrq3' /* Enter ADM/DIC regd. no is requ... */,
      );
    }

    return null;
  }

  // State field(s) for OKVIBRegdNoTextField widget.
  FocusNode? oKVIBRegdNoTextFieldFocusNode;
  TextEditingController? oKVIBRegdNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      oKVIBRegdNoTextFieldTextControllerValidator;
  String? _oKVIBRegdNoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '1700o60l' /* Enter OKVIB regd. no is requir... */,
      );
    }

    return null;
  }

  // State field(s) for RegdWithKVICTextField widget.
  FocusNode? regdWithKVICTextFieldFocusNode;
  TextEditingController? regdWithKVICTextFieldTextController;
  String? Function(BuildContext, String?)?
      regdWithKVICTextFieldTextControllerValidator;
  String? _regdWithKVICTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'dzrwa2x9' /* Enter regd. with KVIC is requi... */,
      );
    }

    return null;
  }

  // State field(s) for KVICRegdNoTextField widget.
  FocusNode? kVICRegdNoTextFieldFocusNode;
  TextEditingController? kVICRegdNoTextFieldTextController;
  String? Function(BuildContext, String?)?
      kVICRegdNoTextFieldTextControllerValidator;
  String? _kVICRegdNoTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2na126tf' /* Enter KVIC regd. no is require... */,
      );
    }

    return null;
  }

  DateTime? datePicked;
  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode2;
  TextEditingController? emailTextFieldTextController2;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController2Validator;
  String? _emailTextFieldTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jwk5dehl' /* Enter bank A/C no is required */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode3;
  TextEditingController? emailTextFieldTextController3;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController3Validator;
  String? _emailTextFieldTextController3Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '7gw07fmx' /* Enter A/C holder name is requi... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode4;
  TextEditingController? emailTextFieldTextController4;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController4Validator;
  String? _emailTextFieldTextController4Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yq7thzjj' /* Enter IFSC code is required */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode5;
  TextEditingController? emailTextFieldTextController5;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController5Validator;
  String? _emailTextFieldTextController5Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'v88v5n5d' /* Enter name of the Bank/Branch ... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode6;
  TextEditingController? emailTextFieldTextController6;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController6Validator;
  String? _emailTextFieldTextController6Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '8tcqoowd' /* Enter secretary name is requir... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode7;
  TextEditingController? emailTextFieldTextController7;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController7Validator;
  String? _emailTextFieldTextController7Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '3hyyr2rr' /* Enter secretary mobile no is r... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode8;
  TextEditingController? emailTextFieldTextController8;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController8Validator;
  String? _emailTextFieldTextController8Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'ojv8r20n' /* Enter secretary address is req... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode9;
  TextEditingController? emailTextFieldTextController9;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController9Validator;
  String? _emailTextFieldTextController9Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'p2ub01yh' /* Enter president name is requir... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode10;
  TextEditingController? emailTextFieldTextController10;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController10Validator;
  String? _emailTextFieldTextController10Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '65ktbe8a' /* Enter president mobile no is r... */,
      );
    }

    return null;
  }

  // State field(s) for EmailTextField widget.
  FocusNode? emailTextFieldFocusNode11;
  TextEditingController? emailTextFieldTextController11;
  String? Function(BuildContext, String?)?
      emailTextFieldTextController11Validator;
  String? _emailTextFieldTextController11Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'bi7wuk3w' /* Enter president address is req... */,
      );
    }

    return null;
  }

  // State field(s) for CommiteeName widget.
  FocusNode? commiteeNameFocusNode;
  TextEditingController? commiteeNameTextController;
  String? Function(BuildContext, String?)? commiteeNameTextControllerValidator;
  String? _commiteeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6mbbq9lz' /* Enter commitee member name is ... */,
      );
    }

    return null;
  }

  // State field(s) for CommiteeMibileNo widget.
  FocusNode? commiteeMibileNoFocusNode;
  TextEditingController? commiteeMibileNoTextController;
  String? Function(BuildContext, String?)?
      commiteeMibileNoTextControllerValidator;
  String? _commiteeMibileNoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'avzwi2mq' /* Enter commitee member mobile n... */,
      );
    }

    return null;
  }

  // State field(s) for CommiteeAdress widget.
  FocusNode? commiteeAdressFocusNode;
  TextEditingController? commiteeAdressTextController;
  String? Function(BuildContext, String?)?
      commiteeAdressTextControllerValidator;
  String? _commiteeAdressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'hauh3ouk' /* Enter commitee member address ... */,
      );
    }

    return null;
  }

  // State field(s) for PasswordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldTextController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      passwordTextFieldTextControllerValidator;
  String? _passwordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'x3827kqt' /* Password is required */,
      );
    }

    return null;
  }

  // State field(s) for Re-PasswordTextField widget.
  FocusNode? rePasswordTextFieldFocusNode;
  TextEditingController? rePasswordTextFieldTextController;
  late bool rePasswordTextFieldVisibility;
  String? Function(BuildContext, String?)?
      rePasswordTextFieldTextControllerValidator;
  String? _rePasswordTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'roj8mmoz' /* Password is required */,
      );
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in btn_login widget.
  bool? formRegister;
  // Stores action output result for [Backend Call - API (OKVI Register)] action in btn_login widget.
  ApiCallResponse? registerApi;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    verifyEmailTextFieldTextControllerValidator =
        _verifyEmailTextFieldTextControllerValidator;
    oTPVerifyEmailTextFieldTextControllerValidator =
        _oTPVerifyEmailTextFieldTextControllerValidator;
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    emailTextFieldTextController1Validator =
        _emailTextFieldTextController1Validator;
    aadhaarNoTextFieldTextControllerValidator =
        _aadhaarNoTextFieldTextControllerValidator;
    pANNoTextFieldTextControllerValidator =
        _pANNoTextFieldTextControllerValidator;
    gSTRegistrationNoTextFieldTextControllerValidator =
        _gSTRegistrationNoTextFieldTextControllerValidator;
    addressTextFieldTextControllerValidator =
        _addressTextFieldTextControllerValidator;
    regdWithADMDICTextFieldTextControllerValidator =
        _regdWithADMDICTextFieldTextControllerValidator;
    aDMDICRegdNoTextFieldTextControllerValidator =
        _aDMDICRegdNoTextFieldTextControllerValidator;
    oKVIBRegdNoTextFieldTextControllerValidator =
        _oKVIBRegdNoTextFieldTextControllerValidator;
    regdWithKVICTextFieldTextControllerValidator =
        _regdWithKVICTextFieldTextControllerValidator;
    kVICRegdNoTextFieldTextControllerValidator =
        _kVICRegdNoTextFieldTextControllerValidator;
    emailTextFieldTextController2Validator =
        _emailTextFieldTextController2Validator;
    emailTextFieldTextController3Validator =
        _emailTextFieldTextController3Validator;
    emailTextFieldTextController4Validator =
        _emailTextFieldTextController4Validator;
    emailTextFieldTextController5Validator =
        _emailTextFieldTextController5Validator;
    emailTextFieldTextController6Validator =
        _emailTextFieldTextController6Validator;
    emailTextFieldTextController7Validator =
        _emailTextFieldTextController7Validator;
    emailTextFieldTextController8Validator =
        _emailTextFieldTextController8Validator;
    emailTextFieldTextController9Validator =
        _emailTextFieldTextController9Validator;
    emailTextFieldTextController10Validator =
        _emailTextFieldTextController10Validator;
    emailTextFieldTextController11Validator =
        _emailTextFieldTextController11Validator;
    commiteeNameTextControllerValidator = _commiteeNameTextControllerValidator;
    commiteeMibileNoTextControllerValidator =
        _commiteeMibileNoTextControllerValidator;
    commiteeAdressTextControllerValidator =
        _commiteeAdressTextControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldTextControllerValidator =
        _passwordTextFieldTextControllerValidator;
    rePasswordTextFieldVisibility = false;
    rePasswordTextFieldTextControllerValidator =
        _rePasswordTextFieldTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    verifyEmailTextFieldFocusNode?.dispose();
    verifyEmailTextFieldTextController?.dispose();

    oTPVerifyEmailTextFieldFocusNode?.dispose();
    oTPVerifyEmailTextFieldTextController?.dispose();

    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    emailTextFieldFocusNode1?.dispose();
    emailTextFieldTextController1?.dispose();

    aadhaarNoTextFieldFocusNode?.dispose();
    aadhaarNoTextFieldTextController?.dispose();

    pANNoTextFieldFocusNode?.dispose();
    pANNoTextFieldTextController?.dispose();

    gSTRegistrationNoTextFieldFocusNode?.dispose();
    gSTRegistrationNoTextFieldTextController?.dispose();

    addressTextFieldFocusNode?.dispose();
    addressTextFieldTextController?.dispose();

    regdWithADMDICTextFieldFocusNode?.dispose();
    regdWithADMDICTextFieldTextController?.dispose();

    aDMDICRegdNoTextFieldFocusNode?.dispose();
    aDMDICRegdNoTextFieldTextController?.dispose();

    oKVIBRegdNoTextFieldFocusNode?.dispose();
    oKVIBRegdNoTextFieldTextController?.dispose();

    regdWithKVICTextFieldFocusNode?.dispose();
    regdWithKVICTextFieldTextController?.dispose();

    kVICRegdNoTextFieldFocusNode?.dispose();
    kVICRegdNoTextFieldTextController?.dispose();

    emailTextFieldFocusNode2?.dispose();
    emailTextFieldTextController2?.dispose();

    emailTextFieldFocusNode3?.dispose();
    emailTextFieldTextController3?.dispose();

    emailTextFieldFocusNode4?.dispose();
    emailTextFieldTextController4?.dispose();

    emailTextFieldFocusNode5?.dispose();
    emailTextFieldTextController5?.dispose();

    emailTextFieldFocusNode6?.dispose();
    emailTextFieldTextController6?.dispose();

    emailTextFieldFocusNode7?.dispose();
    emailTextFieldTextController7?.dispose();

    emailTextFieldFocusNode8?.dispose();
    emailTextFieldTextController8?.dispose();

    emailTextFieldFocusNode9?.dispose();
    emailTextFieldTextController9?.dispose();

    emailTextFieldFocusNode10?.dispose();
    emailTextFieldTextController10?.dispose();

    emailTextFieldFocusNode11?.dispose();
    emailTextFieldTextController11?.dispose();

    commiteeNameFocusNode?.dispose();
    commiteeNameTextController?.dispose();

    commiteeMibileNoFocusNode?.dispose();
    commiteeMibileNoTextController?.dispose();

    commiteeAdressFocusNode?.dispose();
    commiteeAdressTextController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldTextController?.dispose();

    rePasswordTextFieldFocusNode?.dispose();
    rePasswordTextFieldTextController?.dispose();

    footerModel.dispose();
  }
}
