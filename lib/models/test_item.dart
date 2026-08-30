class TestItem {
  final String title;
  final String dateRange;
  final String mode;
  final String subjects;
  final bool hasAnalysis;
  final int totalMarks;
  final int score;
  final int correct;
  final int incorrect;
  final int unattempted;
  final int airRank;
  final int stateRank;
  final int batchRank;
  final int branchRank;

  final int chemScore, mathScore, phyScore;
  final int chemTotal, mathTotal, phyTotal;

  // Per-subject correct/total (out of question count, not marks)
  final int chemCorrect, chemQuestions;
  final int mathCorrect, mathQuestions;
  final int phyCorrect, phyQuestions;

  // Time spent per subject in minutes
  final int chemTimeMin, mathTimeMin, phyTimeMin;
  final int totalTimeMin;

  TestItem({
    required this.title,
    required this.dateRange,
    required this.mode,
    required this.subjects,
    required this.hasAnalysis,
    required this.totalMarks,
    required this.score,
    required this.correct,
    required this.incorrect,
    required this.unattempted,
    required this.airRank,
    required this.stateRank,
    required this.batchRank,
    required this.branchRank,
    required this.chemScore,
    required this.mathScore,
    required this.phyScore,
    required this.chemTotal,
    required this.mathTotal,
    required this.phyTotal,
    required this.chemCorrect,
    required this.chemQuestions,
    required this.mathCorrect,
    required this.mathQuestions,
    required this.phyCorrect,
    required this.phyQuestions,
    required this.chemTimeMin,
    required this.mathTimeMin,
    required this.phyTimeMin,
    required this.totalTimeMin,
  });

  double get chemAcc => chemQuestions == 0 ? 0 : chemCorrect / chemQuestions;
  double get mathAcc => mathQuestions == 0 ? 0 : mathCorrect / mathQuestions;
  double get phyAcc => phyQuestions == 0 ? 0 : phyCorrect / phyQuestions;

  // Chapter-wise comparison data (Topper vs Me vs Average) per chapter (6 chapters per subject = 18 total).
  // Values are marks per chapter (out of subjectTotal/6).
  List<List<int>> get chapterMarks {
    final chapterScoreMe = List<int>.generate(18, (_) => 0);
    final chapterScoreTopper = List<int>.generate(18, (_) => 0);
    final chapterScoreAvg = List<int>.generate(18, (_) => 0);

    // Chapter marks per subject = subjectScore / 6 chapters (distribute proportionally).
    // We'll distribute: each chapter gets either floor or ceil based on idx.
    List<int> distribute(int score, int chapters) {
      final base = score ~/ chapters;
      final rem = score % chapters;
      return List.generate(chapters, (i) => base + (i < rem ? 1 : 0));
    }

    final meChem = distribute(chemScore, 6);
    final meMath = distribute(mathScore, 6);
    final mePhy = distribute(phyScore, 6);

    // Topper: if I'm full marks -> topper = same as me.
    // If I'm 1 wrong -> topper = me + 1 distributed across chapters (often the wrong chapter).
    // If I have unattempted (legacy) -> topper might have full marks in that chapter.
    // For this dataset, topper:
    //   if chemScore == chemTotal && mathScore == mathTotal && phyScore == phyTotal -> topper = same
    //   else topper = me + 1 in a specific chapter (use first non-perfect chapter's first chapter).
    List<int> topperChem = List.of(meChem);
    List<int> topperMath = List.of(meMath);
    List<int> topperPhy = List.of(mePhy);
    if (chemScore != chemTotal) {
      // add +1 to first non-perfect chapter
      for (var i = 0; i < 6; i++) {
        if (meChem[i] < (chemTotal ~/ 6) ||
            (meChem[i] < chemTotal ~/ 6 + 1 && meChem.sublist(0, i).where((v) => v > chemTotal ~/ 6).length > 0)) {
          topperChem[i] = meChem[i] + 1;
          break;
        }
      }
      // ensure total != more than total
      if (topperChem.reduce((a, b) => a + b) > chemTotal) {
        // replace with perfect
        topperChem = List.filled(6, chemTotal ~/ 6);
      }
    }
    if (phyScore != phyTotal) {
      for (var i = 0; i < 6; i++) {
        if (topperPhy[i] < (phyTotal ~/ 6)) {
          topperPhy[i] = mePhy[i] + 1;
          break;
        }
      }
    }
    // Math topper always = me (math has no wrongs)
    // (but if mathScore == mathTotal it's already identical)

    // Average: roughly 50-60% of total per chapter, distributed.
    int avgTotal = (totalMarks * 0.55).round();
    // distribute avg proportionally to subject weights
    final chemAvgTotal = (avgTotal * chemTotal / totalMarks).round();
    final mathAvgTotal = (avgTotal * mathTotal / totalMarks).round();
    final phyAvgTotal = (avgTotal * phyTotal / totalMarks).round();
    final avgChem = distribute(chemAvgTotal, 6);
    final avgMath = distribute(mathAvgTotal, 6);
    final avgPhy = distribute(phyAvgTotal, 6);

    for (var i = 0; i < 6; i++) {
      chapterScoreMe[i] = meChem[i];
      chapterScoreMe[i + 6] = meMath[i];
      chapterScoreMe[i + 12] = mePhy[i];

      chapterScoreTopper[i] = topperChem[i];
      chapterScoreTopper[i + 6] = topperMath[i];
      chapterScoreTopper[i + 12] = topperPhy[i];

      chapterScoreAvg[i] = avgChem[i];
      chapterScoreAvg[i + 6] = avgMath[i];
      chapterScoreAvg[i + 12] = avgPhy[i];
    }

    return [chapterScoreTopper, chapterScoreMe, chapterScoreAvg];
  }
}