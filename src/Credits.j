#pragma once

library Credits
    private function getDetails takes nothing returns string
        return "You can get more detailed credits at |cffffceabhttps://github.com/TinkerWorX/GladiatorGlory|r"
    endfunction

    public function Initialize takes nothing returns nothing
        local quest credits = CreateQuest()
        call QuestSetTitle(credits, "Credits")
        call QuestSetDescription(credits, "assasin_lord" + "|n|n" + getDetails())
        call QuestSetIconPath(credits, "ReplaceableTextures/CommandButtons/BTNAmbush.blp")
        call QuestSetRequired(credits, false)
        call QuestSetDiscovered(credits, true)
    endfunction
endlibrary
