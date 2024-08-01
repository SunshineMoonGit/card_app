class SsValidator {
  static String? containNumber(value) {
    bool containsNum = RegExp(r'[0-9]').hasMatch(value);
    if (containsNum) {
      return '숫자는 입력할 수 없습니다.';
    }
    return null;
  }

  static String? email(value) {
    final isEmailFormat = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    if (!isEmailFormat) {
      return '이메일 형식이 잘못되었습니다.';
    }
    return null;
  }

  static String? name(value) {
    return null;
  }

  static String? team(value) {
    return null;
  }

  static String? phone(value) {
    return null;
  }

  static String? fax(value) {
    return null;
  }
}
