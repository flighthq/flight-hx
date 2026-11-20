package flight.esm.types.lighting_contract;

#if (js && flight_esm)
typedef AmbientLight = { color:Float, enabled:Bool, intensity:Float, intensityUnit:flight.esm.types.lighting_contract.Types.LightUnit, kind:String };

typedef AmbientLightOptions = { ?color:Null<Float>, ?enabled:Null<Bool>, ?intensity:Null<Float>, ?intensityUnit:Null<String> };

typedef AreaLight = { castsShadow:Bool, color:Float, decay:Float, direction:flight.esm.types.geometry.Types.Vector3, enabled:Bool, intensity:Float, intensityUnit:flight.esm.types.lighting_contract.Types.LightUnit, kind:String, normalBias:Float, pcfRadius:Float, position:flight.esm.types.geometry.Types.Vector3, range:Float, right:flight.esm.types.geometry.Types.Vector3, shadowBias:Float, shadowFar:Float, shadowMapSize:Float, shadowNear:Float, shadowStrength:Float, up:flight.esm.types.geometry.Types.Vector3 };

typedef AreaLightOptions = { ?castsShadow:Null<Bool>, ?color:Null<Float>, ?decay:Null<Float>, ?direction:Null<flight.esm.types.geometry.Types.Vector3Like>, ?enabled:Null<Bool>, ?intensity:Null<Float>, ?intensityUnit:Null<String>, ?normalBias:Null<Float>, ?pcfRadius:Null<Float>, ?position:Null<flight.esm.types.geometry.Types.Vector3Like>, ?range:Null<Float>, ?right:Null<flight.esm.types.geometry.Types.Vector3Like>, ?shadowBias:Null<Float>, ?shadowFar:Null<Float>, ?shadowMapSize:Null<Float>, ?shadowNear:Null<Float>, ?shadowStrength:Null<Float>, ?up:Null<flight.esm.types.geometry.Types.Vector3Like> };

typedef DirectionalLight = { cascadeCount:Float, cascadeSplits:Array<Float>, castsShadow:Bool, color:Float, direction:flight.esm.types.geometry.Types.Vector3, enabled:Bool, intensity:Float, intensityUnit:flight.esm.types.lighting_contract.Types.LightUnit, kind:String, normalBias:Float, pcfRadius:Float, shadowBias:Float, shadowFar:Float, shadowMapSize:Float, shadowNear:Float, shadowStrength:Float };

typedef DirectionalLightOptions = { ?cascadeCount:Null<Float>, ?cascadeSplits:Null<Array<Float>>, ?castsShadow:Null<Bool>, ?color:Null<Float>, ?direction:Null<flight.esm.types.geometry.Types.Vector3Like>, ?enabled:Null<Bool>, ?intensity:Null<Float>, ?intensityUnit:Null<String>, ?normalBias:Null<Float>, ?pcfRadius:Null<Float>, ?shadowBias:Null<Float>, ?shadowFar:Null<Float>, ?shadowMapSize:Null<Float>, ?shadowNear:Null<Float>, ?shadowStrength:Null<Float> };

typedef Environment = { enabled:Bool, environment:Dynamic, intensity:Float, kind:String };

typedef EnvironmentOptions = { ?enabled:Null<Bool>, ?environment:Dynamic, ?intensity:Null<Float> };

typedef HemisphereLight = { enabled:Bool, groundColor:Float, intensity:Float, intensityUnit:flight.esm.types.lighting_contract.Types.LightUnit, kind:String, skyColor:Float };

typedef HemisphereLightOptions = { ?enabled:Null<Bool>, ?groundColor:Null<Float>, ?intensity:Null<Float>, ?intensityUnit:Null<String>, ?skyColor:Null<Float> };

typedef Light = { kind:String };

typedef LightProbe = { enabled:Bool, position:flight.esm.types.geometry.Types.Vector3, shCoefficients:js.lib.Float32Array };

typedef LightProbeGrid = { bounds:flight.esm.types.geometry.Types.AabbLike, enabled:Bool, probes:Array<flight.esm.types.lighting_contract.Types.LightProbe>, resolution:flight.esm.types.geometry.Types.Vector3Like };

typedef LightUnit = String;

typedef PhotometricLightLike = { intensity:Float, intensityUnit:flight.esm.types.lighting_contract.Types.LightUnit };

