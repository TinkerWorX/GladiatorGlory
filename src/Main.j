#include "Build.j"
#include "Config.j"
#include "Credits.j"
#include "Debug.j"

library Main initializer init requires Build, Config, Credits
    private function init takes nothing returns nothing
        call Build_Initialize()
        call Config_Initialize()
        call Credits_Initialize()
        call BJDebugMsg("|cffffcc00Version|r: " + GetBuildVersionString())
    endfunction
endlibrary
