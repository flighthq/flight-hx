package flight;

#if hl

typedef PromptDialogOptions = flight._hl.PromptDialogOptions;

#elseif cpp

typedef PromptDialogOptions = flight._cpp.PromptDialogOptions;

#elseif (js && flight_esm)

typedef PromptDialogOptions = flight._js.PromptDialogOptions;

#elseif js

#error "flight.PromptDialogOptions on js requires flight_esm."

#else

#error "flight.PromptDialogOptions: no backend for this target."

#end
