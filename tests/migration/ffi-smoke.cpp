#include <cstdio>

// Exact C ABI of the selected Rust exports. This probes the compiled binary independently
// of Haxe codegen; it does not provide the missing general-purpose hxcpp header/link layer.
extern "C" {
float flight_lerp(float a, float b, float t);
void* flight_create_vector2(float x, float y);
float flight_get_vector2_length(const void* source);
float flight_get_vector2_x(const void* source);
float flight_set_vector2_x(void* source, float value);
void flight_free_vector2(void* source);
}

int main() {
  if (flight_lerp(0, 10, 0.25f) != 2.5f) return 1;
  void* vector = flight_create_vector2(3, 4);
  if (!vector) return 2;
  const bool length_ok = flight_get_vector2_length(vector) == 5;
  const bool mutation_ok = flight_set_vector2_x(vector, 6) == 6 && flight_get_vector2_x(vector) == 6;
  flight_free_vector2(vector);
  if (!length_ok || !mutation_ok) return 3;
  std::puts("FLIGHT_NATIVE_FFI_OK");
  return 0;
}
