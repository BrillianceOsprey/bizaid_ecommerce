// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firstCategoryListHash() => r'baf5e198b108decbcf994408d7263e89a93ede38';

/// See also [FirstCategoryList].
@ProviderFor(FirstCategoryList)
final firstCategoryListProvider = AutoDisposeAsyncNotifierProvider<
    FirstCategoryList, List<FirstCategory>>.internal(
  FirstCategoryList.new,
  name: r'firstCategoryListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firstCategoryListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FirstCategoryList = AutoDisposeAsyncNotifier<List<FirstCategory>>;
String _$secondCategoryListHash() =>
    r'592c05465d9aab826e04a021b0a1a26b7d29afdc';

/// See also [SecondCategoryList].
@ProviderFor(SecondCategoryList)
final secondCategoryListProvider = AutoDisposeAsyncNotifierProvider<
    SecondCategoryList, List<SecondLevelCategory>>.internal(
  SecondCategoryList.new,
  name: r'secondCategoryListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$secondCategoryListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SecondCategoryList
    = AutoDisposeAsyncNotifier<List<SecondLevelCategory>>;
String _$thirdCategoryListHash() => r'cab30330d9e5825e82e869216ef8092de3ca2892';

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

abstract class _$ThirdCategoryList
    extends BuildlessAutoDisposeAsyncNotifier<List<ThirdLevelCategory>> {
  late final String itemCategoryId;

  FutureOr<List<ThirdLevelCategory>> build(
    String itemCategoryId,
  );
}

/// See also [ThirdCategoryList].
@ProviderFor(ThirdCategoryList)
const thirdCategoryListProvider = ThirdCategoryListFamily();

/// See also [ThirdCategoryList].
class ThirdCategoryListFamily
    extends Family<AsyncValue<List<ThirdLevelCategory>>> {
  /// See also [ThirdCategoryList].
  const ThirdCategoryListFamily();

  /// See also [ThirdCategoryList].
  ThirdCategoryListProvider call(
    String itemCategoryId,
  ) {
    return ThirdCategoryListProvider(
      itemCategoryId,
    );
  }

  @override
  ThirdCategoryListProvider getProviderOverride(
    covariant ThirdCategoryListProvider provider,
  ) {
    return call(
      provider.itemCategoryId,
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
  String? get name => r'thirdCategoryListProvider';
}

/// See also [ThirdCategoryList].
class ThirdCategoryListProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ThirdCategoryList, List<ThirdLevelCategory>> {
  /// See also [ThirdCategoryList].
  ThirdCategoryListProvider(
    String itemCategoryId,
  ) : this._internal(
          () => ThirdCategoryList()..itemCategoryId = itemCategoryId,
          from: thirdCategoryListProvider,
          name: r'thirdCategoryListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$thirdCategoryListHash,
          dependencies: ThirdCategoryListFamily._dependencies,
          allTransitiveDependencies:
              ThirdCategoryListFamily._allTransitiveDependencies,
          itemCategoryId: itemCategoryId,
        );

  ThirdCategoryListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.itemCategoryId,
  }) : super.internal();

  final String itemCategoryId;

  @override
  FutureOr<List<ThirdLevelCategory>> runNotifierBuild(
    covariant ThirdCategoryList notifier,
  ) {
    return notifier.build(
      itemCategoryId,
    );
  }

  @override
  Override overrideWith(ThirdCategoryList Function() create) {
    return ProviderOverride(
      origin: this,
      override: ThirdCategoryListProvider._internal(
        () => create()..itemCategoryId = itemCategoryId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        itemCategoryId: itemCategoryId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ThirdCategoryList,
      List<ThirdLevelCategory>> createElement() {
    return _ThirdCategoryListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ThirdCategoryListProvider &&
        other.itemCategoryId == itemCategoryId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, itemCategoryId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ThirdCategoryListRef
    on AutoDisposeAsyncNotifierProviderRef<List<ThirdLevelCategory>> {
  /// The parameter `itemCategoryId` of this provider.
  String get itemCategoryId;
}

class _ThirdCategoryListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ThirdCategoryList,
        List<ThirdLevelCategory>> with ThirdCategoryListRef {
  _ThirdCategoryListProviderElement(super.provider);

  @override
  String get itemCategoryId =>
      (origin as ThirdCategoryListProvider).itemCategoryId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
