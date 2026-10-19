// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
#include <limits>
#include <stdexcept>
#include <flight/adjustments/contract.hpp>
#include <flight_hx/adjustments.hpp>

namespace flight_hx::adjustments {

namespace {

flight::Array<double> to_flight_array(const ::Array<double>& source) {
  flight::Array<double> result;
  for (int index = 0; index < source->length; ++index) result.push(source[index]);
  return result;
}

::Array<double> to_haxe_array(const flight::Array<double>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");
  }
  ::Array<double> result = ::Array_obj<double>::__new(static_cast<int>(source.size()));
  int index = 0;
  for (const double value : source) result[index++] = value;
  return result;
}

void replace_haxe_array(::Array<double> destination, const flight::Array<double>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");
  }
  destination->resize(static_cast<int>(source.size()));
  int index = 0;
  for (const double value : source) destination[index++] = value;
}

flight::Array<flight::Array<double>> to_flight_nested_array(const ::Array<::Array<double>>& source) {
  flight::Array<flight::Array<double>> result;
  for (int index = 0; index < source->length; ++index) {
    bool reused = false;
    for (int previous = 0; previous < index; ++previous) {
      if (source[index].GetPtr() == source[previous].GetPtr()) {
        result.push(result[static_cast<std::size_t>(previous)]);
        reused = true;
        break;
      }
    }
    if (!reused) result.push(to_flight_array(source[index]));
  }
  return result;
}

::Array<::Array<double>> to_haxe_nested_array(const flight::Array<flight::Array<double>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");
  }
  ::Array<::Array<double>> result = ::Array_obj<::Array<double>>::__new(static_cast<int>(source.size()));
  for (std::size_t index = 0; index < source.size(); ++index) {
    bool reused = false;
    for (std::size_t previous = 0; previous < index; ++previous) {
      if (source[index].identity() == source[previous].identity()) {
        result[static_cast<int>(index)] = result[static_cast<int>(previous)];
        reused = true;
        break;
      }
    }
    if (!reused) result[static_cast<int>(index)] = to_haxe_array(source[index]);
  }
  return result;
}

void replace_haxe_nested_array(::Array<::Array<double>> destination, const flight::Array<flight::Array<double>>& source) {
  if (source.size() > static_cast<std::size_t>(std::numeric_limits<int>::max())) {
    throw std::length_error("Flight Array exceeds the hxcpp Array length limit");
  }
  destination->resize(static_cast<int>(source.size()));
  for (std::size_t index = 0; index < source.size(); ++index) {
    bool reused = false;
    for (std::size_t previous = 0; previous < index; ++previous) {
      if (source[index].identity() == source[previous].identity()) {
        destination[static_cast<int>(index)] = destination[static_cast<int>(previous)];
        reused = true;
        break;
      }
    }
    if (reused) continue;
    ::Array<double> item = destination[static_cast<int>(index)];
    if (!item.GetPtr()) item = ::Array_obj<double>::__new();
    replace_haxe_array(item, source[index]);
    destination[static_cast<int>(index)] = item;
  }
}

} // namespace

double apply_color_matrix_to_color(::Array<double> matrix, double packedRgba) {
  auto flight_matrix = to_flight_array(matrix);
  auto result = flight::adjustments::apply_color_matrix_to_color(flight_matrix, packedRgba);
  replace_haxe_array(matrix, flight_matrix);
  return result;
}

void concat_color_matrix(::Array<double> target, ::Array<double> source) {
  auto flight_target = to_flight_array(target);
  auto flight_source = source.GetPtr() == target.GetPtr() ? flight_target : (to_flight_array(source));
  flight::adjustments::concat_color_matrix(flight_target, flight_source);
  replace_haxe_array(target, flight_target);
  replace_haxe_array(source, flight_source);
}

::Array<double> fuse_color_matrices(::Array<::Array<double>> matrices) {
  auto flight_matrices = to_flight_nested_array(matrices);
  auto result = flight::adjustments::fuse_color_matrices(flight_matrices);
  replace_haxe_nested_array(matrices, flight_matrices);
  return to_haxe_array(result);
}

::Array<double> create_brightness_color_matrix(double amount) {
  auto result = flight::adjustments::create_brightness_color_matrix(amount);
  return to_haxe_array(result);
}

::Array<double> create_channel_mixer_color_matrix(::Array<double> redOut, ::Array<double> greenOut, ::Array<double> blueOut) {
  auto flight_redOut = to_flight_array(redOut);
  auto flight_greenOut = greenOut.GetPtr() == redOut.GetPtr() ? flight_redOut : (to_flight_array(greenOut));
  auto flight_blueOut = blueOut.GetPtr() == redOut.GetPtr() ? flight_redOut : (blueOut.GetPtr() == greenOut.GetPtr() ? flight_greenOut : (to_flight_array(blueOut)));
  auto result = flight::adjustments::create_channel_mixer_color_matrix(flight_redOut, flight_greenOut, flight_blueOut);
  replace_haxe_array(redOut, flight_redOut);
  replace_haxe_array(greenOut, flight_greenOut);
  replace_haxe_array(blueOut, flight_blueOut);
  if (result.identity() == flight_redOut.identity()) return redOut;
  if (result.identity() == flight_greenOut.identity()) return greenOut;
  if (result.identity() == flight_blueOut.identity()) return blueOut;
  return to_haxe_array(result);
}

