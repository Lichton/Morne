SMODS.Joker {
	key = 'apples_to_oranges',
	config = { extra = { xmult = 2} },
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
				card.ability.extra.xmult,
			} 
		}
	end,
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 1, y = 0 },
	cost = 5,
	blueprint_compat = true,
	eternal_compat = true,
	calculate = function(self, card, context)
		local my_index = 1
		if context.individual and context.cardarea == G.play and context.other_card and not context.repetition then
			if context.other_card:is_suit('Diamonds') then
				my_cards = {}
				for _, card_in_hand in ipairs(context.scoring_hand) do
					if card_in_hand == context.other_card then
						my_index = _
					end
					table.insert(my_cards, card_in_hand)
      			end
				if #my_cards > 1 and my_index > 1 and my_cards[my_index - 1]:is_suit('Hearts') and not my_cards[my_index - 1].debuff and not SMODS.has_no_rank(my_cards[my_index - 1]) then
					return {
					xmult = card.ability.extra.xmult,
					}
				end
			end
		end
	end
}