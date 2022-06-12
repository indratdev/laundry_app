class ValidationMixin {
  validateTxtFormField(String? value) {
    if (value!.isEmpty || value == '') {
      return 'Password tidak boleh kosong';
    }

    return null;
  }

  bool validatePasswordConfirm(String pass1, String pass2) {
    if (pass1 != pass2) {
      // return 'Password dan konfimasi password tidak sama';
      return false;
    }
    return true;
  }

  validationEmail(String? value) {
    print(value);
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }

    // using regular expression
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return "Format email tidak valid";
    }

    // valid email
    return null;
  }
}
