class Endpoints {
  static const String _apiPrefix = '/api/v1/shop-mobile';
  static const String _productDivision = '/product-divisions';

  // product
  static const String _baseProduct = '$_apiPrefix/products';
  static const String products = _baseProduct;

  // cateogry
  // first category
  static const String _baseFirstCategory = '$_apiPrefix$_productDivision';
  static const String firstCategory = _baseFirstCategory;

  // second category
  static const String _baseSecondCategory =
      '$_apiPrefix$_productDivision/item-categories';

  static const String secondCategory = _baseSecondCategory;

  // third caetgory

  static const String _baseThirdCategory =
      '$_apiPrefix$_productDivision/product-groups';

  static const String thirdCategory = _baseThirdCategory;
}
