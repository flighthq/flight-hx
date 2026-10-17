#include <flight_hx/camera2d_scene.hpp>

// Haxe owns the scene description and issues these deliberately small commands. This adapter owns
// only the native Flight objects whose identity and lifetime cannot safely cross the hxcpp GC
// boundary. Every command below forwards to the corresponding generated flight-cpp API.
#define null flight_hx_presence_null
#include <flight/host_sdl/host.hpp>
#include <flight/host_sdl/webgl.hpp>
#include <flight/host_sdl/web_platform.hpp>
#include <flight/node/native_node2d_access.hpp>
#include <flight/scene2d/display_object.hpp>
#include <flight/shape/shape.hpp>
#include <flight/shape/shape_commands.hpp>
#include <flight/path/tessellate_stroke_path.hpp>
#include <flight/render/renderer.hpp>
#include <flight/render_gl/gl_render_state.hpp>
#include <flight/render_gl/gl_render_pass.hpp>
#include <flight/render_gl/gl_render_target.hpp>
#include <flight/render_gl/gl_texture_resolver.hpp>
#include <flight/scene2d_gl/gl_node_2d.hpp>
#include <flight/scene2d_gl/gl_mesh_shape_renderer.hpp>
#include <flight/scene2d_gl/gl_standard_material.hpp>
#undef null

#include <algorithm>
#include <cstddef>
#include <memory>
#include <unordered_map>
#include <utility>
#include <vector>

namespace flight_hx::camera2d {

template <typename Value>
[[nodiscard]] auto readonly_row(const std::shared_ptr<Value>& value) {
  return flight::structural_ref_cast<
      flight::StructuralRef<flight::RowReadonly<flight::RowOf<flight::Ref<Value>>>>>(
      flight::StructuralRef<flight::RowWritable<flight::RowOf<flight::Ref<Value>>>>(value));
}

struct Scene final {
  using Node = flight::types::Node2D;
  using Shape = flight::Ref<flight::types::Shape>;

  Scene(int width_value, int height_value)
      : canvas(flight::host_sdl::GlCanvas::create(
            width_value,
            height_value,
            1.0,
            flight::String("flight-hx Camera2D"),
            true)),
        gl(canvas.get_context()),
        width(width_value),
        height(height_value) {
    gl.make_current();
    const auto size = canvas.pixel_size();
    if (size.width != width || size.height != height) throw 1;

    auto options = flight::make_ref<flight::types::GlRenderStateOptions>();
    options->pixel_ratio = 1.0;
    options->scene_graph_sync_policy = flight::String("requiresInvalidation");
    options->blend_realizations = flight::render_gl::standard_gl_blend_realizations;
    options->texture_resolvers = flight::render_gl::standard_gl_texture_resolvers;
    options->stroke_tessellator =
        flight::types::StrokeTessellator(flight::path::tessellate_stroke_path);
    state = flight::render_gl::create_gl_render_state(gl, readonly_row(options));
    flight::render::register_node_renderer(
        state, flight::types::display_object_kind, flight::scene2d_gl::gl_scene_2d_renderer);
    flight::render::register_node_renderer(
        state, flight::types::shape_kind, flight::scene2d_gl::gl_mesh_shape_renderer);
    flight::scene2d_gl::register_gl_standard_material(state);
    target = flight::render_gl::create_gl_screen_render_target(gl);
    clear = flight::make_ref<flight::types::RenderTargetClear>();
    clear->color = flight::Array<double>{0x1a / 255.0, 0x1a / 255.0, 0x2e / 255.0, 1.0};
    nodes.push_back(flight::scene2d::create_display_object());
  }

  ~Scene() noexcept {
    try {
      if (state && !nodes.empty()) flight::render::dispose_scene_2d_render(state, nodes.front());
    } catch (...) {
    }
  }

  [[nodiscard]] int attach(int parent, Node child) {
    flight::node::add_node_child(node_at(parent), child);
    const int handle = static_cast<int>(nodes.size());
    nodes.push_back(std::move(child));
    return handle;
  }

  [[nodiscard]] Node node_at(int handle) const {
    if (handle < 0 || static_cast<std::size_t>(handle) >= nodes.size()) throw 1;
    return nodes[static_cast<std::size_t>(handle)];
  }

  [[nodiscard]] Shape shape_at(int handle) const {
    const auto found = shapes.find(handle);
    if (found == shapes.end()) throw 1;
    return found->second;
  }

