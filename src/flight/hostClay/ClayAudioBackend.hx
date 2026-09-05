// Maintained host adapter: Flight AudioBackend (canPlayType query) for Clay.
// WRITE-AHEAD against develop 2cf1c5cef (flight.types.AudioBackend /
// flight._Audio.installAudioHostBackend do not exist on 0.4.0). Pure query, per
// upstream/agents/backend-lifecycle-ownership.md. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
class ClayAudioBackend {
  /** Composed into the host `media.audioCodec` slot by HostClay. */
  public static function createClayAudioBackend():Dynamic {
    return {
      // SoLoud decodes ogg/wav via linc_ogg / stb; mp3 via stb where built.
      canPlayType: function(mimeType:String):Bool {
        final m = mimeType == null ? '' : mimeType.toLowerCase();
        return m.indexOf('ogg') >= 0 || m.indexOf('wav') >= 0 || m.indexOf('mpeg') >= 0 || m.indexOf('mp3') >= 0;
      },
    };
  }
}
#end
