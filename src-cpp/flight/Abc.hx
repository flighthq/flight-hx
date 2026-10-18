// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function readAbcFile(source:flight._internal._UInt8Array):Null<flight.AbcFile> {
  return flight._cpp._attempt.Attempt_Abc_readAbcFile.readAbcFile(source);
}

extern inline function readAbcInstructions(code:flight._internal._UInt8Array):Null<Array<flight.AbcInstruction>> {
  return flight._cpp._attempt.Attempt_Abc_readAbcInstructions.readAbcInstructions(code);
}
