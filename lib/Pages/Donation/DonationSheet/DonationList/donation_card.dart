import 'package:flutter/material.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';

class DonationNGOCard extends StatelessWidget {
  final NGOModel ngo;
  final bool isCard;
  final bool isSelected;

  const DonationNGOCard({
    super.key,
    required this.ngo,
    required this.isCard,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isSelected
            ? theme.primaryColor.withOpacity(0.1)
            : theme.cardColor,
        border: Border.all(
          color: isSelected
              ? theme.primaryColor
              : theme.dividerColor.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.primaryColor.withOpacity(0.1),
            ),
            child: Icon(
              isCard ? Icons.credit_card : Icons.account_balance,
              size: 18,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: isCard
                ? const Text(
                    "Pay with Card (Stripe)",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ngo.ngoName!),
                      Text(ngo.bankName!),
                      Text(ngo.accountNo!),
                    ],
                  ),
          ),
          if (isSelected)
            Icon(Icons.check_circle, color: theme.primaryColor),
        ],
      ),
    );
  }
}