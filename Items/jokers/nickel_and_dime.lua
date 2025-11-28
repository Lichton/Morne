SMODS.Joker {
	key = 'nickel_and_dime',
	config = { extra = { xmult = 2, minusmoney = 1} },
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
				card.ability.extra.xmult,
                card.ability.extra.minusmoney,
			} 
		}
	end,
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 22, y = 0 },
	cost = 3,
	blueprint_compat = true,
	eternal_compat = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card then
            if not SMODS.has_no_rank(context.other_card) then
                if context.other_card:get_id() == 5 or context.other_card:get_id() == 10 then
                    ease_dollars(- card.ability.extra.minusmoney)
                    return {
                        xmult = card.ability.extra.xmult,
                    }
                end
            end
        end
	end
}