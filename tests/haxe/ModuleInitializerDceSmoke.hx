package;

class ModuleInitializerDceSmoke {
  static function main():Void {
    // The standard table is populated by a synthetic module initializer. Native
    // DCE must retain that side effect even though no source-level declaration
    // refers to the initializer itself.
    if (flight.RenderGl.standardGlBlendRealizations.entries.size != 6) {
      throw 'module initializer was removed by DCE';
    }
  }
}