  flight::host_sdl::Host host;
  flight::host_sdl::GlCanvas canvas;
  flight::host_sdl::WebGl2Context gl;
  int width;
  int height;
  flight::Ref<flight::types::GlRenderState> state;
  flight::Ref<flight::types::GlScreenRenderTarget> target;
  flight::Ref<flight::types::RenderTargetClear> clear;
  std::vector<Node> nodes;
  std::unordered_map<int, Shape> shapes;
  int verified_frames{0};
  std::size_t maximum_coverage{0};
};

Scene* create(int width, int height) noexcept {
  try {
    return new Scene(width, height);
  } catch (...) {
    return nullptr;
  }
}

void destroy(Scene* scene) noexcept { delete scene; }
int root(const Scene*) noexcept { return 0; }

int create_display_object(Scene* scene, int parent) {
  return scene->attach(parent, flight::scene2d::create_display_object());
}

int create_shape(Scene* scene, int parent) {
  auto value = flight::shape::create_shape();
  const int handle = scene->attach(parent, flight::node::native_node_2d(value));
  scene->shapes.emplace(handle, std::move(value));
  return handle;
}

void begin_fill(Scene* scene, int handle, double color, double alpha) {
  flight::shape::append_shape_begin_fill(scene->shape_at(handle), color, alpha);
}

void end_fill(Scene* scene, int handle) {
  flight::shape::append_shape_end_fill(scene->shape_at(handle));
}

void line_style(Scene* scene, int handle, double thickness, double color, double alpha) {
  flight::shape::append_shape_line_style(scene->shape_at(handle), thickness, color, alpha);
}

void circle(Scene* scene, int handle, double x, double y, double radius) {
  flight::shape::append_shape_circle(scene->shape_at(handle), x, y, radius);
}

void ellipse(Scene* scene, int handle, double x, double y, double radius_x, double radius_y) {
  flight::shape::append_shape_ellipse(scene->shape_at(handle), x, y, radius_x, radius_y);
}

void rectangle(Scene* scene, int handle, double x, double y, double width, double height) {
  flight::shape::append_shape_rectangle(scene->shape_at(handle), x, y, width, height);
}

void triangle(
    Scene* scene,
    int handle,
    double x0,
    double y0,
    double x1,
    double y1,
    double x2,
    double y2) {
  flight::shape::append_shape_polygon(scene->shape_at(handle), {x0, y0, x1, y1, x2, y2});
}

void move_to(Scene* scene, int handle, double x, double y) {
  flight::shape::append_shape_move_to(scene->shape_at(handle), x, y);
}

void line_to(Scene* scene, int handle, double x, double y) {
  flight::shape::append_shape_line_to(scene->shape_at(handle), x, y);
}

void set_transform(
    Scene* scene,
    int handle,
    double scale_x,
    double skew_y,
    double skew_x,
    double scale_y,
    double x,
    double y) {
  auto node = scene->node_at(handle);
  flight::row_set<flight::RowKey<"scaleX">>(node, scale_x);
  flight::row_set<flight::RowKey<"skewY">>(node, skew_y);
  flight::row_set<flight::RowKey<"skewX">>(node, skew_x);
  flight::row_set<flight::RowKey<"scaleY">>(node, scale_y);
  flight::row_set<flight::RowKey<"x">>(node, x);
  flight::row_set<flight::RowKey<"y">>(node, y);
  flight::node::invalidate_node_local_transform(node);
}

bool render_frame(Scene* scene) noexcept {
  try {
    scene->gl.make_current();
    // False means that an already-prepared graph had no dirty work, not that preparation failed.
    (void)flight::render::prepare_scene_2d_render(scene->state, scene->nodes.front());
    auto pass = flight::render_gl::begin_gl_render_pass(
        scene->state, scene->target, readonly_row(scene->clear));
    flight::scene2d_gl::render_gl_scene_2d(pass, scene->nodes.front());
    flight::render_gl::end_gl_render_pass(pass);
    if (scene->gl.get_error() != flight::host_sdl::WebGl2Context::no_error) return false;

    scene->gl.finish();
    flight::Uint8Array pixels(
        static_cast<std::size_t>(scene->width) * static_cast<std::size_t>(scene->height) * 4U);
    scene->gl.read_pixels(
        0,
        0,
        scene->width,
        scene->height,
        flight::host_sdl::WebGl2Context::rgba,
        flight::host_sdl::WebGl2Context::unsigned_byte,
        pixels);
    if (scene->gl.get_error() != flight::host_sdl::WebGl2Context::no_error) return false;

    std::size_t coverage = 0;
    for (std::size_t index = 0; index < pixels.size(); index += 4) {
      if (pixels[index] != 0x1a || pixels[index + 1] != 0x1a || pixels[index + 2] != 0x2e) {
        ++coverage;
      }
    }
    scene->maximum_coverage = std::max(scene->maximum_coverage, coverage);
    const auto center = static_cast<std::size_t>(
                            (scene->height - 1 - scene->height / 2) * scene->width +
                            scene->width / 2) *
                        4U;
    const bool player_is_yellow =
        pixels[center] >= 240 && pixels[center + 1] >= 180 && pixels[center + 1] <= 220 &&
        pixels[center + 2] >= 35 && pixels[center + 2] <= 70;
    if (coverage < 5000 || !player_is_yellow) return false;

    ++scene->verified_frames;
    scene->gl.present();
    return true;
  } catch (...) {
    return false;
  }
}

int node_count(const Scene* scene) noexcept { return static_cast<int>(scene->nodes.size()); }
int shape_count(const Scene* scene) noexcept { return static_cast<int>(scene->shapes.size()); }
int verified_frames(const Scene* scene) noexcept { return scene->verified_frames; }
int maximum_coverage(const Scene* scene) noexcept {
  return static_cast<int>(scene->maximum_coverage);
}

} // namespace flight_hx::camera2d
