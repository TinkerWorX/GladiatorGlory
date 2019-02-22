#pragma once

#include "Libraries/Math.j"
#include "Systems/IMovable3.j"

library Effect requires IMovable3, Math
    struct Effect extends IMovable3
        private string modelName
        private real x
        private real y
        private real z
        private location loc = Location(0, 0)
        private effect fx = null
        public boolean RelativeZ = true

        public static method create takes string modelName, real x, real y, real z returns Effect
            local Effect this = Effect.allocate()
            set this.fx = AddSpecialEffect(modelName, x, y)
            set this.modelName = modelName
            call this.SetPosition(x, y, z)
            return this
        endmethod

        public method destroy takes nothing returns nothing
            if (this.loc != null) then
                call RemoveLocation(this.loc)
                set this.loc = null
            endif
            if (this.fx != null) then
                call DestroyEffect(this.fx)
                set this.fx = null
            endif
            call this.deallocate()
        endmethod

        public method Flash takes nothing returns nothing
            if (this.fx != null) then
                call DestroyEffect(this.fx)
                set this.fx = AddSpecialEffect(modelName, x, y)
                call this.SetPosition(this.x, this.y, this.z)
            endif
        endmethod

        // === IMovable3 ===
        public method SetPosition takes real x, real y, real z returns nothing
            set this.x = x
            set this.y = y
            set this.z = z
            call MoveLocation(this.loc, x, y)
            if (this.fx != null) then
                if (this.RelativeZ) then
                    call BlzSetSpecialEffectPosition(this.fx, x, y, z + GetLocationZ(this.loc))
                else
                    call BlzSetSpecialEffectPosition(this.fx, x, y, z)
                endif
            endif
        endmethod

        // Function provided by Wareditor
        public method SetOrientation takes real x, real y, real z returns nothing
            local real ax = 0.00
            local real ay = 0.00
            local real az = 0.00
            local real aax
            local real aay
            local real px
            local real py
            if (x == 0.00 and y == 0.00) then
                if (z > 0.00) then
                    set ax = NegHalfPi
                else 
                    set ax = HalfPi
                endif
            elseif (z != 0.00) then
                set aax = Abs(x)
                set aay = Abs(y)
                set px = aax / (aax + aay)
                set py = 1.00 - px
                if (y == 0.00) then
                    set ax = 0.00
                else
                    set ax = Atan(z / y) * py
                endif
                if (x == 0.00) then
                    set ay = 0.00
                else
                    set ay = -Atan(z / x) * px
                endif
            endif
            set az = Atan2(y, x)
            call BlzSetSpecialEffectOrientation(this.fx, ax, ay, az)
        endmethod
        
        public method Move takes real x, real y, real z returns nothing
            call this.SetOrientation(x - this.x, y - this.y, z - this.z)
            call this.SetPosition(x, y, z)
        endmethod
        // === IMovable3 ===
    endstruct
endlibrary
