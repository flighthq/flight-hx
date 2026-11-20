#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <vector>

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
  if (flight_get_bitmap_pixel(bitmap, 0, 0) != 0x11223344) return 4;
  flight_set_bitmap_pixel(bitmap, 0, 0, 0x55667711);
  void* shared = flight_share_bitmap(bitmap);
  void* region = flight_create_bitmap_region(shared, 0, 0, 2, 2);
  flight_set_bitmap_region(region, shared, 0, 0, 1, 1);
  flight_free_bitmap_ref(shared);
  unsigned char pixels[4] = {};
  flight_extract_bitmap_pixels(pixels, sizeof pixels, region);
  flight_free_bitmap_region(region);
  if (pixels[0] != 0x55 || pixels[1] != 0x66 || pixels[2] != 0x77 || pixels[3] != 0x11) return 5;
  auto* parent = flight_create_display_object();
  auto* child = flight_create_sprite();
  auto* added = flight_add_node_child(parent, child);
  if (flight_get_node_child_count(parent) != 1) return 6;
  auto* parent_view = flight_get_node_parent(added);
  if (!parent_view || !flight_node_equals(parent_view, parent)) return 7;
  auto* clone = flight_clone_sprite(added);
  if (flight_get_node_child_count(clone) != 0) return 9;
  auto* removed = flight_remove_node_child(parent_view, added);
  if (flight_get_node_child_count(parent) != 0 || flight_get_node_parent(removed)) return 10;
  for (auto* handle : {removed, clone, parent_view, added, child, parent}) flight_free_node(handle);
  unsigned char input[] = {0, 1, 2, 127, 128, 254, 255};
  void* compressed = flight_compress_deflate(input, sizeof input);
  std::vector<unsigned char> compressed_bytes(flight_compress_deflate_result_len(compressed));
  if (compressed_bytes.empty()) return 11;
  for (size_t i = 0; i < compressed_bytes.size(); ++i)
    compressed_bytes[i] = *static_cast<const unsigned char*>(flight_compress_deflate_result_get(compressed, i));
  void* decoded = flight_decompress_deflate(compressed_bytes.data(), compressed_bytes.size(), sizeof input, 0);
  if (!decoded || flight_decompress_deflate_result_len(decoded) != sizeof input) return 12;
  for (size_t i = 0; i < sizeof input; ++i)
    if (*static_cast<const unsigned char*>(flight_decompress_deflate_result_get(decoded, i)) != input[i]) return 14;
  flight_decompress_deflate_result_free(decoded);
  flight_compress_deflate_result_free(compressed);
  void* empty = flight_compress_deflate(nullptr, 0);
  std::vector<unsigned char> empty_bytes(flight_compress_deflate_result_len(empty));
  for (size_t i = 0; i < empty_bytes.size(); ++i)
    empty_bytes[i] = *static_cast<const unsigned char*>(flight_compress_deflate_result_get(empty, i));
  decoded = flight_decompress_deflate(empty_bytes.data(), empty_bytes.size(), 0, 0);
  if (!decoded || flight_decompress_deflate_result_len(decoded) != 0) return 15;
  flight_decompress_deflate_result_free(decoded);
  flight_compress_deflate_result_free(empty);
  if (flight_decompress_deflate(nullptr, 0, 4, 1)) return 16;
  void* font = flight_create_font_resource();
  const char* family = "Sans Ω";
  flight_field_set_font_resource_family(font, family);
  char* family_copy = flight_field_get_font_resource_family(font);
  flight_field_set_font_resource_family(font, nullptr);
  flight_free_font_resource(font);
  if (!family_copy || std::strcmp(family, family_copy) != 0) return 17;
  flight_free_string(family_copy);
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
