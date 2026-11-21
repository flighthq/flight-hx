import flight.esm.App;
import flight.esm.Bitmap;
import flight.esm.HostWeb;
import flight.esm.Texture;
import flight.esm.types.app.Types.HostWindowLifecycleCapability;
import flight.esm.types.texture_contract.Types.Sampler;
import flight.esm.types.texture_contract.Types.TextureLike;
import js.Syntax;

class GeneratedTypesSmoke {
  static function main() {
    final red:Float = Bitmap.ImageChannel.Red;
    final green:Float = Bitmap.ImageChannel.Green;
    final blue:Float = Bitmap.ImageChannel.Blue;
    final alpha:Float = Bitmap.ImageChannel.Alpha;
    if (red != 0 || green != 1 || blue != 2 || alpha != 3) throw 'RGBA channel offsets changed';

    final texture:TextureLike = Texture.createTexture2D();
    checkTexture(texture, '2d');
    checkTexture(Texture.cloneTexture(texture), '2d');
    checkTexture(Texture.createCubeTexture(), 'cube');
    checkWindow();

    #if flight_invalid_esm_fields
    trace(Bitmap.ImageChannel.missingChannel);
    trace(texture.missingTextureField);
    #end
    trace('FLIGHT_GENERATED_TYPES_OK');
  }

  static function checkTexture(texture:TextureLike, dimension:String) {
    final sampler:Sampler = texture.sampler;
    if (texture.dimension != dimension || sampler == null || Texture.getTextureSource(texture) != null)
      throw 'Unexpected texture shape';
  }

  static function checkWindow() {
    final window:js.html.Window = Syntax.code(
      "({addEventListener() {}, removeEventListener() {}, close() { throw new Error('caller owns the window'); }})"
    );
    final host = HostWeb.webHost;
    final capabilities = host.window;
    final lifecycle:HostWindowLifecycleCapability = HostWeb.webHostWindowLifecycle;
    final flightWindow = App.createAppWindow();
    if (!App.attachWindow(capabilities.attach, lifecycle, flightWindow, window, 'host'))
      throw 'Browser window attach failed';
    if (HostWeb.getWebWindowHandle(flightWindow) != window)
      throw 'Browser window handle changed';
    if (!App.closeWindow(capabilities.lifecycle, flightWindow) || HostWeb.getWebWindowHandle(flightWindow) != null)
      throw 'Browser window did not detach';
    App.disposeAppWindow(flightWindow);

    #if flight_invalid_esm_fields
    trace(host.missingHostField);
    trace(HostWeb.webHostWindowLifecycle.missingWindowMethod);
    #end
  }
}
