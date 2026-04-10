SMODS.Joker {
	key = 'cutoff_point',
    config = { extra = {
		mult = 2,
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 45, y = 0 },
	cost = 6,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
				card.ability.extra.mult,
                G.GAME.current_round.discards_left
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
		 if context.end_of_round and context.individual and context.cardarea == G.hand then
            if context.other_card:get_id() == 8 or context.other_card:get_id() == 3 then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + (card.ability.extra.mult)
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                        card = card
                    }
                end
            end
        end
	end
}