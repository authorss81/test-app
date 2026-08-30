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
}