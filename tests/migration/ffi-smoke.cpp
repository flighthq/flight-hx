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
  std::puts("FLIGHT_NATIVE_FFI_OK");
  return 0;
}
