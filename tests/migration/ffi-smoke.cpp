#include <cstdio>

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
  std::puts("FLIGHT_NATIVE_FFI_OK");
  return 0;
}