typedef PointLight = { castsShadow:Bool, color:Float, decay:Float, enabled:Bool, intensity:Float, intensityUnit:flight.esm.types.lighting_contract.Types.LightUnit, layerMask:Float, priority:Float, kind:String, normalBias:Float, pcfRadius:Float, position:flight.esm.types.geometry.Types.Vector3, range:Float, shadowBias:Float, shadowFar:Float, shadowMapSize:Float, shadowNear:Float, shadowStrength:Float };

typedef PointLightOptions = { ?castsShadow:Null<Bool>, ?layerMask:Null<Float>, ?priority:Null<Float>, ?color:Null<Float>, ?decay:Null<Float>, ?enabled:Null<Bool>, ?intensity:Null<Float>, ?intensityUnit:Null<String>, ?normalBias:Null<Float>, ?pcfRadius:Null<Float>, ?position:Null<flight.esm.types.geometry.Types.Vector3Like>, ?range:Null<Float>, ?shadowBias:Null<Float>, ?shadowFar:Null<Float>, ?shadowMapSize:Null<Float>, ?shadowNear:Null<Float>, ?shadowStrength:Null<Float> };

typedef Scene3DForwardLightSelection = { indices:Array<Float>, point:Array<flight.esm.types.lighting_contract.Types.PointLight>, spot:Array<flight.esm.types.lighting_contract.Types.SpotLight> };

typedef Scene3DForwardLightSelectionExplanation = { pointLightCount:Float, reason:String, selectionPrepared:Bool, spotLightCount:Float };

typedef Scene3DLightBlock = { ambientCount:Float, data:js.lib.Float32Array, directionalCount:Float, hemisphereCount:Float, pointCount:Float, spotCount:Float, version:Float };

typedef Scene3DLights = { ambient:Null<flight.esm.types.lighting_contract.Types.AmbientLight>, directional:Null<flight.esm.types.lighting_contract.Types.DirectionalLight>, ?hemisphere:Null<Array<flight.esm.types.lighting_contract.Types.HemisphereLight>>, ?point:Null<Array<flight.esm.types.lighting_contract.Types.PointLight>>, ?spot:Null<Array<flight.esm.types.lighting_contract.Types.SpotLight>> };

typedef Scene3DLightsLike = { ?point:Null<Array<flight.esm.types.lighting_contract.Types.PointLight>>, ambient:Null<flight.esm.types.lighting_contract.Types.AmbientLight>, directional:Null<flight.esm.types.lighting_contract.Types.DirectionalLight>, ?hemisphere:Null<Array<flight.esm.types.lighting_contract.Types.HemisphereLight>>, ?spot:Null<Array<flight.esm.types.lighting_contract.Types.SpotLight>> };

typedef SpotLight = { castsShadow:Bool, color:Float, decay:Float, direction:flight.esm.types.geometry.Types.Vector3, enabled:Bool, innerConeCos:Float, intensity:Float, intensityUnit:flight.esm.types.lighting_contract.Types.LightUnit, layerMask:Float, priority:Float, kind:String, normalBias:Float, outerConeCos:Float, pcfRadius:Float, position:flight.esm.types.geometry.Types.Vector3, range:Float, shadowBias:Float, shadowFar:Float, shadowMapSize:Float, shadowNear:Float, shadowStrength:Float, spotBlend:Float };

typedef SpotLightConeAngles = { innerDegrees:Float, outerDegrees:Float };

typedef SpotLightOptions = { ?castsShadow:Null<Bool>, ?layerMask:Null<Float>, ?priority:Null<Float>, ?color:Null<Float>, ?decay:Null<Float>, ?direction:Null<flight.esm.types.geometry.Types.Vector3Like>, ?enabled:Null<Bool>, ?innerConeDegrees:Null<Float>, ?intensity:Null<Float>, ?intensityUnit:Null<String>, ?normalBias:Null<Float>, ?outerConeDegrees:Null<Float>, ?pcfRadius:Null<Float>, ?position:Null<flight.esm.types.geometry.Types.Vector3Like>, ?range:Null<Float>, ?shadowBias:Null<Float>, ?shadowFar:Null<Float>, ?shadowMapSize:Null<Float>, ?shadowNear:Null<Float>, ?shadowStrength:Null<Float>, ?spotBlend:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
