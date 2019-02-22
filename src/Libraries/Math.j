#pragma once

library Math
    globals
        constant real Pi = 3.14159
        constant real NegPi = -3.14159
        constant real HalfPi = 0.50 * 3.14159
        constant real NegHalfPi = -0.50 * 3.14159
    endglobals

    function Abs takes real value returns real
        if (value < 0) then
            return -value
        endif
        return value
    endfunction

    function Floor takes real value returns real
     local integer iValue = R2I(value)
        if (iValue > value) then
            set value = iValue - 1.00
        endif
        return value
    endfunction

    function Ceil takes real value returns real
     local integer iValue = R2I(value)
        if (iValue < value) then
            set value = iValue + 1.00
        endif
        return value
    endfunction

    function Sign takes real value returns real
        if (value > 0.00) then
            return 1.00
        elseif (value < 0.00) then
            return -1.00
        endif
        return 0.00
    endfunction

    function ISign takes integer value returns integer
        if (value > 0) then
            return 1
        elseif (value < 0) then
            return -1
        endif
        return 0
    endfunction

    function SquareDistance takes real x1, real y1, real x2, real y2 returns real
        local real dx = x2 - x1
        local real dy = y2 - y1
        return dx * dx + dy * dy
    endfunction

    function Distance takes real x1, real y1, real x2, real y2 returns real
        local real dx = x2 - x1
        local real dy = y2 - y1
        return SquareRoot(dx * dx + dy * dy)
    endfunction
endlibrary
