SMODS.Joker {
	key = 'mirror_image',
    config = { extra = {
		mult = 5,
        chips = 15
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 39, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
				card.ability.extra.chips
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
		 if context.individual and context.cardarea == G.hand and not context.end_of_round then
            if not SMODS.has_no_rank(context.other_card) then
                if context.other_card:get_id() == 2 or context.other_card:get_id() == 5 then
                    if context.other_card.debuff then
                        return {
                            message = localize('k_debuffed'),
                            colour = G.C.RED
                        }
                    else
                        return {
                            chips = card.ability.extra.chips
                        }
                    end
                end
            end
        end
        if context.individual and context.cardarea == G.play and context.other_card then
            if context.other_card:get_id() == 2 or context.other_card:get_id() == 5 then
                return {
					mult = card.ability.extra.mult,
				}
            end
        end

	end
}