SMODS.Joker {
	key = 'dumpster_diving',
	config = { extra = { xmult = 2, active = false, odds = 2} },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 14, y = 0 },
	cost = 6,
    config = {
      extra = {
      }
    },
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
            }
    }
    end,
	calculate = function(self, card, context)
        local evil = false
        if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        
        if context.pre_discard and G.GAME.current_round.discards_used == 0 then
            for _, carder in ipairs(G.hand.highlighted) do
                if not (carder.config.center == G.P_CENTERS.c_base) then
                    local not_discards = {}
                    _enhancement = carder.config.center.key
                    for _, card_in_hand in ipairs(G.hand.cards) do
                        if G.hand.cards[_].config.center == G.P_CENTERS.c_base then
                            table.insert(not_discards, G.hand.cards[_])
                        end
                    end
                    --[[for _, card_in_hand in ipairs(not_discards) do
                        for o, evaluated_card in ipairs(G.hand.highlighted) do
                            if card_in_hand == evaluated_card then
                                table.remove(not_discards, _)
                            end
                        end
                    end]]
                    if _enhancement and #not_discards > 0 then
                        evil = true
                        _card = pseudorandom_element(not_discards, pseudoseed('dumpster'))
                        _card:set_ability(_enhancement, nil, true)
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                if _card and not _card.removed then
                                    _card:juice_up(0.3, 0.3)
                                end
                            return true
                            end
                        }))
                    end
                end
            end
            if evil then
                card:juice_up(0.3, 0.3)
                return {
			        message = localize('k_upgrade_ex'),
				-- The return value, "card", is set to the variable "card", which is the joker.
				-- Basically, this tells the return value what it's affecting, which if it's the joker itself, it's usually card.
				-- It can be things like card = context.other_card in some cases, so specifying card (return value) = card (variable from function) is required.
			        card = card
			    }
            end
        end
    end
}