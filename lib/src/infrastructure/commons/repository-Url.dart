class RepositoryUrl {
  static const String webBaseUrl = 'localhost:3000';
  static const String emulatorBaseUrl = '10.0.2.2:3000';
  static const String getProduct = '/product';

  static String deleteProduct(String id) => '/product/$id';

  static String editProduct(String id) => '/product/$id';
}
