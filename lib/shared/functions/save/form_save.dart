
// class Save {
//   static void textForms({
//     required bool isSignUp,
//     required ControllerManager controllers,
//     required WidgetRef ref,
//     required BuildContext context,
//     required GlobalKey<FormState> formKey,
//   }) async {
//     if (formKey.currentState?.validate() ?? false) {
//       final UserInfoEntity newData = UserInfoEntity();
//       //! final UserInfoEntity newData = UserInfoEntity.fromController(controllers: controllers);

//       if (isSignUp) {
//         try {
//           ref.read(authInfoProvider.notifier).update(newData);
//           context.go(HomePage.route);
//         } catch (e) {
//           ssPrint(e, 'new_user_input_screen');
//         }
//       } else {
//         AppMethod(ref).addFollowing(UpdateType.add, newData);
//       }
//     }
//   }
// }
