abstract class HomeValidator {
  static String? hobbieValidator(String? input) {
    if (input?.isEmpty ?? true) return "Hobbie is required";
    if (input!.length < 2) return "Invalid hobbie";
    return null;
  }
}
