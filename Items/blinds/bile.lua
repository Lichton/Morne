SMODS.Blind {
    key = 'bile',
    mult = 2,
    boss_colour = HEX("787900"),
    boss = { min = 6,},
    atlas = 'Blinds',
    pos = {X = 0, y = 6 },
    order = 0,
    dollars = 5,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.post_trigger then
                ease_dollars(-1)
            end
        end
    end,
    set_blind = function(self)

    end,
    disable = function(self)

    end,
    defeat = function(self)

    end
}