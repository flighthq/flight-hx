// Native functional smoke for hostClay's core paths, run on hxcpp under Xvfb +
// software Mesa GL + an ALSA null device. Exercises the SAME native libraries
// hostClay's adapters call, and asserts real results (a rendered pixel, a valid
// PNG, a clipboard roundtrip, an active audio voice). Exits non-zero on any
// failure so CI fails loudly. See tests/host-clay/native-smoke/README.md.
//
//   ClayGlContext / GlSurface  -> linc_opengl (viewport/clearColor/clear/readPixels)
//   ClayBitmap (encode)        -> linc_stb    (write_png_to_mem)
//   ClayClipboard              -> SDL         (Set/GetClipboardText)
//   ClayAudioDevice            -> SoLoud      (init + loadRawWave(PCM) + play)
import opengl.WebGL as GL;
import stb.ImageWrite;
import soloud.Soloud;
import soloud.Wav;

@:cppInclude('SDL2/SDL.h')
@:cppInclude('math.h')
@:buildXml('<target id="haxe"><flag value="-I/usr/include/SDL2"/><lib name="-lSDL2"/><lib name="-lGLEW"/><lib name="-lGL"/><lib name="-lasound"/><lib name="-lpthread"/><lib name="-ldl"/><lib name="-lm"/></target>')
class NativeSmoke {
  static var failures = 0;
  static function check(name:String, ok:Bool) {
    Sys.println((ok ? '[PASS] ' : '[FAIL] ') + name);
    if (!ok) failures++;
  }

  static function main() {
    // 1) GL render (ClayGlContext path): a real GL context + linc_opengl draw + readback.
    untyped __cpp__('SDL_Init(SDL_INIT_VIDEO|SDL_INIT_EVENTS)');
    untyped __cpp__('SDL_Window* w=SDL_CreateWindow("s",0,0,64,64,SDL_WINDOW_OPENGL|SDL_WINDOW_HIDDEN); SDL_GLContext c=SDL_GL_CreateContext(w); glewExperimental=GL_TRUE; glewInit();');
    GL.viewport(0, 0, 64, 64);
    GL.clearColor(0, 1, 0, 1);
    GL.clear(GL.COLOR_BUFFER_BIT);
    untyped __cpp__('glFinish()');
    var px = new clay.buffers.Uint8Array(4);
    GL.readPixels(0, 0, 1, 1, GL.RGBA, GL.UNSIGNED_BYTE, px);
    check('GL render+readback (green)', px[0] == 0 && px[1] == 255 && px[2] == 0);

    // 2) Bitmap encode (ClayBitmap path): stb PNG-to-memory produces a valid PNG.
    var bmp = haxe.io.Bytes.alloc(16 * 16 * 4);
    for (i in 0...bmp.length) bmp.set(i, (i * 37) & 0xFF);
    var png = ImageWrite.write_png_to_mem(16, 16, 4, bmp.getData(), 0, bmp.length, 16 * 4);
    var pb = haxe.io.Bytes.ofData(png);
    check('bitmap encode (PNG magic)', pb.length > 50 && pb.get(0) == 0x89 && pb.get(1) == 0x50 && pb.get(2) == 0x4E);

    // 3) Clipboard (ClayClipboard path): SDL set/get roundtrip.
    untyped __cpp__('SDL_SetClipboardText("flight-hostclay-ci")');
    var clip:String = untyped __cpp__('::String((const char*)SDL_GetClipboardText())');
    check('clipboard roundtrip', clip == 'flight-hostclay-ci');

    // 4) Audio (ClayAudioDevice path): SoLoud init + PCM buffer + play -> active voice.
    var sl = Soloud.create();
    var ir = sl.init();
    untyped __cpp__('static float pcm[22050]; for(int i=0;i<22050;i++) pcm[i]=0.2f*sinf((float)i*0.0627f);');
    var wav = Wav.create();
    var lr = wav.loadRawWave(untyped __cpp__('pcm'), 22050, 22050.0, 1);
    var voices = (ir == 0) ? {
      sl.play(wav);
      sl.getActiveVoiceCount();
    } : 0;
    check('audio init+PCM-buffer+play', ir == 0 && lr == 0 && voices > 0);
    // Deliberately no sl.deinit(): calling it immediately after play() races the
    // audio-mix thread and trips SoLoud's debug assertion (!mInsideAudioThreadMutex),
    // core-dumping the process even though the voice already asserted active. The
    // active voice is the proof; the OS reclaims the detached audio thread on exit.

    Sys.println(failures == 0 ? 'ALL NATIVE SMOKES PASSED' : (failures + ' FAILURE(S)'));
    Sys.exit(failures == 0 ? 0 : 1);
  }
}
