package flight._js._fn;

@:jsRequire("@flighthq/path")
extern class Path {
	@:native("cleanPath")
	public static function cleanPath(source:flight._js.Path, tolerance:Float, out:flight._js.Path, flattenTolerance:Null<Float>):Void;
	@:native("containsPathPoint")
	public static function containsPathPoint(path:flight._js.Path, px:Float, py:Float, tolerance:Null<Float>):Bool;
	@:native("clonePath")
	public static function clonePath(source:flight._js.Path):flight._js.Path;
	@:native("copyPath")
	public static function copyPath(out:flight._js.Path, source:flight._js.Path):Void;
	@:native("dashPath")
	public static function dashPath(source:flight._js.Path, dash:Dynamic, dashOffset:Float, out:flight._js.Path, tolerance:Null<Float>):Void;
	@:native("decimatePath")
	public static function decimatePath(source:flight._js.Path, tolerance:Float, out:flight._js.Path, flattenTolerance:Null<Float>):Void;
	@:native("explainPathMorphCreation")
	public static function explainPathMorphCreation(start:flight._js.Path, end:flight._js.Path):flight._js.PathMorphCreationExplanation;
	@:native("explainStrokePathTessellation")
	public static function explainStrokePathTessellation(path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Null<Float>):flight._js.StrokePathTessellationExplanation;
	@:native("fitPathCurves")
	public static function fitPathCurves(source:flight._js.Path, tolerance:Float, out:flight._js.Path, flattenTolerance:Null<Float>):Void;
	@:native("forEachPathSegment")
	public static function forEachPathSegment(path:flight._js.Path, visitor:Dynamic):Void;
	@:native("getPathBounds")
	public static function getPathBounds(path:flight._js.Path, out:flight._js.Rectangle):Bool;
	@:native("getPathContourLengths")
	public static function getPathContourLengths(path:flight._js.Path, tolerance:Null<Float>):Dynamic;
	@:native("getPathCurvatureAtDistance")
	public static function getPathCurvatureAtDistance(path:flight._js.Path, distance:Float, tolerance:Null<Float>):Float;
	@:native("getPathLength")
	public static function getPathLength(path:flight._js.Path, tolerance:Null<Float>):Float;
	@:native("getPathNearestPoint")
	public static function getPathNearestPoint(path:flight._js.Path, px:Float, py:Float, out:flight._js.Vector2, tolerance:Null<Float>):Float;
	@:native("getPathPointAtDistance")
	public static function getPathPointAtDistance(path:flight._js.Path, distance:Float, out:flight._js.Vector2, tolerance:Null<Float>):Bool;
	@:native("getPathPositionAtDistance")
	public static function getPathPositionAtDistance(path:flight._js.Path, distance:Float, pointOut:flight._js.Vector2, tangentOut:flight._js.Vector2, tolerance:Null<Float>):Bool;
	@:native("getPathTangentAtDistance")
	public static function getPathTangentAtDistance(path:flight._js.Path, distance:Float, out:flight._js.Vector2, tolerance:Null<Float>):Bool;
	@:native("getCubicBezierCurvature")
	public static function getCubicBezierCurvature(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float):Float;
	@:native("getCubicBezierPoint")
	public static function getCubicBezierPoint(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("getCubicBezierTangent")
	public static function getCubicBezierTangent(x0:Float, y0:Float, c1x:Float, c1y:Float, c2x:Float, c2y:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("getPathSegmentCurvatureAtParameter")
	public static function getPathSegmentCurvatureAtParameter(path:flight._js.Path, segmentIndex:Int, t:Float):Null<Float>;
	@:native("getPathSegmentPointAtParameter")
	public static function getPathSegmentPointAtParameter(path:flight._js.Path, segmentIndex:Int, t:Float, out:flight._js.Vector2):Bool;
	@:native("getPathSegmentTangentAtParameter")
	public static function getPathSegmentTangentAtParameter(path:flight._js.Path, segmentIndex:Int, t:Float, out:flight._js.Vector2):Bool;
	@:native("getQuadraticBezierCurvature")
	public static function getQuadraticBezierCurvature(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float):Float;
	@:native("getQuadraticBezierPoint")
	public static function getQuadraticBezierPoint(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("getQuadraticBezierTangent")
	public static function getQuadraticBezierTangent(x0:Float, y0:Float, cx:Float, cy:Float, x1:Float, y1:Float, t:Float, out:flight._js.Vector2):Void;
	@:native("getPathContourOrientation")
	public static function getPathContourOrientation(path:flight._js.Path, tolerance:Null<Float>):Dynamic;
	@:native("getPathSignedArea")
	public static function getPathSignedArea(path:flight._js.Path, tolerance:Null<Float>):Float;
	@:native("createPath")
	public static function createPath(winding:Null<Dynamic>):flight._js.Path;
	@:native("appendPathArc")
	public static function appendPathArc(path:flight._js.Path, centerX:Float, centerY:Float, radius:Float, startAngle:Float, endAngle:Float, anticlockwise:Null<Bool>, connectToCurrent:Null<Bool>):Void;
	@:native("appendPathCircle")
	public static function appendPathCircle(path:flight._js.Path, centerX:Float, centerY:Float, radius:Float):Void;
	@:native("appendPathClose")
	public static function appendPathClose(path:flight._js.Path):Void;
	@:native("appendPathCubicCurveTo")
	public static function appendPathCubicCurveTo(path:flight._js.Path, controlX1:Float, controlY1:Float, controlX2:Float, controlY2:Float, x:Float, y:Float):Void;
	@:native("appendPathEllipse")
	public static function appendPathEllipse(path:flight._js.Path, centerX:Float, centerY:Float, radiusX:Float, radiusY:Float):Void;
	@:native("appendPathEllipticalArcTo")
	public static function appendPathEllipticalArcTo(path:flight._js.Path, radiusX:Float, radiusY:Float, xAxisRotation:Float, largeArc:Bool, sweep:Bool, endX:Float, endY:Float):Void;
	@:native("appendPathLineTo")
	public static function appendPathLineTo(path:flight._js.Path, x:Float, y:Float):Void;
	@:native("appendPathMoveTo")
	public static function appendPathMoveTo(path:flight._js.Path, x:Float, y:Float):Void;
	@:native("appendPathPolygon")
	public static function appendPathPolygon(path:flight._js.Path, points:Dynamic):Void;
	@:native("appendPathPolyline")
	public static function appendPathPolyline(path:flight._js.Path, points:Dynamic):Void;
	@:native("appendPathQuadraticCurveTo")
	public static function appendPathQuadraticCurveTo(path:flight._js.Path, controlX:Float, controlY:Float, x:Float, y:Float):Void;
	@:native("appendPathRectangle")
	public static function appendPathRectangle(path:flight._js.Path, x:Float, y:Float, width:Float, height:Float):Void;
	@:native("appendPathRoundedRectangle")
	public static function appendPathRoundedRectangle(path:flight._js.Path, x:Float, y:Float, width:Float, height:Float, radius:Float):Void;
	@:native("appendPathRoundedRectangleWithCornerRadii")
	public static function appendPathRoundedRectangleWithCornerRadii(path:flight._js.Path, x:Float, y:Float, width:Float, height:Float, topLeft:Float, topRight:Float, bottomRight:Float, bottomLeft:Float):Void;
	@:native("appendPathTangentArcTo")
	public static function appendPathTangentArcTo(path:flight._js.Path, x1:Float, y1:Float, x2:Float, y2:Float, radius:Float):Void;
	@:native("getPathLastPoint")
	public static function getPathLastPoint(path:flight._js.Path):Null<Array<Float>>;
	@:native("createPathMorph")
	public static function createPathMorph(start:flight._js.Path, end:flight._js.Path):Null<flight._js.PathMorph>;
	@:native("samplePathMorph")
	public static function samplePathMorph(out:flight._js.Path, morph:flight._js.PathMorph, progress:Float):Void;
	@:native("reversePath")
	public static function reversePath(source:flight._js.Path, out:flight._js.Path):Void;
	@:native("strokePath")
	public static function strokePath(path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Null<Float>):flight._js.Path;
	@:native("tessellatePath")
	public static function tessellatePath(path:flight._js.Path, tolerance:Null<Float>):flight._js.PathMesh;
	@:native("tessellatePathInto")
	public static function tessellatePathInto(path:flight._js.Path, out:flight._js.PathMesh, tolerance:Null<Float>):Void;
	@:native("tessellatePathTyped")
	public static function tessellatePathTyped(path:flight._js.Path, tolerance:Null<Float>):flight._js.PathMeshTyped;
	@:native("tessellatePathTypedInto")
	public static function tessellatePathTypedInto(path:flight._js.Path, out:flight._js.PathMeshTyped, tolerance:Null<Float>):Void;
	@:native("tessellateStrokePath")
	public static function tessellateStrokePath(path:flight._js.Path, style:flight._js.StrokeStyle, tolerance:Null<Float>):Null<flight._js.PathMesh>;
	@:native("transformPath")
	public static function transformPath(source:flight._js.Path, matrix:flight._js.Matrix, out:flight._js.Path):Void;
	@:native("translatePath")
	public static function translatePath(source:flight._js.Path, dx:Float, dy:Float, out:flight._js.Path):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePath(ptr:flight._js.Path):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePathMorphCreationExplanation(ptr:flight._js.PathMorphCreationExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStrokePathTessellationExplanation(ptr:flight._js.StrokePathTessellationExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePathMorph(ptr:flight._js.PathMorph):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePathMesh(ptr:flight._js.PathMesh):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePathMeshTyped(ptr:flight._js.PathMeshTyped):Void {}
}
