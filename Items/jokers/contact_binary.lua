SMODS.Joker {
	key = 'contact_binary',
	config = {
      extra = {

      }
    },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 28, y = 0 },
	cost = 4,
    eternal_compat = true,
	blueprint_compat = true,
	config = { extra = {
		--mult_gain = 1,
		--current_mult = 0,
		--max_per = 5,
		mult = 1,
	} },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
				card.ability.extra.mult
            }
    	}
    end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card then
            if not SMODS.has_no_rank(context.other_card) then
                if context.other_card:get_id() == 8 or context.other_card:get_id() == 4 or context.other_card:get_id() == 2 then
                    return {
                        mult = card.ability.extra.mult * G.GAME.hands[context.scoring_name].level,
                    }
                end
            end
        end
	end
}