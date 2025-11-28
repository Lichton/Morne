SMODS.Joker {
	key = 'striped_paint',
    config = { extra = {
		mult = 3,
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 34, y = 0 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
				card.ability.extra.mult
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
		 if context.individual and context.cardarea == G.hand and not context.end_of_round and (context.other_card:is_suit('Hearts') or context.other_card:is_suit('Diamonds'))then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
	end
}