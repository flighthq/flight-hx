package flight;

#if hl

typedef Skeleton2DSlotAnimationTarget = flight._hl.Skeleton2DSlotAnimationTarget;

#elseif cpp

typedef Skeleton2DSlotAnimationTarget = flight._cpp.Skeleton2DSlotAnimationTarget;

#elseif (js && flight_esm)

typedef Skeleton2DSlotAnimationTarget = flight._js.Skeleton2DSlotAnimationTarget;

#elseif js

#error "flight.Skeleton2DSlotAnimationTarget on js requires flight_esm."

#else

#error "flight.Skeleton2DSlotAnimationTarget: no backend for this target."

#end
