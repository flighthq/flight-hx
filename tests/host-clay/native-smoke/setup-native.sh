#!/usr/bin/env bash
# Assembles the native toolchain the hostClay smoke needs: Clay (for clay.buffers)
# plus the linc bindings hostClay's adapters compile against, cloned WITH their
# vendored submodules (GLEW under linc_opengl, SoLoud core under linc_soloud —
# tarballs/shallow clones omit these), registered via `haxelib dev`, plus an ALSA
# null device so SoLoud can init headless. System SDL2/GLEW/ALSA/Mesa are expected
# to be installed by the workflow. Run from a scratch dir; pass it as $1.
set -euo pipefail

DEPS="${1:-$PWD/.native-deps}"
mkdir -p "$DEPS"
cd "$DEPS"

clone() { # repo, dir, [checkout]
  if [ ! -d "$2/.git" ]; then git clone --recursive --depth 1 "https://github.com/$1" "$2"; fi
  if [ -n "${3:-}" ]; then git -C "$2" fetch --depth 1 origin "$3" && git -C "$2" checkout "$3" && git -C "$2" submodule update --init --recursive; fi
}

# Clay pinned at 8ae994a (pre-GraphicsBatcher refactor: self-consistent, compiles clean).
clone ceramic-engine/clay        clay 8ae994ada50918a403dcb10efdfcb0dcad72aa3 2>/dev/null || clone ceramic-engine/clay clay
clone ceramic-engine/linc_opengl linc_opengl
clone ceramic-engine/linc_stb    linc_stb
clone jeremyfa/linc_soloud       linc_soloud

# Fallbacks if a vendored submodule did not populate:
GLEWH="linc_opengl/lib/glew/include/GL/glew.h"
if [ ! -f "$GLEWH" ]; then mkdir -p "$(dirname "$GLEWH")"; ln -sf /usr/include/GL/glew.h "$GLEWH"; ln -sf /usr/include/GL/glxew.h "$(dirname "$GLEWH")/glxew.h" 2>/dev/null || true; fi
if [ ! -f "linc_soloud/lib/soloud/include/soloud.h" ]; then
  curl -fsSL "https://github.com/jarikomppa/soloud/archive/refs/heads/master.tar.gz" -o /tmp/soloud.tgz
  tar xzf /tmp/soloud.tgz -C /tmp
  cp -r /tmp/soloud-master/include /tmp/soloud-master/src linc_soloud/lib/soloud/
fi

# Register for -lib resolution.
haxelib dev clay        "$DEPS/clay"        >/dev/null
haxelib dev linc_opengl "$DEPS/linc_opengl" >/dev/null
haxelib dev linc_stb    "$DEPS/linc_stb"    >/dev/null
haxelib dev linc_soloud "$DEPS/linc_soloud" >/dev/null

# ALSA null device so SoLoud/miniaudio initializes without a sound card.
printf 'pcm.!default { type null }\nctl.!default { type null }\n' > "$HOME/.asoundrc"

echo "native deps ready in $DEPS"
