import 'dart:math' as mmath;
import 'package:flutter/material.dart';
import '../models/test_item.dart';

class AnalysisScreen extends StatefulWidget {
  final TestItem test;
  const AnalysisScreen({super.key, required this.test});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen> {
  int _tab = 0; // 0 Score, 1 Accuracy, 2 Time

  @override
  Widget build(BuildContext context) {
    final t = widget.test;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
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

              // Body
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
                    _scoreRow(t),
                    const SizedBox(height: 18),
                    _airCard(t),
                    const SizedBox(height: 12),
                    _ranksRow(t),
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
                          _pill('Score', 0),
                          const SizedBox(width: 8),
                          _pill('Accuracy', 1),
                          const SizedBox(width: 8),
                          _pill('Time', 2),
                        ],
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        height: 240,
                        child: _tab == 0
                            ? _BarChart(
                                title: 'Score',
                                values: const ['Chemistry', 'Mathematics', 'Physics'],
                                vals: [
                                  t.chemScore.toDouble(),
                                  t.mathScore.toDouble(),
                                  t.phyScore.toDouble(),
                                ],
                                totals: [
                                  t.chemTotal.toDouble(),
                                  t.mathTotal.toDouble(),
                                  t.phyTotal.toDouble(),
                                ],
                                colors: const [
                                  Color(0xFFF5A65B),
                                  Color(0xFF8FE3DC),
                                  Color(0xFFF58C95),
                                ],
                                yLabel: (v) => v.toInt().toString(),
                              )
                            : _tab == 1
                                ? _BarChart(
                                    title: 'Accuracy',
                                    values: const ['Chemistry', 'Mathematics', 'Physics'],
                                    vals: [
                                      t.chemAcc * 100,
                                      t.mathAcc * 100,
                                      t.phyAcc * 100,
                                    ],
                                    totals: const [100, 100, 100],
                                    colors: const [
                                      Color(0xFFF5A65B),
                                      Color(0xFF8FE3DC),
                                      Color(0xFFF58C95),
                                    ],
                                    yLabel: (v) => '${v.toInt()}%',
                                  )
                                : _BarChart(
                                    title: 'Time (min)',
                                    values: const ['Chemistry', 'Mathematics', 'Physics'],
                                    vals: [
                                      t.chemTimeMin.toDouble(),
                                      t.mathTimeMin.toDouble(),
                                      t.phyTimeMin.toDouble(),
                                    ],
                                    totals: [
                                      t.totalTimeMin.toDouble(),
                                      t.totalTimeMin.toDouble(),
                                      t.totalTimeMin.toDouble(),
                                    ],
                                    colors: const [
                                      Color(0xFFF5A65B),
                                      Color(0xFF8FE3DC),
                                      Color(0xFFF58C95),
                                    ],
                                    yLabel: (v) => v.toInt().toString(),
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

  Widget _pill(String label, int i) {
    final selected = _tab == i;
    return GestureDetector(
      onTap: () => setState(() => _tab = i),
      child: Container(
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
      ),
    );
  }

  Widget _scoreRow(TestItem t) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: SizedBox(
            height: 150,
            child: CustomPaint(
              painter: _GaugePainter(
                percent: t.score / t.totalMarks,
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
                      '${t.score}/${t.totalMarks}',
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
              _scoreItem(Icons.check_circle, Colors.green, '${t.correct}', 'Correct'),
              const SizedBox(height: 14),
              _scoreItem(Icons.cancel, Colors.red, '${t.incorrect}', 'Incorrect'),
              const SizedBox(height: 14),
              _scoreItem(Icons.info_outline, Colors.blueGrey,
                  '${t.unattempted}', 'Unattempted'),
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

  Widget _airCard(TestItem t) {
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
            child: Icon(Icons.star, size: 80, color: Colors.white.withOpacity(0.18)),
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
                '${t.airRank}',
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

  Widget _ranksRow(TestItem t) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _rankItem('State Rank', t.stateRank),
          _rankDivider(),
          _rankItem('Batch Rank', t.batchRank),
          _rankDivider(),
          _rankItem('Branch Rank', t.branchRank),
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
}

class _GaugePainter extends CustomPainter {
  final double percent;
  final Color color;
  _GaugePainter({required this.percent, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = 14.0;
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height),
      radius: mmath.min(size.width / 2, size.height) - stroke / 2,
    );

    final bg = Paint()
      ..color = const Color(0xFFE6EEF4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, mmath.pi, mmath.pi, false, bg);

    final fg = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(rect, mmath.pi, mmath.pi * percent, false, fg);

    final angle = mmath.pi + mmath.pi * percent;
    final cx = size.width / 2 + (size.width / 2 - stroke / 2) * mmath.cos(angle);
    final cy = size.height + (size.height - stroke / 2) * mmath.sin(angle);
    canvas.drawCircle(Offset(cx, cy), stroke / 2 + 1, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _GaugePainter oldDelegate) =>
      oldDelegate.percent != percent || oldDelegate.color != color;
}

class _BarChart extends StatelessWidget {
  final String title;
  final List<String> values;
  final List<double> vals;
  final List<double> totals;
  final List<Color> colors;
  final String Function(double) yLabel;
  const _BarChart({
    required this.title,
    required this.values,
    required this.vals,
    required this.totals,
    required this.colors,
    required this.yLabel,
  });

  @override
  Widget build(BuildContext context) {
    final maxV = mmath.max(totals[0], mmath.max(totals[1], totals[2]));
    // Build 5 Y ticks: 0, .25, .5, .75, 1.0
    final ticks = [0.0, 0.25, 0.5, 0.75, 1.0];
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Y axis
              SizedBox(
                width: 32,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: ticks
                      .map((t) => Text(
                            yLabel(maxV * t),
                            style: const TextStyle(
                                fontSize: 10, color: Color(0xFF888888)),
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(width: 6),
              // Plot area
              Expanded(
                child: Stack(
                  children: [
                    // Grid lines
                    Positioned.fill(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          5,
                          (_) => Container(
                            height: 1,
                            color: const Color(0xFFEDEDED),
                          ),
                        ),
                      ),
                    ),
                    // Bars
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(3, (i) {
                        final v = vals[i];
                        final tot = totals[i];
                        final h = (v / tot) * 180;
                        final label = vals[i] == tot.toDouble()
                            ? '${v.toInt()}/ ${tot.toInt()}'
                            : '${v.toStringAsFixed(vals[i] < 100 && vals[i] != vals[i].toInt() ? 1 : 0)}${title == "Accuracy" ? "%" : "/ ${tot.toInt()}"}';
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  title == 'Accuracy'
                                      ? '${v.toStringAsFixed(1)}%'
                                      : '${v.toInt()}/ ${tot.toInt()}',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF222222),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(width: 22, height: h, color: colors[i]),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: values
              .map((v) => Text(v,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF333333))))
              .toList(),
        ),
      ],
    );
  }
}


