SMODS.Blind {
    key = 'morph',
    mult = 2,
    boss_colour = HEX("9e239c"),
    boss = { min = 2 },
    atlas = 'Blinds',
    pos = {X = 0, y = 2 },
    order = 0,
    dollars = 5,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.before then
                --play_sound('whoosh1', 0.55, 0.62)
                if(G.GAME.current_round.discards_left > 0) then
                    ease_discard(-1)
                end
            end
            if context.pre_discard and not context.hook then
                --play_sound('whoosh1', 0.55, 0.62)
                ease_hands_played(-1)
                 G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = '0.5',
                    func = (function()
                        if(G.GAME.current_round.hands_left == 0) then
                            end_round()
                        end
                        return true
                    end)
                }))
                
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