// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_bar_icon_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bottomNavigationBarIconHash() =>
    r'7beff3db15c7d68781c546d9ea0be5cf936473a4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [bottomNavigationBarIcon].
@ProviderFor(bottomNavigationBarIcon)
const bottomNavigationBarIconProvider = BottomNavigationBarIconFamily();

/// See also [bottomNavigationBarIcon].
class BottomNavigationBarIconFamily
    extends Family<List<BottomNavigationBarIconModel>> {
  /// See also [bottomNavigationBarIcon].
  const BottomNavigationBarIconFamily();

  /// See also [bottomNavigationBarIcon].
  BottomNavigationBarIconProvider call(
    BuildContext context,
  ) {
    return BottomNavigationBarIconProvider(
      context,
    );
  }

  @override
  BottomNavigationBarIconProvider getProviderOverride(
    covariant BottomNavigationBarIconProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bottomNavigationBarIconProvider';
}

/// See also [bottomNavigationBarIcon].
class BottomNavigationBarIconProvider
    extends AutoDisposeProvider<List<BottomNavigationBarIconModel>> {
  /// See also [bottomNavigationBarIcon].
  BottomNavigationBarIconProvider(
    BuildContext context,
  ) : this._internal(
          (ref) => bottomNavigationBarIcon(
            ref as BottomNavigationBarIconRef,
            context,
          ),
          from: bottomNavigationBarIconProvider,
          name: r'bottomNavigationBarIconProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bottomNavigationBarIconHash,
          dependencies: BottomNavigationBarIconFamily._dependencies,
          allTransitiveDependencies:
              BottomNavigationBarIconFamily._allTransitiveDependencies,
          context: context,
        );

  BottomNavigationBarIconProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.context,
  }) : super.internal();

  final BuildContext context;

  @override
  Override overrideWith(
    List<BottomNavigationBarIconModel> Function(
            BottomNavigationBarIconRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BottomNavigationBarIconProvider._internal(
        (ref) => create(ref as BottomNavigationBarIconRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        context: context,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<BottomNavigationBarIconModel>>
      createElement() {
    return _BottomNavigationBarIconProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BottomNavigationBarIconProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BottomNavigationBarIconRef
    on AutoDisposeProviderRef<List<BottomNavigationBarIconModel>> {
  /// The parameter `context` of this provider.
  BuildContext get context;
}

class _BottomNavigationBarIconProviderElement
    extends AutoDisposeProviderElement<List<BottomNavigationBarIconModel>>
    with BottomNavigationBarIconRef {
  _BottomNavigationBarIconProviderElement(super.provider);

  @override
  BuildContext get context =>
      (origin as BottomNavigationBarIconProvider).context;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
