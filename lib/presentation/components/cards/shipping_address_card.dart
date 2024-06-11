import 'package:flutter/material.dart';
import 'package:open_fashion/constants/style_guides.dart';
import 'package:open_fashion/domain/entities/shipping_address.dart';

class ShippingAddressCard extends StatelessWidget {
  const ShippingAddressCard({super.key, required this.address, required this.selected, this.onTap});

  final ShippingAddress address;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: selected ? Border.all(color: AppColors.primary) : null,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${address.firstName} ${address.lastName}',
                  style: AppTextStyle.title(),
                ),
                Text(
                  address.address,
                  style: AppTextStyle.bodyM(color: AppColors.label),
                ),
                Text(
                  '${address.city} ${address.state} ${address.zipCode}',
                  style: AppTextStyle.bodyM(color: AppColors.label),
                ),
                Text(
                  address.phone,
                  style: AppTextStyle.bodyM(color: AppColors.label),
                ),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
