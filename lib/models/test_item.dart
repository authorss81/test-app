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
  final int chemScore;
  final int mathScore;
  final int phyScore;
  final int chemTotal;
  final int mathTotal;
  final int phyTotal;

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
  });
}