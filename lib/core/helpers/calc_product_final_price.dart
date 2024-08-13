double calculateFinalPrice(num oldPrice, num discountPercentage) {
  return oldPrice - (oldPrice * discountPercentage / 100);
}