::Array<double> create_color_balance_color_matrix(::Array<double> shadows, ::Array<double> midtones, ::Array<double> highlights) {
  auto flight_shadows = to_flight_array(shadows);
  auto flight_midtones = midtones.GetPtr() == shadows.GetPtr() ? flight_shadows : (to_flight_array(midtones));
  auto flight_highlights = highlights.GetPtr() == shadows.GetPtr() ? flight_shadows : (highlights.GetPtr() == midtones.GetPtr() ? flight_midtones : (to_flight_array(highlights)));
  auto result = flight::adjustments::create_color_balance_color_matrix(flight_shadows, flight_midtones, flight_highlights);
  replace_haxe_array(shadows, flight_shadows);
  replace_haxe_array(midtones, flight_midtones);
  replace_haxe_array(highlights, flight_highlights);
  if (result.identity() == flight_shadows.identity()) return shadows;
  if (result.identity() == flight_midtones.identity()) return midtones;
  if (result.identity() == flight_highlights.identity()) return highlights;
  return to_haxe_array(result);
}

::Array<double> create_color_matrix_from_tint(double packedRgba, double amount) {
  auto result = flight::adjustments::create_color_matrix_from_tint(packedRgba, amount);
  return to_haxe_array(result);
}

::Array<double> create_contrast_color_matrix(double amount) {
  auto result = flight::adjustments::create_contrast_color_matrix(amount);
  return to_haxe_array(result);
}

::Array<double> create_desaturate_color_matrix(double amount) {
  auto result = flight::adjustments::create_desaturate_color_matrix(amount);
  return to_haxe_array(result);
}

::Array<double> create_grayscale_color_matrix() {
  auto result = flight::adjustments::create_grayscale_color_matrix();
  return to_haxe_array(result);
}

::Array<double> create_hue_rotate_color_matrix(double degrees) {
  auto result = flight::adjustments::create_hue_rotate_color_matrix(degrees);
  return to_haxe_array(result);
}

::Array<double> create_identity_color_matrix() {
  auto result = flight::adjustments::create_identity_color_matrix();
  return to_haxe_array(result);
}

::Array<double> create_invert_color_matrix() {
  auto result = flight::adjustments::create_invert_color_matrix();
  return to_haxe_array(result);
}

::Array<double> create_levels_color_matrix(double inBlack, double inWhite, double outBlack, double outWhite, bool gammaPresent, double gamma) {
  auto result = flight::adjustments::create_levels_color_matrix(inBlack, inWhite, outBlack, outWhite, (gammaPresent ? std::optional<double>{gamma} : std::nullopt));
  return to_haxe_array(result);
}

::Array<double> create_opacity_color_matrix(double alpha) {
  auto result = flight::adjustments::create_opacity_color_matrix(alpha);
  return to_haxe_array(result);
}

::Array<double> create_polaroid_color_matrix() {
  auto result = flight::adjustments::create_polaroid_color_matrix();
  return to_haxe_array(result);
}

::Array<double> create_saturation_color_matrix(double amount) {
  auto result = flight::adjustments::create_saturation_color_matrix(amount);
  return to_haxe_array(result);
}

::Array<double> create_sepia_color_matrix() {
  auto result = flight::adjustments::create_sepia_color_matrix();
  return to_haxe_array(result);
}

::Array<double> create_technicolor_color_matrix() {
  auto result = flight::adjustments::create_technicolor_color_matrix();
  return to_haxe_array(result);
}

::Array<double> create_vintage_color_matrix() {
  auto result = flight::adjustments::create_vintage_color_matrix();
  return to_haxe_array(result);
}

::Array<double> create_white_balance_color_matrix(double temperature, double tint) {
  auto result = flight::adjustments::create_white_balance_color_matrix(temperature, tint);
  return to_haxe_array(result);
}

bool is_affine_color_matrix(::Array<double> matrix) {
  auto flight_matrix = to_flight_array(matrix);
  auto result = flight::adjustments::is_affine_color_matrix(flight_matrix);
  replace_haxe_array(matrix, flight_matrix);
  return result;
}

::Array<double> multiply_color_matrix(::Array<double> a, ::Array<double> b, bool outPresent, ::Array<double> out) {
  auto flight_a = to_flight_array(a);
  auto flight_b = b.GetPtr() == a.GetPtr() ? flight_a : (to_flight_array(b));
  auto flight_out = out.GetPtr() == a.GetPtr() ? flight_a : (out.GetPtr() == b.GetPtr() ? flight_b : (to_flight_array(out)));
  auto result = flight::adjustments::multiply_color_matrix(flight_a, flight_b, (outPresent ? std::optional<flight::Array<double>>{flight_out} : std::nullopt));
  replace_haxe_array(a, flight_a);
  replace_haxe_array(b, flight_b);
  if (outPresent) replace_haxe_array(out, flight_out);
  if (result.identity() == flight_a.identity()) return a;
  if (result.identity() == flight_b.identity()) return b;
  if (outPresent && result.identity() == flight_out.identity()) return out;
  return to_haxe_array(result);
}

} // namespace flight_hx::adjustments
