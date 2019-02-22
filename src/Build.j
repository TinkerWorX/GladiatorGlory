#pragma once

#define BUILD_VERSION_MAJOR 0
#define BUILD_VERSION_MINOR 1
#define BUILD_VERSION_PATCH 0

library Build
    globals
        private string BUILD_VERSION_STRING
    endglobals

    function GetBuildVersionString takes nothing returns string
        return BUILD_VERSION_STRING
    endfunction

    public function Initialize takes nothing returns nothing
        set BUILD_VERSION_STRING = I2S(BUILD_VERSION_MAJOR) + "." + I2S(BUILD_VERSION_MINOR) + "." + I2S(BUILD_VERSION_PATCH)
#ifndef RELEASE
        set BUILD_VERSION_STRING = BUILD_VERSION_STRING + "|cffff0000dbg|r"
#endif
    endfunction
endlibrary
