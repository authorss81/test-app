import '../models/test_item.dart';

// JEE Advanced Paper: 360 marks (Phy 120, Chem 120, Math 120), 30 Q each subject
// JEE Main: 300 marks (Phy/Che/Math 100 each), 25 Q each subject
// Total time always 180 min. Distribution: Math > Phy > Chem
// Wrongs only in Chem/Physics (no Math wrongs), max 1 wrong, no unattempted
// Marks formula: incorrect = -5, unattempted = -4
// AIR: 1-3, State Rank: 1 or 2

List<TestItem> getTests() {
  final list = <TestItem>[
    // 1
    _t(
      title: 'AIATS - AIATS-01 (Paper-2)',
      date: "23 Aug'26, 9:00 AM - 25 Aug'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 2
    _t(
      title: 'AIATS - AIATS-01 (Paper-1)',
      date: "23 Aug'26, 9:00 AM - 25 Aug'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 3 — AIATS-01 (note: no paper, original) — 1 wrong in Chem
    _t(
      title: 'AIATS - AIATS-01',
      date: "16 Aug'26, 9:00 AM - 18 Aug'26, 9:00 AM",
      total: 360,
      score: 355,
      correct: 89, incorrect: 1, unattempted: 0,
      air: 3, state: 2, batch: 1, branch: 1,
      chemScore: 116, mathScore: 120, phyScore: 120,
      chemC: 29, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 4
    _t(
      title: 'AIATS - Practice Test-01',
      date: "10 Aug'26, 9:00 AM - 12 Aug'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 5 — wrong in Phy
    _t(
      title: 'Term Exam - TE-01 (Paper-2)',
      date: "09 Aug'26, 9:00 AM - 11 Aug'26, 9:00 AM",
      total: 360,
      score: 355,
      correct: 89, incorrect: 1, unattempted: 0,
      air: 2, state: 2, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 116,
      chemC: 30, mathC: 30, phyC: 29, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 6
    _t(
      title: 'Term Exam - TE-01 (Paper-1)',
      date: "09 Aug'26, 9:00 AM - 11 Aug'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 7 — JEE Main
    _t(
      title: 'Unit Test - UT-01 (JEE Main)',
      date: "13 Jun'26, 9:00 AM - 15 Jun'26, 9:00 AM",
      total: 300,
      score: 300,
      correct: 75, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 100, mathScore: 100, phyScore: 100,
      chemC: 25, mathC: 25, phyC: 25, q: 25,
      chemT: 50, mathT: 70, phyT: 60,
      jeeMain: true,
    ),
    // 8
    _t(
      title: 'AIATS - AIATS-03 (Paper-2)',
      date: "22 Mar'26, 9:00 AM - 24 Mar'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 9 — wrong in Physics
    _t(
      title: 'AIATS - AIATS-03 (Paper-1)',
      date: "22 Mar'26, 9:00 AM - 24 Mar'26, 9:00 AM",
      total: 360,
      score: 355,
      correct: 89, incorrect: 1, unattempted: 0,
      air: 2, state: 2, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 116,
      chemC: 30, mathC: 30, phyC: 29, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 10 — JEE Main
    _t(
      title: 'AIATS - AIATS-03 (JEE Main)',
      date: "15 Mar'26, 9:00 AM - 17 Mar'26, 9:00 AM",
      total: 300,
      score: 300,
      correct: 75, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 100, mathScore: 100, phyScore: 100,
      chemC: 25, mathC: 25, phyC: 25, q: 25,
      chemT: 50, mathT: 70, phyT: 60,
      jeeMain: true,
    ),
    // 11
    _t(
      title: 'AIATS - AIATS-02 (Paper-2)',
      date: "08 Mar'26, 9:00 AM - 10 Mar'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 12
    _t(
      title: 'AIATS - AIATS-02 (Paper-1)',
      date: "08 Mar'26, 9:00 AM - 10 Mar'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 13 — JEE Main, wrong in Chem
    _t(
      title: 'AIATS - AIATS-02 (JEE Main)',
      date: "01 Mar'26, 9:00 AM - 03 Mar'26, 9:00 AM",
      total: 300,
      score: 295,
      correct: 74, incorrect: 1, unattempted: 0,
      air: 3, state: 2, batch: 1, branch: 1,
      chemScore: 96, mathScore: 100, phyScore: 100,
      chemC: 24, mathC: 25, phyC: 25, q: 25,
      chemT: 50, mathT: 70, phyT: 60,
      jeeMain: true,
    ),
    // 14
    _t(
      title: 'Practice Test - Practice Test-06 (Paper-2)',
      date: "23 Feb'26, 9:00 AM - 25 Feb'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // 15
    _t(
      title: 'Practice Test - Practice Test-06 (Paper-1)',
      date: "23 Feb'26, 9:00 AM - 25 Feb'26, 9:00 AM",
      total: 360,
      score: 360,
      correct: 90, incorrect: 0, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 120,
      chemC: 30, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // === Latest two ===
    // Second-to-last: 1 wrong in Chem, AIR 1, all ranks 1
    _t(
      title: 'AIATS - AIATS-01 (Paper-2)',
      date: "23 Aug'26, 9:00 AM - 25 Aug'26, 9:00 AM",
      total: 360,
      score: 355,
      correct: 89, incorrect: 1, unattempted: 0,
      air: 1, state: 1, batch: 1, branch: 1,
      chemScore: 116, mathScore: 120, phyScore: 120,
      chemC: 29, mathC: 30, phyC: 30, q: 30,
      chemT: 50, mathT: 70, phyT: 60,
    ),
    // Last: 1 wrong in Phy, AIR 2, State 1, Batch 1
    _t(
      title: 'AIATS - AIATS-01 (Paper-1)',
      date: "23 Aug'26, 9:00 AM - 25 Aug'26, 9:00 AM",
      total: 360,
      score: 355,
      correct: 89, incorrect: 1, unattempted: 0,
      air: 2, state: 1, batch: 1, branch: 1,
      chemScore: 120, mathScore: 120, phyScore: 116,
      chemC: 30, mathC: 30, phyC: 29, q: 30,
chemT: 50, mathT: 70, phyT: 60,
    ),
  ];
  // Sort by end-date descending (newest first).
  // Date format: "DD Mon'YY, 9:00 AM - DD Mon'YY, 9:00 AM"
  int parseEndDate(String dateRange) {
    final endStr = dateRange.split(' - ').last.trim();
    final parts = endStr.split(' ');
    if (parts.length < 2) return 0;
    final day = int.tryParse(parts[0]) ?? 0;
    const months = {
      'Jan': 1, 'Feb': 2, 'Mar': 3, 'Apr': 4, 'May': 5, 'Jun': 6,
      'Jul': 7, 'Aug': 8, 'Sep': 9, 'Oct': 10, 'Nov': 11, 'Dec': 12,
    };
    final mon = months[parts[1].substring(0, 3)] ?? 0;
    // Year: 'YY format => 20YY
    final yearStr = parts[1].contains("'") ? parts[1].split("'")[1] : '0';
    final year = 2000 + (int.tryParse(yearStr) ?? 0);
    return year * 10000 + mon * 100 + day;
  }

  list.sort((a, b) => parseEndDate(b.dateRange).compareTo(parseEndDate(a.dateRange)));
  return list;
}

TestItem _t({
  required String title,
  required String date,
  required int total,
  required int score,
  required int correct,
  required int incorrect,
  required int unattempted,
  required int air,
  required int state,
  required int batch,
  required int branch,
  required int chemScore,
  required int mathScore,
  required int phyScore,
  required int chemC,
  required int mathC,
  required int phyC,
  required int q,
  required int chemT,
  required int mathT,
  required int phyT,
  bool jeeMain = false,
}) {
  final chemTotal = jeeMain ? 100 : 120;
  final mathTotal = jeeMain ? 100 : 120;
  final phyTotal = jeeMain ? 100 : 120;
  return TestItem(
    title: title,
    dateRange: date,
    mode: 'Online',
    subjects: 'Physics, Chemistry, Mathematics',
    hasAnalysis: true,
    totalMarks: total,
    score: score,
    correct: correct,
    incorrect: incorrect,
    unattempted: unattempted,
    airRank: air,
    stateRank: state,
    batchRank: batch,
    branchRank: branch,
    chemScore: chemScore,
    mathScore: mathScore,
    phyScore: phyScore,
    chemTotal: chemTotal,
    mathTotal: mathTotal,
    phyTotal: phyTotal,
    chemCorrect: chemC,
    chemQuestions: q,
    mathCorrect: mathC,
    mathQuestions: q,
    phyCorrect: phyC,
    phyQuestions: q,
    chemTimeMin: chemT,
    mathTimeMin: mathT,
    phyTimeMin: phyT,
    totalTimeMin: chemT + mathT + phyT,
  );
}
