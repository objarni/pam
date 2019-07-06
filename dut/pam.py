from approvaltests.combination_approvals import verify_all_combinations
from approvaltests.reporters.generic_diff_reporter import GenericDiffReporter


def verify(fn, args):
    verify_all_combinations(fn, args, reporter=GenericDiffReporter(('meld', 'meld')))
