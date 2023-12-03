// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productDetailControllerHash() =>
    r'f35dd7bd2761d103a08574b914b641c590fe9cda';

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

abstract class _$ProductDetailController
    extends BuildlessAutoDisposeAsyncNotifier<List<Product>> {
  late final String erpCode;

  FutureOr<List<Product>> build(
    String erpCode,
  );
}

/// See also [ProductDetailController].
@ProviderFor(ProductDetailController)
const productDetailControllerProvider = ProductDetailControllerFamily();

/// See also [ProductDetailController].
class ProductDetailControllerFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [ProductDetailController].
  const ProductDetailControllerFamily();

  /// See also [ProductDetailController].
  ProductDetailControllerProvider call(
    String erpCode,
  ) {
    return ProductDetailControllerProvider(
      erpCode,
    );
  }

  @override
  ProductDetailControllerProvider getProviderOverride(
    covariant ProductDetailControllerProvider provider,
  ) {
    return call(
      provider.erpCode,
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
  String? get name => r'productDetailControllerProvider';
}

/// See also [ProductDetailController].
class ProductDetailControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ProductDetailController,
        List<Product>> {
  /// See also [ProductDetailController].
  ProductDetailControllerProvider(
    String erpCode,
  ) : this._internal(
          () => ProductDetailController()..erpCode = erpCode,
          from: productDetailControllerProvider,
          name: r'productDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productDetailControllerHash,
          dependencies: ProductDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              ProductDetailControllerFamily._allTransitiveDependencies,
          erpCode: erpCode,
        );

  ProductDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.erpCode,
  }) : super.internal();

  final String erpCode;

  @override
  FutureOr<List<Product>> runNotifierBuild(
    covariant ProductDetailController notifier,
  ) {
    return notifier.build(
      erpCode,
    );
  }

  @override
  Override overrideWith(ProductDetailController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProductDetailControllerProvider._internal(
        () => create()..erpCode = erpCode,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        erpCode: erpCode,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProductDetailController,
      List<Product>> createElement() {
    return _ProductDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailControllerProvider && other.erpCode == erpCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, erpCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductDetailControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Product>> {
  /// The parameter `erpCode` of this provider.
  String get erpCode;
}

class _ProductDetailControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProductDetailController,
        List<Product>> with ProductDetailControllerRef {
  _ProductDetailControllerProviderElement(super.provider);

  @override
  String get erpCode => (origin as ProductDetailControllerProvider).erpCode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
