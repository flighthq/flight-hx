#include <cstdio>
#include <initializer_list>

#include "flight_ffi.h"

int main() {
  if (flight_lerp(0, 10, 0.25f) != 2.5f) return 1;
  void* vector = flight_create_vector2(3, 4);
  if (!vector) return 2;
  const bool length_ok = flight_get_vector2_length(vector) == 5;
  const bool mutation_ok = flight_set_vector2_x(vector, 6) == 6 && flight_get_vector2_x(vector) == 6;
  flight_free_vector2(vector);
  if (!length_ok || !mutation_ok) return 3;
  void* bitmap = flight_create_bitmap(2, 2, 0x11223344);
  void* region = flight_create_bitmap_region(bitmap, 0, 0, 2, 2);
  flight_set_bitmap_region(region, bitmap, 0, 0, 1, 1);
  flight_free_bitmap_region(region);
  if (flight_get_bitmap_pixel(bitmap, 0, 0) != 0x11223344) return 4;
  flight_set_bitmap_pixel(bitmap, 0, 0, 0x55667711);
  if (flight_get_bitmap_pixel(bitmap, 0, 0) != 0x55667711) return 5;
  flight_free_bitmap(bitmap);
  void* parent = flight_create_display_object();
  void* child = flight_create_sprite();
  void* added = flight_add_node_child(parent, child);
  if (flight_get_node_child_count(parent) != 1) return 6;
  void* parent_view = flight_get_node_parent(added);
  if (!parent_view || flight_get_node_child_count(parent_view) != 1) return 7;
  void* runtime = flight_get_sprite_runtime(added);
  flight_set_sprite_runtime_local_bounds_texture_version(runtime, 91);
  if (flight_get_sprite_runtime_local_bounds_texture_version(runtime) != 91) return 8;
  void* clone = flight_clone_sprite(added);
  if (flight_get_node_child_count(clone) != 0) return 9;
  void* removed = flight_remove_node_child(parent_view, added);
  if (flight_get_node_child_count(parent) != 0 || flight_get_node_parent(removed)) return 10;
  for (void* handle : {removed, clone, runtime, parent_view, added, child, parent}) flight_free_ref(handle);
  std::puts("FLIGHT_NATIVE_FFI_OK");
  return 0;
}
