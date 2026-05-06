import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fyp_project/Pages/Donation/disaster_donation_sheet.dart';
import 'package:fyp_project/blocs/donation/donation_bloc.dart';
import 'package:fyp_project/main.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String selectedBank = "All";
  DateTime? selectedDate;
  late DonationBloc _donationBloc;

  final List<Map<String, dynamic>> transactions = List.generate(
    10,
    (i) => {
      "bank": i % 2 == 0 ? "Bank Alfalah" : "HBL",
      "account": "****1234",
      "date": DateTime(2026, 5, i + 1, 10, 30),
      "amount": 5000 + i * 1000,
      "expanded": false,
    },
  );

  @override
  void initState() {
    super.initState();
    _donationBloc = getit<DonationBloc>();
  }

  @override
  void dispose() {
    _donationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: _donationBloc,
      child: Scaffold(
        appBar: AppBar(title: const Text("Donations")),
        body: Column(
          children: [
            _TotalDonationCard(),
            _FilterSection(
              selectedBank: selectedBank,
              onBankChanged: (val) => setState(() => selectedBank = val),
              onDatePick: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (picked != null) setState(() => selectedDate = picked);
              },
            ),
            _GraphSection(),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  return _ExpandableTile(
                    data: tx,
                    onTap: () {
                      setState(() {
                        tx["expanded"] = !tx["expanded"];
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  final String selectedBank;
  final Function(String) onBankChanged;
  final VoidCallback onDatePick;

  const _FilterSection({
    required this.selectedBank,
    required this.onBankChanged,
    required this.onDatePick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          /// BANK FILTER
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedBank,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    size: 20,
                    color: theme.iconTheme.color,
                  ),
                  isExpanded: true,
                  items: ["All", "Bank Alfalah", "HBL"]
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Row(
                            children: [
                              Icon(
                                Icons.account_balance,
                                size: 16,
                                color: theme.primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(e, style: const TextStyle(fontSize: 13)),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (val) => onBankChanged(val!),
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          /// DATE FILTER
          GestureDetector(
            onTap: onDatePick,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    theme.primaryColor,
                    theme.primaryColor.withOpacity(0.7),
                  ],
                ),
              ),
              child: Row(
                children: const [
                  Icon(Icons.calendar_today, color: Colors.white, size: 16),
                  SizedBox(width: 6),
                  Text(
                    "Date",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandableTile extends StatelessWidget {
  final Map<String, dynamic> data;
  final VoidCallback onTap;

  const _ExpandableTile({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final expanded = data["expanded"];

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.account_balance),
                const SizedBox(width: 10),
                Expanded(child: Text(data["bank"])),
                Text("Rs. ${data["amount"]}"),
              ],
            ),
            if (expanded) ...[
              const SizedBox(height: 10),
              Text("Account: ${data["account"]}"),
              Text("Date: ${data["date"]}"),
            ],
          ],
        ),
      ),
    );
  }
}

class _GraphSection extends StatelessWidget {
  const _GraphSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              spots: const [
                FlSpot(1, 2000),
                FlSpot(2, 5000),
                FlSpot(3, 3000),
                FlSpot(4, 8000),
                FlSpot(5, 6000),
                FlSpot(6, 10000),
              ],
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: true),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }
}

class _TotalDonationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.blue, Color.fromARGB(255, 9, 77, 195)],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.volunteer_activism, color: Colors.white, size: 40),

          const SizedBox(width: 15),

          /// TEXT SECTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Total Donations",
                  style: TextStyle(color: Colors.white70),
                ),
                SizedBox(height: 5),
                Text(
                  "Rs. 250,000",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          /// ADD / DONATE BUTTON
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                builder: (_) => const DonationBottomSheet(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 26),
            ),
          ),
        ],
      ),
    );
  }
}
