// final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _pwdController = TextEditingController();
  // bool _isLoading = false; // Add this variable to track loading state

  // String? _validateEmail(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   }
  //    String pattern = r'^[^@]+@[^@]+\.[^@]+';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     return 'Enter a valid email address';
  //   }
  //   return null;
  // }

  // String? _validatePassword(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your password';
  //   }
  //   if (value.length < 6) {
  //     return 'Password must be at least 6 characters long';
  //   }
  //   String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+=-]).{6,}$';
  //   RegExp regex = RegExp(pattern);
  //   if (!regex.hasMatch(value)) {
  //     return 'Password must contain a letter, number and symbol';
  //   }
    
  //   return null;
  // }

  // Future<void> _submitForm() async{
  //   if (_formKey.currentState!.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     await Future.delayed(const Duration(seconds: 2)); // Simulate a delay of 2 seconds

  //     setState(() {
  //       _isLoading = false;
  //     });
  //     Get.to(() => const HomeScreen());
      // Perform the sign-in action
      // String email = _emailController.text;
      // String password = _pwdController.text;

      // For demonstration purposes, we'll just show a snackbar with the entered values
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     elevation: 0,
      //     behavior: SnackBarBehavior.floating,
      //     content: Text('Email: $email\nPassword: $password')),
      // );
    

  