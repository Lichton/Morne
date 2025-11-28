SMODS.Joker {
	key = 'one_armed_bandit',
	config = { extra = {
		--mult_gain = 1,
		--current_mult = 0,
		--max_per = 5,
        chances = 0,
		odds_increase = 1,
	} },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 30, y = 0 },
	cost = 5,
	eternal_compat = true,
	blueprint_compat = false,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.odds_increase,
                card.ability.extra.chances,
            }
    	}
	end,
	calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if card.ability.extra.chances ~= 0 then
                card.ability.extra.chances = 0
                return {
				    message = localize('k_reset'),
			    }
            end
        end
        
        if context.before and not context.blueprint then
            card.ability.extra.chances = math.max(0, card.ability.extra.chances + card.ability.extra.odds_increase)
            return {
				    message = '+1',
                    colour = G.C.GREEN,
			    }
        end
        if context.pre_discard and not context.blueprint then
            card.ability.extra.chances = math.max(0, card.ability.extra.chances - card.ability.extra.odds_increase)
            if card.ability.extra.chances ~= 0 then
                return {
				    message = '-1',
                    colour = G.C.GREEN,
			    }
            end
        end
        if context.mod_probability and context.trigger_obj and not context.blueprint then
            return {
                numerator = context.numerator + card.ability.extra.chances,
                denominator = context.denominator
            }
        end
	end
}
