enum AuthState {
  initial, // 초기 상태
  loading, // 인증 진행 중
  authenticated, // 인증됨
  authenticatedButIncomplete, // 인증은 되었지만 정보가 불완전함
  unauthenticated, // 인증되지 않음
  error // 오류 발생
}

enum UpdateType { add, delete, change }

enum GetImageMethod { gallery, camera }

enum SettingType { main, auth, profile, theme, language }

enum SettingRowType { string, bool, check }

enum CType { signIn, signUp, newCard }

enum UserType { normal, premium, master }
