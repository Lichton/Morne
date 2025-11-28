SMODS.Joker {
	key = 'dead_weight',
	config = {
      extra = {
        odds = 4
      }
    },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 23, y = 0 },
	cost = 6,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
		local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator
            }
    	}
	end,
	calculate = function(self, card, context)
		local target_id = 999
		if context.before and next(context.poker_hands['Straight']) then
			for _, card_in_hand in ipairs(context.scoring_hand) do
				if not SMODS.has_no_rank(context.scoring_hand[_]) and not (context.scoring_hand[_].debuff) then
					if card_in_hand:get_id() == 14 then
						target_id = 14
					else 
						if card_in_hand:get_id() < target_id then
						target_id = card_in_hand:get_id()
						end
					end
				end
			end
			for _, card_in_hand in ipairs(context.scoring_hand) do
				if target_id < 999 and card_in_hand:get_id() == target_id and not SMODS.has_enhancement(card_in_hand, 'm_steel') then
					G.E_MANAGER:add_event(Event({
						func = function()
							card:juice_up()
							return true
						end
					}))
					card_in_hand:set_ability('m_steel', nil, true)
					return {
						message = localize('b_dead_weight'),
						card = card_in_hand
					}
				end
			end
		end
	end
}
