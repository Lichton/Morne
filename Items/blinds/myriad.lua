SMODS.Blind {
    key = 'myriad',
    mult = 2,
    boss_colour = HEX("b49429"),
    boss = { min = 1 },
    atlas = 'Blinds',
    pos = {X = 0, y = 5 },
    order = 0,
    dollars = 5,
    debuff_hand = function(self, cards, hand, handname, check)
        local suitList = {}
        for _, carder in ipairs(cards) do
            if not SMODS.has_no_suit(carder) then
                suitList[localize(carder.base.suit, 'suits_plural')] = 1
            end
        end
        local counter = 0
        for key, value in pairs(suitList) do
            counter = counter + 1
        end
        if counter < 2 then
            return true
        else
            return false
        end

    end,
    set_blind = function(self)

    end,
    disable = function(self)

    end,
    defeat = function(self)

    end
}