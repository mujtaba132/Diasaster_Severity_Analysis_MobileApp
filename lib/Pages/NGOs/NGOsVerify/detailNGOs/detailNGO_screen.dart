import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/detailNGOs/verifyStatus.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/detailNGOs/verifyStatus_Btn.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/routes/routes_arguments/imagePreview_arguments.dart';
import 'package:fyp_project/config/routes/routes_name.dart';

class NgoDetailScreen extends StatefulWidget {
  final NGOModel ngo;
  final RequestNgoBloc requestNgoBloc;

  const NgoDetailScreen({
    super.key,
    required this.ngo,
    required this.requestNgoBloc,
  });

  @override
  State<NgoDetailScreen> createState() => _NgoDetailPageState();
}

class _NgoDetailPageState extends State<NgoDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.08), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final isDark = theme.brightness == Brightness.dark;

    final primary = theme.colorScheme.primary;

    return BlocProvider.value(
      value: widget.requestNgoBloc,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              widget.ngo.ngoName!,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            actions: [
              SizedBox(width: 65, child: Verifystatus(ngo: widget.ngo)),
              const SizedBox(width: 12),
            ],
          ),
          body: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    /// Certificate Card
                    GestureDetector(
                      onTap: () {
                         Navigator.pushNamed(
                         context, 
                         RoutesName.imagePreviewScreen,
                         arguments: ImagePreviewArguments(file: File(widget.ngo.cerficateUrl!)));
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: isDark
                                ? [
                                    const Color(0xff1E293B),
                                    const Color(0xff0F172A),
                                  ]
                                : [Colors.white, const Color(0xffF8FAFC)],
                          ),
                          border: Border.all(
                            color: primary.withOpacity(0.15),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isDark
                                  ? Colors.black.withOpacity(0.35)
                                  : primary.withOpacity(0.10),
                              blurRadius: 25,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            children: [
                              /// Icon
                              Container(
                                height: 68,
                                width: 68,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  gradient: LinearGradient(
                                    colors: [primary, primary.withOpacity(0.7)],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: primary.withOpacity(0.35),
                                      blurRadius: 18,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: const Icon(
                                  Icons.verified_outlined,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),

                              const SizedBox(width: 18),

                              /// Text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "NGO Certificate",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),

                                    const SizedBox(height: 6),

                                    Text(
                                      "Tap to preview certificate",
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: theme
                                                .textTheme
                                                .bodySmall
                                                ?.color
                                                ?.withOpacity(0.7),
                                            height: 1.4,
                                          ),
                                    ),
                                  ],
                                ),
                              ),

                              /// Arrow
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: primary.withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// Details Card
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isDark
                              ? [
                                  Colors.white.withOpacity(0.05),
                                  Colors.white.withOpacity(0.02),
                                ]
                              : [Colors.white, Colors.grey.shade50],
                        ),
                        border: Border.all(color: primary.withOpacity(0.10)),
                        boxShadow: [
                          BoxShadow(
                            color: isDark
                                ? Colors.black.withOpacity(0.25)
                                : Colors.black.withOpacity(0.05),
                            blurRadius: 30,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          children: [
                            _buildTile(
                              context,
                              icon: Icons.business_rounded,
                              title: "NGO Name",
                              value: widget.ngo.ngoName!,
                            ),

                            _buildTile(
                              context,
                              icon: Icons.location_on_rounded,
                              title: "Address",
                              value: widget.ngo.address!,
                            ),

                            _buildTile(
                              context,
                              icon: Icons.call_rounded,
                              title: "Phone Number",
                              value: widget.ngo.phoneNo!,
                            ),

                            _buildTile(
                              context,
                              icon: Icons.account_balance_rounded,
                              title: "Bank Name",
                              value: widget.ngo.bankName!,
                            ),

                            _buildTile(
                              context,
                              icon: Icons.credit_card_rounded,
                              title: "Account Number",
                              value: widget.ngo.accountNo!,
                            ),

                            const SizedBox(height: 8),

                            VerifystatusBtn(ngoId: widget.ngo.id!),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final primary = theme.colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color.fromARGB(255, 59, 30, 39), const Color(0xff0F172A)]
                : [Colors.white, const Color(0xffF8FAFC)],
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.35)
                  : primary.withOpacity(0.10),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
          color: primary.withOpacity(0.05),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: primary.withOpacity(0.08)),
        ),
        child: Row(
          children: [
            /// Icon Box
            Container(
              height: 52,
              width: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [primary, primary.withOpacity(0.7)],
                ),
              ),
              child: Icon(icon, color: Colors.white),
            ),

            const SizedBox(width: 16),

            /// Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withOpacity(
                        0.65,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    value,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
