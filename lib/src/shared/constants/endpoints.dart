class Endpoints {
  static const String _apiPrefix = '/api/v1/shop-mobile';
  static const String _productDivision = '/product-divisions';

  // product
  static const String _baseProduct = '$_apiPrefix/products';
  static const String products = _baseProduct;

  // cateogry
  // first category
  static const String _baseCategory = '$_apiPrefix$_productDivision';
  static const String firstCategory = _baseCategory;
}
