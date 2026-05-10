// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fyp_project/Model/userModel/user_model.dart';
import 'package:fyp_project/Pages/UserRoles/UserCard/user_action_card.dart';
import 'package:fyp_project/Pages/UserRoles/assign_roles_dropdown.dart';
import 'package:fyp_project/config/Components/custom_circle_avatar.dart';
import 'package:fyp_project/config/routes/routes_arguments/userDonation_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';

class UserListCard extends StatelessWidget {
  final UserModel userModel;

  const UserListCard({
    super.key,
    required this.userModel,
  });

  IconData _roleIcon(String role) {
    switch (role.toLowerCase()) {
      case "admin":
        return Icons.admin_panel_settings_rounded;

      case "ngo":
        return Icons.volunteer_activism_rounded;

      default:
        return Icons.person_rounded;
    }
  }

  Color _roleColor(BuildContext context, String role) {
    switch (role.toLowerCase()) {
      case "admin":
        return Colors.orange;

      case "user":
        return Colors.green;

      default:
        return Theme.of(context).colorScheme.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final size = MediaQuery.of(context).size;
    final width = size.width;

    final roleName = userModel.userRole!.name;

    return Container(
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: !isDark? const Color.fromARGB(255, 253, 252, 252): null,
        gradient: isDark?
         LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,

          colors:
              isDark
                  ? [
                    const Color(0xff111827),
                    const Color(0xff1E293B),
                    const Color(0xff0F172A),
                  ]
                  : [
                    theme.colorScheme.surface.withOpacity(0.5),
                    theme.colorScheme.primary.withOpacity(.01),
                  ],
        ):null,

        border: Border.all(
          color:
              isDark
                  ? Colors.white.withOpacity(.05)
                  : theme.colorScheme.primary.withOpacity(.08),
        ),

        boxShadow: [
          BoxShadow(
            color:
                isDark
                    ? Colors.black.withOpacity(.24)
                    : Colors.black.withOpacity(.05),
            blurRadius: 18,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
      ),

      child: Material(
        color: Colors.transparent,

        child: InkWell(
          borderRadius: BorderRadius.circular(28),

          onTap: () {},

          child: Padding(
            padding: EdgeInsets.all(width * .04),

            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Hero(
                      tag: userModel.id,

                      child: CustomCircleAvatar(
                        radius: 34 ,
                        userName: userModel.profileUrl!)
                    ),

                    SizedBox(width: width * .035),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            userModel.email ?? "",

                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,

                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: width * .041,
                            ),
                          ),

                          SizedBox(height: width * .015),

                          Row(
                            children: [
                              Icon(
                                Icons.verified_user_rounded,
                                size: width * .04,
                                color: theme.colorScheme.primary,
                              ),

                              SizedBox(width: width * .015),

                              Expanded(
                                child: Text(
                                  userModel.token ?? "",

                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,

                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontSize: width * .03,

                                    color:
                                        isDark
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade700,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: width * .025),

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * .03,
                              vertical: width * .015,
                            ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),

                              color: _roleColor(
                                context,
                                roleName,
                              ).withOpacity(.12),
                            ),

                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Icon(
                                  _roleIcon(roleName),
                                  size: width * .04,
                                  color: _roleColor(context, roleName),
                                ),

                                SizedBox(width: width * .015),

                                Flexible(
                                  child: Text(
                                    roleName.toUpperCase(),

                                    overflow: TextOverflow.ellipsis,

                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontSize: width * .028,
                                      color: _roleColor(context, roleName),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: width * .02),

                   
                  ],
                ),

                SizedBox(height: width * .05),

                LayoutBuilder(
                  builder: (context, constraints) {
                    final isSmall =
                        constraints.maxWidth < 420;

                    return Flex(
                      direction:
                          isSmall
                              ? Axis.vertical
                              : Axis.horizontal,

                      children: [
                        Expanded(
                          flex: isSmall ? 0 : 1,

                          child: GestureDetector(
                            onTap: (){
                                Navigator.pushNamed(
                                  context, 
                                  RoutesName.userDonationScreen,
                                  arguments: UserdonationArguments(userId: userModel.token!, isAdmin: true));
                            },
                            child: ActionCard(
                              isDark: isDark,
                              icon: Icons.volunteer_activism_rounded,
                              title: "Donations",
                              subTitle: "View Activity",
                              color: Colors.pink,
                              theme: theme,
                            ),
                          ),
                        ),

                        SizedBox(
                          width: isSmall ? 0 : 14,
                          height: isSmall ? 14 : 0,
                        ),

                        Expanded(
                          flex: isSmall ? 0 : 1,

                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * .03,
                              vertical: width * .03,
                            ),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),

                              gradient: LinearGradient(
                                colors:
                                    isDark
                                        ? [
                                          const Color(0xff172554),
                                          const Color(0xff1E3A8A),
                                        ]
                                        : [
                                          theme.colorScheme.primary
                                              .withOpacity(.08),
                                          theme.colorScheme.secondary
                                              .withOpacity(.08),
                                        ],
                              ),
                            ),

                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(width * .025),

                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue.withOpacity(.12),
                                  ),

                                  child: Icon(
                                    Icons.manage_accounts_rounded,
                                    color: Colors.blue,
                                    size: width * .055,
                                  ),
                                ),

                                SizedBox(width: width * .025),

                                Expanded(
                                  child: UserRoleDropDown(
                                    userId: userModel.id,
                                    userRole: userModel.userRole!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
        
  }
}

