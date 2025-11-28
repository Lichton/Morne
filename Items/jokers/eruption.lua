SMODS.Joker {
	key = 'eruption',
	config = {
      extra = {
		timesmult = 1.25,
      }
    },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 15, y = 0 },
	cost = 7,
    eternal_compat = true,
	blueprint_compat = true,
	
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
				card.ability.extra.timesmult,
            }
    	}
    end,
	calculate = function(self, card, context)
		evil = 0
		if context.individual and context.cardarea == G.play then
        	for _, deck_card in ipairs(G.playing_cards) do
				if deck_card:get_id() == context.other_card:get_id() and deck_card.base.suit == context.other_card.base.suit then
					evil = evil + 1
				end
			end
			if evil < 2 then
				return {
                			xmult = card.ability.extra.timesmult
            		}
			end
		end
	end
}