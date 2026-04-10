SMODS.Joker {
	key = 'deadly_number',
	config = { extra = {} },
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
			} 
		}
	end,
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 48, y = 0 },
	cost = 7,
	blueprint_compat = false,
	eternal_compat = true,
	calculate = function(self, card, context)
		if context.before and context.scoring_hand and not context.blueprint then
			val = 0
			for _, card_in_hand in ipairs(context.full_hand) do
				if not SMODS.has_no_rank(context.full_hand[_]) then
					if context.full_hand[_]:get_id() == 4 then
						val = val + 1
                    end
				end
      		end
			
            if val > 0 and #context.full_hand == 2 then
				local percent = 1.15 - (0.001) / (#G.play.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        context.full_hand[1]:flip()
						 context.full_hand[2]:flip()
                        play_sound('tarot2', percent, 0.6)
						context.full_hand[1]:juice_up(0.3, 0.3)
                        context.full_hand[2]:juice_up(0.3, 0.3)
                        return true
					end
                }))

				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.2,
                    func = function()
                        copy_card(context.full_hand[2], context.full_hand[1])
						return true
					end
				}))
				

				G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        context.full_hand[1]:flip()
						 context.full_hand[2]:flip()
                        play_sound('tarot2', percent, 0.6)
						context.full_hand[1]:juice_up(0.3, 0.3)
                        context.full_hand[2]:juice_up(0.3, 0.3)
                        return true
					end
                }))
                end  

				delay(0.75)
            end
		end
}