#!/usr/bin/env bash
# Assembles the native toolchain the hostClay smoke needs: Clay (for clay.buffers)
# plus the linc bindings hostClay's adapters compile against, registered via
# `haxelib dev`, plus an ALSA null device so SoLoud can init headless. System
# SDL2/GLEW/ALSA/Mesa are expected to be installed by the workflow. Run from a
# scratch dir; pass it as $1.
#
# Deps are PINNED to the exact revisions the smoke was verified against, so a
# green run stays reproducible and cannot drift out from under us (Clay's default
# branch has moved through a GLGraphicsDriver refactor since — the pin avoids it).
# linc_soloud is the one unpinned dep (stable repo, no verified SHA to pin).
set -euo pipefail

DEPS="${1:-$PWD/.native-deps}"
mkdir -p "$DEPS"
cd "$DEPS"

# Pinned checkout via fetch-by-SHA (GitHub allows fetching a reachable commit),
# so we get the exact revision without a full-history clone.
fetch_pin() { # repo, dir, sha
  [ -d "$2/.git" ] && return 0
  mkdir -p "$2"
  git -C "$2" init -q
  git -C "$2" remote add origin "https://github.com/$1"
  git -C "$2" fetch -q --depth 1 origin "$3"
  git -C "$2" checkout -q FETCH_HEAD
}
fetch_head() { # repo, dir  (unpinned default branch)
  [ -d "$2/.git" ] && return 0
  git clone -q --depth 1 "https://github.com/$1" "$2"
}
submods() { # dir  (best-effort; fallbacks below cover a miss)
  git -C "$1" submodule update --init --recursive --depth 1 -q 2>/dev/null || true
}

# Clay is pure Haxe here (only clay.buffers is used) — no submodules needed.
fetch_pin  ceramic-engine/clay        clay        8ae994a407b2cd3162e093d4fd22c4b6fb2289ec
# linc_opengl vendors GLEW as a submodule (fallback: system GLEW, below).
fetch_pin  ceramic-engine/linc_opengl linc_opengl 4efe2877831c08f1e3ee8c9fdddc9e4b0cb5fa4f; submods linc_opengl
fetch_pin  ceramic-engine/linc_stb    linc_stb    8fcaea2d55d0fdefb819945d9ec370ebb4b0d3af
# linc_soloud vendors the SoLoud core as a submodule (fallback: curl, below).
fetch_head jeremyfa/linc_soloud       linc_soloud; submods linc_soloud

# Per-OS system include dir for the GLEW fallback (Linux apt vs macOS Homebrew).
case "$(uname -s)" in
  Darwin) SYS_GL_INC="$( [ -d /opt/homebrew/include/GL ] && echo /opt/homebrew/include || echo /usr/local/include )/GL" ;;
  *)      SYS_GL_INC="/usr/include/GL" ;;
esac

# Fallbacks if a vendored submodule did not populate:
GLEWH="linc_opengl/lib/glew/include/GL/glew.h"
if [ ! -f "$GLEWH" ]; then
  mkdir -p "$(dirname "$GLEWH")"
  ln -sf "$SYS_GL_INC/glew.h" "$GLEWH"
  ln -sf "$SYS_GL_INC/glxew.h" "$(dirname "$GLEWH")/glxew.h" 2>/dev/null || true
fi
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

# Linux: an ALSA null device so SoLoud initializes without a sound card. macOS
# uses CoreAudio, which SoLoud opens without extra setup.
if [ "$(uname -s)" = "Linux" ]; then
  printf 'pcm.!default { type null }\nctl.!default { type null }\n' > "$HOME/.asoundrc"
fi

echo "native deps ready in $DEPS"
