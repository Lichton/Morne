SMODS.Blind {
    key = 'drab',
    mult = 2,
    boss_colour = HEX("71ae91"),
    boss = { min = 4 },
    atlas = 'Blinds',
    pos = {X = 0, y = 3 },
    order = 0,
    dollars = 5,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.before then
                my_cards = {}
                for _, card_in_hand in ipairs(context.full_hand) do
                    if context.full_hand[_].config.center ~= G.P_CENTERS.c_base or context.full_hand[_]:get_seal(true) or context.full_hand[_].edition ~= nil then 
                        table.insert(my_cards, context.full_hand[_])
                    end
                end
                if #my_cards > 0 then
                    play_sound('card1', percent)
                    for i, card_in_hand in pairs(my_cards) do
                        my_cards[i]:set_ability(G.P_CENTERS.c_base, nil, false)
                        my_cards[i]:set_seal(nil, nil, false)
                        my_cards[i]:set_edition(nil, true, true)
                        card_in_hand:flip()
                        card_in_hand:juice_up(0.3, 0.3)
                        
                    end
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.2,
                        func = function()
                            play_sound('tarot2', percent)
                            for i, card_in_hand in pairs(my_cards) do
                                card_in_hand:flip()
                                card_in_hand:juice_up(0.3, 0.3)
                            end
                            return true
                        end
                    }))
                    delay(0.4)	
                end
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