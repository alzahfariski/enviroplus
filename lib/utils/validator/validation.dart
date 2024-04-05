class TValidtor {
  static String? validateEmptyText(String? value) {
    if (value == null || value.isEmpty) {
      return 'Tidak Boleh Kosong';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

  static String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    }

    if (value.length < 6) {
      return 'password terlalu pendek';
    }

    return null;
  }

  static String? validateNrp(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nrp number is required.';
    }
    final nrpRegExp = RegExp(r'^\d{8}$');

    if (!nrpRegExp.hasMatch(value)) {
      return 'Invalid Nrp number format (8 digits required).';
    }

    return null;
  }

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Weight is required.';
    }
    final nrpRegExp = RegExp(r'^\d{2}$');

    if (!nrpRegExp.hasMatch(value)) {
      return 'Invalid Weight format (2 digits required).';
    }

    return null;
  }

  static String? validateHeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Height is required.';
    }
    final nrpRegExp = RegExp(r'^\d{3}$');

    if (!nrpRegExp.hasMatch(value)) {
      return 'Invalid Height format (3 digits required).';
    }

    return null;
  }
}
