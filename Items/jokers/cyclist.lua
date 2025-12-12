SMODS.Joker {
	key = 'cyclist',
	config = { extra = {} },
	loc_vars = function(self, info_queue, card)

	end,
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 8, y = 0 },
	cost = 6,
	eternal_compat = true,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and next(context.poker_hands['Straight']) then
            my_cards = {}
			for _, card_in_hand in ipairs(context.scoring_hand) do
				if not SMODS.has_no_rank(context.scoring_hand[_]) and not context.scoring_hand[_].debuff then
					table.insert(my_cards, context.scoring_hand[_])
				end
			end
			if #my_cards > 0 then
				play_sound('card1', percent)
				for i, card_in_hand in pairs(my_cards) do
					card_in_hand:flip()
					SMODS.modify_rank(card_in_hand, 1)
					card_in_hand:juice_up(0.3, 0.3)
					card:juice_up()
				end 
				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.25,
                    func = function()
						play_sound('tarot2', percent)
						for i, card_in_hand in pairs(my_cards) do
                        	card_in_hand:flip()
                        	card:juice_up()
                        	card_in_hand:juice_up(0.3, 0.3)
                        end
						return true
					end
                }))
				delay(0.2)	
			end
		end
	end
}