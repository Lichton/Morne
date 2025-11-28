SMODS.Joker {
	key = 'dopplejoker',
	loc_txt = {
		name = 'Dopple-Joker',
		text = {
			"After hand is finished scoring,",
			
			"give {C:attention}first{} scored card",

			"{C:attention}last{} scored card's suit"
		}
	},
	config = { extra = {} },
	loc_vars = function(self, info_queue, card)

	end,
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 2, y = 0 },
	cost = 5,
	blueprint_compat = false,
	eternal_compat = true,
	calculate = function(self, card, context)
		if context.after and context.scoring_hand and not context.blueprint then
            my_cards = {}
			for _, card_in_hand in ipairs(context.scoring_hand) do
				if not card_in_hand.debuff then
					table.insert(my_cards, card_in_hand)
				end
      		end
			if #my_cards > 1 and not my_cards[1]:is_suit(my_cards[#my_cards].base.suit) then
                local percent = 1.15 - (0.001) / (#G.play.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        my_cards[1]:flip()
                        play_sound('card1', percent)
                        my_cards[1]:juice_up(0.3, 0.3)
                        return true
					end
                }))

				delay(0.2)
				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        my_cards[1]:change_suit(my_cards[#my_cards].base.suit)
						card:juice_up(0.3, 0.3)
                        return {
				    		message = 'b_dopple',
							colour =  G.C.SUITS[my_cards[#my_cards].base.suit]
			    		}
					end
				}))
				

				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        my_cards[1]:flip()
                        play_sound('tarot2', percent, 0.6)
                        my_cards[1]:juice_up(0.3, 0.3)
                        return true
					end
                }))

				delay(0.75)
            end
		end
	end
}