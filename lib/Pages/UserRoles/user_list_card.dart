// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:fyp_project/Model/userModel/user_model.dart';
import 'package:fyp_project/Pages/UserRoles/assign_roles_dropdown.dart';


class UserListCard extends StatelessWidget {
  final UserModel userModel;
  const UserListCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: theme.primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 25,
            backgroundColor: theme.primaryColor.withOpacity(0.1),
            child: Text(
              userModel.email![0].toUpperCase(),
              style: TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // NGO Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userModel.email!,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  userModel.token!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.hintColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                      userModel.userRole!.name,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
              ],
            ),
          ),

          const SizedBox(width: 10),

          UserRoleDropDown(userId: userModel.id, userRole: userModel.userRole!),
        ],
      ),
    );
  }
}
