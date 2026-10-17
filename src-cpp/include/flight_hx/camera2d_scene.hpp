#pragma once

// This declaration-only header is intentionally tiny. The generated Scene2D GL include closure is
// compiled once in camera2d_scene.cpp instead of once per hxcpp translation unit.
namespace flight_hx::camera2d {

struct Scene;

Scene* create(int width, int height) noexcept;
void destroy(Scene* scene) noexcept;
int root(const Scene* scene) noexcept;
int create_display_object(Scene* scene, int parent);
int create_shape(Scene* scene, int parent);
int create_solid_sprite(
    Scene* scene,
    int parent,
    double color,
    double x,
    double y,
    double width,
    double height,
    double alpha);
void begin_fill(Scene* scene, int handle, double color, double alpha);
void end_fill(Scene* scene, int handle);
void line_style(Scene* scene, int handle, double thickness, double color, double alpha);
void circle(Scene* scene, int handle, double x, double y, double radius);
void ellipse(Scene* scene, int handle, double x, double y, double radius_x, double radius_y);
void rectangle(Scene* scene, int handle, double x, double y, double width, double height);
void triangle(Scene* scene, int handle, double x0, double y0, double x1, double y1, double x2, double y2);
void move_to(Scene* scene, int handle, double x, double y);
void line_to(Scene* scene, int handle, double x, double y);
void set_transform(
    Scene* scene,
    int handle,
    double scale_x,
    double skew_y,
    double skew_x,
    double scale_y,
    double x,
    double y);
bool render_frame(Scene* scene) noexcept;
int node_count(const Scene* scene) noexcept;
int shape_count(const Scene* scene) noexcept;
int sprite_count(const Scene* scene) noexcept;
int verified_frames(const Scene* scene) noexcept;
int maximum_coverage(const Scene* scene) noexcept;

} // namespace flight_hx::camera2d
