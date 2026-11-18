#include <cstdio>
#include <cstring>
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
  void* clone = flight_clone_sprite(added);
  if (flight_get_node_child_count(clone) != 0) return 9;
  void* removed = flight_remove_node_child(parent_view, added);
  if (flight_get_node_child_count(parent) != 0 || flight_get_node_parent(removed)) return 10;
  for (void* handle : {removed, clone, parent_view, added, child, parent}) flight_free_ref(handle);
  unsigned char input[] = {0, 1, 2, 127, 128, 254, 255};
  void* compressed = flight_compress_deflate(input, sizeof input);
  const auto compressed_length = flight_get_byte_buffer_length(compressed);
  if (!compressed_length) return 11;
  void* decoded = flight_decompress_deflate(flight_get_byte_buffer_data(compressed), compressed_length, sizeof input, 0);
  if (!decoded || flight_get_byte_buffer_length(decoded) != sizeof input || flight_get_byte_buffer_byte(decoded, 6) != 255) return 12;
  unsigned char copied[sizeof input] = {};
  if (flight_copy_byte_buffer(decoded, copied, sizeof copied) != sizeof input) return 13;
  for (unsigned i = 0; i < sizeof input; ++i) if (copied[i] != input[i]) return 14;
  flight_free_byte_buffer(decoded);
  flight_free_byte_buffer(compressed);
  void* empty = flight_compress_deflate(nullptr, 0);
  decoded = flight_decompress_deflate(flight_get_byte_buffer_data(empty), flight_get_byte_buffer_length(empty), 0, 0);
  if (!decoded || flight_get_byte_buffer_length(decoded) != 0) return 15;
  flight_free_byte_buffer(decoded);
  flight_free_byte_buffer(empty);
  if (flight_decompress_deflate(nullptr, 0, 4, 1)) return 16;
  void* font = flight_create_font_resource();
  unsigned char family[] = {'S', 'a', 'n', 's', ' ', 0xce, 0xa9};
  flight_field_set_font_resource_family(font, family, sizeof family);
  void* family_copy = flight_field_get_font_resource_family(font);
  flight_field_set_font_resource_family(font, nullptr, 0);
  flight_free_font_resource(font);
  unsigned char copied_family[sizeof family] = {};
  if (flight_get_byte_buffer_length(family_copy) != sizeof family ||
      flight_copy_byte_buffer(family_copy, copied_family, sizeof family) != sizeof family ||
      std::memcmp(family, copied_family, sizeof family) != 0) return 17;
  flight_free_byte_buffer(family_copy);
  unsigned char reader_input[] = {0x7f, 0x34, 0x12};
  void* reader = flight_create_byte_reader(reader_input, sizeof reader_input, 1);
  reader_input[1] = 0;
  if (!reader || !flight_has_byte_reader_bytes(reader, 2) ||
      flight_read_byte_reader_u16(reader) != 0x1234 || flight_has_byte_reader_bytes(reader, 1)) return 18;
  flight_free_owned_byte_reader(reader);

  void* history = flight_create_command_history();
  if (!history || flight_get_command_history_signals(history)) return 19;
  flight_set_command_history_max_size(history, 91);
  if (flight_get_command_history_max_size(history) != 91) return 8;
  void* enabled = flight_enable_command_history_signals(history);
  void* signal = flight_get_command_history_signals(history);
  if (!enabled || !signal || enabled == signal) return 20;
  flight_free_unit_signal(signal);
  flight_free_unit_signal(enabled);
  flight_free_command_history_ref(history);
  std::puts("FLIGHT_NATIVE_FFI_OK");
  return 0;
}
