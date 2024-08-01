// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_form_field_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TextFormFieldModel {
  Icon? get icon => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  TextEditingController get controller => throw _privateConstructorUsedError;
  String? Function(String)? get validator => throw _privateConstructorUsedError;
  List<TextInputFormatter>? get inputFormatters =>
      throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextFormFieldModelCopyWith<TextFormFieldModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFormFieldModelCopyWith<$Res> {
  factory $TextFormFieldModelCopyWith(
          TextFormFieldModel value, $Res Function(TextFormFieldModel) then) =
      _$TextFormFieldModelCopyWithImpl<$Res, TextFormFieldModel>;
  @useResult
  $Res call(
      {Icon? icon,
      String title,
      TextEditingController controller,
      String? Function(String)? validator,
      List<TextInputFormatter>? inputFormatters,
      bool obscureText});
}

/// @nodoc
class _$TextFormFieldModelCopyWithImpl<$Res, $Val extends TextFormFieldModel>
    implements $TextFormFieldModelCopyWith<$Res> {
  _$TextFormFieldModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? title = null,
    Object? controller = null,
    Object? validator = freezed,
    Object? inputFormatters = freezed,
    Object? obscureText = null,
  }) {
    return _then(_value.copyWith(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      validator: freezed == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String? Function(String)?,
      inputFormatters: freezed == inputFormatters
          ? _value.inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextFormFieldModelImplCopyWith<$Res>
    implements $TextFormFieldModelCopyWith<$Res> {
  factory _$$TextFormFieldModelImplCopyWith(_$TextFormFieldModelImpl value,
          $Res Function(_$TextFormFieldModelImpl) then) =
      __$$TextFormFieldModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Icon? icon,
      String title,
      TextEditingController controller,
      String? Function(String)? validator,
      List<TextInputFormatter>? inputFormatters,
      bool obscureText});
}

/// @nodoc
class __$$TextFormFieldModelImplCopyWithImpl<$Res>
    extends _$TextFormFieldModelCopyWithImpl<$Res, _$TextFormFieldModelImpl>
    implements _$$TextFormFieldModelImplCopyWith<$Res> {
  __$$TextFormFieldModelImplCopyWithImpl(_$TextFormFieldModelImpl _value,
      $Res Function(_$TextFormFieldModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = freezed,
    Object? title = null,
    Object? controller = null,
    Object? validator = freezed,
    Object? inputFormatters = freezed,
    Object? obscureText = null,
  }) {
    return _then(_$TextFormFieldModelImpl(
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Icon?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      validator: freezed == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as String? Function(String)?,
      inputFormatters: freezed == inputFormatters
          ? _value._inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TextFormFieldModelImpl implements _TextFormFieldModel {
  const _$TextFormFieldModelImpl(
      {this.icon,
      required this.title,
      required this.controller,
      this.validator,
      final List<TextInputFormatter>? inputFormatters,
      this.obscureText = false})
      : _inputFormatters = inputFormatters;

  @override
  final Icon? icon;
  @override
  final String title;
  @override
  final TextEditingController controller;
  @override
  final String? Function(String)? validator;
  final List<TextInputFormatter>? _inputFormatters;
  @override
  List<TextInputFormatter>? get inputFormatters {
    final value = _inputFormatters;
    if (value == null) return null;
    if (_inputFormatters is EqualUnmodifiableListView) return _inputFormatters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool obscureText;

  @override
  String toString() {
    return 'TextFormFieldModel(icon: $icon, title: $title, controller: $controller, validator: $validator, inputFormatters: $inputFormatters, obscureText: $obscureText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextFormFieldModelImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            const DeepCollectionEquality()
                .equals(other._inputFormatters, _inputFormatters) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      icon,
      title,
      controller,
      validator,
      const DeepCollectionEquality().hash(_inputFormatters),
      obscureText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TextFormFieldModelImplCopyWith<_$TextFormFieldModelImpl> get copyWith =>
      __$$TextFormFieldModelImplCopyWithImpl<_$TextFormFieldModelImpl>(
          this, _$identity);
}

abstract class _TextFormFieldModel implements TextFormFieldModel {
  const factory _TextFormFieldModel(
      {final Icon? icon,
      required final String title,
      required final TextEditingController controller,
      final String? Function(String)? validator,
      final List<TextInputFormatter>? inputFormatters,
      final bool obscureText}) = _$TextFormFieldModelImpl;

  @override
  Icon? get icon;
  @override
  String get title;
  @override
  TextEditingController get controller;
  @override
  String? Function(String)? get validator;
  @override
  List<TextInputFormatter>? get inputFormatters;
  @override
  bool get obscureText;
  @override
  @JsonKey(ignore: true)
  _$$TextFormFieldModelImplCopyWith<_$TextFormFieldModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
