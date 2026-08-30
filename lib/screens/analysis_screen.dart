import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../models/test_item.dart';

class AnalysisScreen extends StatelessWidget {
  final TestItem test;
  const AnalysisScreen({super.key, required this.test});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top blue header
              Container(
                width: double.infinity,
                color: const Color(0xFFD7E9F4),
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'AIATS For One Year JEE(Advanced)-2027 (XII Studying)_Test-1A_Paper-2_Online',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                    ),
                    const Icon(Icons.more_vert, color: Colors.black87),
                  ],
                ),
              ),

              // Light blue body area
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFD7E9F4), Color(0xFFEFF6FB)],
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
                child: Column(
                  children: [
                    _scoreRow(),
                    const SizedBox(height: 18),
                    _airCard(),
                    const SizedBox(height: 12),
                    _ranksRow(),
                  ],
                ),
              ),

              // Tabs row
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    _tabLabel('Summary', false),
                    _tabLabel('Subject Analysis', true),
                    _tabLabel('Comparative Analysis', false),
                    _tabLabel('Chap...', false),
                  ],
                ),
              ),
              const Divider(height: 1, color: Color(0xFFEEEEEE)),

              // Subject analysis card
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.radio_button_checked,
                              size: 16, color: Color(0xFF1FA9E8)),
                          SizedBox(width: 8),
                          Text(
                            'Subject Analysis',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          _pillTab('Score', true),
                          const SizedBox(width: 8),
                          _pillTab('Accuracy', false),
                          const SizedBox(width: 8),
                          _pillTab('Time', false),
                        ],
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        height: 240,
                        child: _BarChart(
                          chem: test.chemScore.toDouble(),
                          math: test.mathScore.toDouble(),
                          phy: test.phyScore.toDouble(),
                          chemTotal: test.chemTotal.toDouble(),
                          mathTotal: test.mathTotal.toDouble(),
                          phyTotal: test.phyTotal.toDouble(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _scoreRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 150,
            child: CustomPaint(
              painter: _GaugePainter(
                percent: test.score / test.totalMarks,
                color: const Color(0xFF1FA9E8),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Score',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${test.score}/${test.totalMarks}',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF111111),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _scoreItem(
                  Icons.check_circle, Colors.green, '${test.correct}', 'Correct'),
              const SizedBox(height: 14),
              _scoreItem(
                  Icons.cancel, Colors.red, '${test.incorrect}', 'Incorrect'),
              const SizedBox(height: 14),
              _scoreItem(Icons.info_outline, Colors.blueGrey,
                  '${test.unattempted}', 'Unattempted'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _scoreItem(IconData icon, Color color, String num, String label) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Text(num,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
        const SizedBox(width: 6),
        Text(label,
            style: const TextStyle(fontSize: 13, color: Color(0xFF333333))),
      ],
    );
  }

  Widget _airCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1FA9E8), Color(0xFF2B8BD8)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: -10,
            top: -10,
            child: Icon(Icons.star,
                size: 80, color: Colors.white.withOpacity(0.18)),
          ),
          Positioned(
            right: 20,
            bottom: -8,
            child: Icon(Icons.star_border,
                size: 70, color: Colors.white.withOpacity(0.18)),
          ),
          Column(
            children: [
              const Text(
                'Your All India Rank (AIR) is',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(height: 8),
              Text(
                '${test.airRank}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ranksRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _rankItem('State Rank', test.stateRank),
          _rankDivider(),
          _rankItem('Batch Rank', test.batchRank),
          _rankDivider(),
          _rankItem('Branch Rank', test.branchRank),
        ],
      ),
    );
  }

  Widget _rankDivider() =>
      Container(height: 22, width: 1, color: const Color(0xFFE0E0E0));

  Widget _rankItem(String label, int rank) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF555555))),
        const SizedBox(height: 2),
        Text('$rank',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111111))),
      ],
    );
  }

  Widget _tabLabel(String label, bool selected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: selected ? const Color(0xFF1FA9E8) : Colors.transparent,
              width: 2.5,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: selected ? const Color(0xFF1FA9E8) : const Color(0xFF666666),
          ),
        ),
      ),
    );
  }

  Widget _pillTab(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF1FA9E8) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF333333),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ===== Half-circle gauge =====
class _GaugePainter extends CustomPainter {
  final double percent;
  final Color color;
  _GaugePainter({required this.percent, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = 14.0;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: math.min(size.width / 2, size.height) - stroke / 2,
    );

    final bg = Paint()
      ..color = const Color(0xFFE6EEF4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, math.pi, math.pi, false, bg);

    final fg = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, math.pi, math.pi * percent, false, fg);

    // End dot
    final angle = math.pi + math.pi * percent;
    final cx = size.width / 2 + (size.width / 2 - stroke / 2) * math.cos(angle);
    final cy = size.height + (size.height - stroke / 2) * math.sin(angle);
    canvas.drawCircle(Offset(cx, cy), stroke / 2 + 1,
        Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) =>
      oldDelegate.percent != percent || oldDelegate.color != color;
}

// ===== Bar chart =====
class _BarChart extends StatelessWidget {
  final double chem, math, phy;
  final double chemTotal, mathTotal, phyTotal;
  const _BarChart({
    required this.chem,
    required this.math,
    required this.phy,
    required this.chemTotal,
    required this.mathTotal,
    required this.phyTotal,
  });

  @override
  Widget build(BuildContext context) {
    final maxV = [chemTotal, mathTotal, phyTotal].reduce(math.max);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Y axis
        SizedBox(
          width: 28,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [maxV, maxV * 0.75, maxV * 0.5, maxV * 0.25, 0]
                .map((v) => Text(
                      v.toInt().toString(),
                      style: const TextStyle(
                          fontSize: 10, color: Color(0xFF888888)),
                    ))
                .toList(),
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 200,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _bar('Chemistry', chem, chemTotal, const Color(0xFFF5A65B)),
                    _bar('Mathematics', math, mathTotal,
                        const Color(0xFF8FE3DC)),
                    _bar('Physics', phy, phyTotal, const Color(0xFFF58C95)),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text('Chemistry',
                      style: TextStyle(fontSize: 12, color: Color(0xFF333333))),
                  Text('Mathematics',
                      style: TextStyle(fontSize: 12, color: Color(0xFF333333))),
                  Text('Physics',
                      style: TextStyle(fontSize: 12, color: Color(0xFF333333))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _bar(String label, double v, double total, Color color) {
    final h = (v / total) * 180;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '${v.toInt()}/ ${total.toInt()}',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF222222),
              ),
            ),
            const SizedBox(height: 4),
            Container(width: 22, height: h, color: color),
          ],
        ),
      ),
    );
  }
}

