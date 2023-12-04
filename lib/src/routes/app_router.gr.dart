// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:starter_app/src/features/app/presentation/views/skeleton_page.dart'
    as _i2;
import 'package:starter_app/src/features/product/presentation/product_detail_page.dart'
    as _i1;
import 'package:starter_app/src/features/splash/presentation/splash_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ProductDatailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDatailRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ProductDatailPage(
          args.productCode,
          args.erpCode,
          args.productName,
          args.price,
          args.imageUrl,
          key: args.key,
        ),
      );
    },
    SkeletonRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SkeletonPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ProductDatailPage]
class ProductDatailRoute extends _i4.PageRouteInfo<ProductDatailRouteArgs> {
  ProductDatailRoute({
    required String productCode,
    required String erpCode,
    required String productName,
    required String price,
    required String imageUrl,
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          ProductDatailRoute.name,
          args: ProductDatailRouteArgs(
            productCode: productCode,
            erpCode: erpCode,
            productName: productName,
            price: price,
            imageUrl: imageUrl,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDatailRoute';

  static const _i4.PageInfo<ProductDatailRouteArgs> page =
      _i4.PageInfo<ProductDatailRouteArgs>(name);
}

class ProductDatailRouteArgs {
  const ProductDatailRouteArgs({
    required this.productCode,
    required this.erpCode,
    required this.productName,
    required this.price,
    required this.imageUrl,
    this.key,
  });

  final String productCode;

  final String erpCode;

  final String productName;

  final String price;

  final String imageUrl;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ProductDatailRouteArgs{productCode: $productCode, erpCode: $erpCode, productName: $productName, price: $price, imageUrl: $imageUrl, key: $key}';
  }
}

/// generated route for
/// [_i2.SkeletonPage]
class SkeletonRoute extends _i4.PageRouteInfo<void> {
  const SkeletonRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SkeletonRoute.name,
          initialChildren: children,
        );

  static const String name = 'SkeletonRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashPage]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
