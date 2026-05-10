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
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected
            ? theme.primaryColor.withOpacity(0.08)
            : theme.cardColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isSelected
              ? theme.primaryColor
              : Colors.grey.withOpacity(0.12),
          width: isSelected ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Leading Icon
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withOpacity(0.18),
                  theme.primaryColor.withOpacity(0.08),
                ],
              ),
            ),
            child: Icon(
              isCard ? Icons.credit_card_rounded : Icons.account_balance,
              color: theme.primaryColor,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          /// Content
          Expanded(
            child: isCard
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pay with Card",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Secure online payment",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ngo.ngoName!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Icon(
                            Icons.account_balance_outlined,
                            size: 14,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              ngo.bankName!,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: 
                          theme.cardColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          ngo.accountNo!,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.4,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),

          const SizedBox(width: 8),

          /// Selected Indicator
          AnimatedScale(
            scale: isSelected ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: theme.primaryColor,
              ),
              child: const Icon(
                Icons.check,
                size: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}