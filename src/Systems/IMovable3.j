#pragma once

library IMovable3
    interface IMovable3
        method destroy takes nothing returns nothing

        // Sets the position.
        method SetPosition takes real x, real y, real z returns nothing

        // Sets the orientation, does not need to be normalized.
        method SetOrientation takes real x, real y, real z returns nothing

        // Sets the position and updates the orientation based on the last position.
        method Move takes real x, real y, real z returns nothing
    endinterface
endlibrary
