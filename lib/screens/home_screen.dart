import 'package:flutter/material.dart';
import '../models/test_item.dart';
import 'analysis_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<TestItem> tests;
  const HomeScreen({super.key, required this.tests});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Row(
            children: [
              const SizedBox(width: 12),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const Spacer(),
              const Text(
                'Scheduled Tests',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              const SizedBox(width: 32),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: tests.length,
        itemBuilder: (context, i) {
          final t = tests[i];
          return Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: _TestCard(test: t),
          );
        },
      ),
    );
  }
}

class _TestCard extends StatelessWidget {
  final TestItem test;
  const _TestCard({required this.test});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            test.title,
            style: const TextStyle(
              fontSize: 15.5,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111111),
              height: 1.25,
            ),
          ),
          const SizedBox(height: 12),
          _row(Icons.calendar_today_outlined, test.dateRange),
          const SizedBox(height: 6),
          _row(Icons.location_on_outlined, test.mode),
          const SizedBox(height: 6),
          _row(Icons.menu_book_outlined, test.subjects),
          const SizedBox(height: 14),
          SizedBox(
            height: 36,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AnalysisScreen(test: test),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1FA9E8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 22),
                elevation: 0,
              ),
              child: const Text(
                'View Analysis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF6B6B6B)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 13.5,
              color: Color(0xFF333333),
            ),
          ),
        ),
      ],
    );
  }
}