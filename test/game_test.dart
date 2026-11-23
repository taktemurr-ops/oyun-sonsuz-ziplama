import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sonsuz_ziplama/oyun_sonsuz_ziplama.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ziplamaConfig.title.length, 33);
    expect(ziplamaConfig.tagline.length, 33);
    for (final s in ziplamaConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ziplamaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ziplamaId, optionalMechanics: ziplamaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ziplamaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
