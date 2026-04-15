import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Model/NGOModel/ngo_model.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/detailNGOs/verifyStatus.dart';
import 'package:fyp_project/Pages/NGOs/NGOsVerify/detailNGOs/verifyStatus_Btn.dart';
import 'package:fyp_project/blocs/request_ngo/request_ngo_bloc.dart';
import 'package:fyp_project/config/Components/Custom_NetworkImage.dart';

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

class _NgoDetailPageState extends State<NgoDetailScreen> {


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
     
    return BlocProvider.value(
        value: widget.requestNgoBloc,
    child: Scaffold(
      appBar: AppBar(
        title: Text(widget.ngo.ngoName!),
        actions: [SizedBox(width:63,child: Verifystatus(ngo:widget.ngo)),
        const SizedBox(width: 20,)], 
        elevation: 0),
      body:  SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              CustomNetworkimage(imageUrl: widget.ngo.cerficateUrl!),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.black26
                          : Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildTile(Icons.business, "NGO Name", widget.ngo.ngoName!),
                    _buildTile(
                      Icons.location_on,
                      "Address",
                      widget.ngo.address!,
                    ),
                    _buildTile(Icons.phone, "Phone", widget.ngo.phoneNo!),
                    _buildTile(
                      Icons.account_balance,
                      "Bank",
                      widget.ngo.bankName!,
                    ),
                    _buildTile(
                      Icons.numbers,
                      "Account No",
                      widget.ngo.accountNo!,
                    ),

                    const SizedBox(height: 10),

                    VerifystatusBtn(ngoId: widget.ngo.id!),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
