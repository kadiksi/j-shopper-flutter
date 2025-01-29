import '../../models/ApiResponse';

abstract class ProductAbstractRepository {
  Future<ApiResponse> getProductByText(String search);
}
