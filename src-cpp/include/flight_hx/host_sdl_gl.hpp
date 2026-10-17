#pragma once

// Keep the same narrow hxcpp namespace correction as the generated-header bridges. The host is
// still entirely flight-cpp: this header only gives Haxe one scalar entry point into its owned SDL
// window, GL context, WebGL-shaped adapter, and presentation path.
#define null flight_hx_presence_null
#include <flight/host_sdl/host.hpp>
#include <flight/host_sdl/webgl.hpp>
#undef null

namespace flight_hx::host_sdl_gl {

inline bool smoke(int width, int height) noexcept {
  try {
    flight::host_sdl::Host host;
    auto canvas = flight::host_sdl::GlCanvas::create(
        width,
        height,
        1.0,
        flight::String("flight-hx SDL3 + GL"),
        true);
    auto gl = canvas.get_context();
    gl.make_current();
    const auto size = canvas.pixel_size();
    if (size.width <= 0 || size.height <= 0) return false;
    gl.viewport(0, 0, size.width, size.height);
    gl.clear_color(0.08F, 0.18F, 0.32F, 1.0F);
    gl.clear(flight::host_sdl::WebGl2Context::color_buffer_bit);
    if (gl.get_error() != flight::host_sdl::WebGl2Context::no_error) return false;
    gl.present();
    return true;
  } catch (...) {
    return false;
  }
}

} // namespace flight_hx::host_sdl_gl
