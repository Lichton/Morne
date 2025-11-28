SMODS.Joker {
	key = 'iceberg',
	config = { extra = {} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 10, y = 0 },
	cost = 4,
	config = {
      extra = {
            xchips = 2.5, 
        }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xchips
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
        if context.joker_main then
            local good = true
            for _, card_in_hand in ipairs(context.scoring_hand) do
				if not SMODS.has_no_rank(context.scoring_hand[_]) and not context.scoring_hand[_].debuff then
                    if context.scoring_hand[_]:get_id() > 7 then
                        if context.scoring_hand[_]:get_id() ~= 14 then
                            good = false
                        end
                    end
				end
      		end
            if good == true then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end
	end
}