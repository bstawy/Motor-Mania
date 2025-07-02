import '../../../../core/networking/api_result.dart';
import '../../data/models/new_payment_method_model.dart';
import '../entities/payment_method_entity.dart';

abstract class PaymentMethodsRepo {
  Future<ApiResult<List<PaymentMethodEntity>?>> getAllPaymentMethods();
  Future<ApiResult<void>> addPaymentMethod(
      NewPaymentMethodModel newPaymentMethod);
  Future<ApiResult<num>> getWalletBalance();
  Future<ApiResult<num>> depositeToWallet(String paymentMethodId, num amount);
}
