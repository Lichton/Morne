SMODS.Joker {
	key = 'smog',
	config = { extra = { mult = 0, mult_gain = 1} },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 4, y = 0 },
	cost = 8,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
	end,
    eternal_compat = true,
	perishable_compat = false,
	blueprint_compat = true,
	calculate = function(self, card, context)
		if context.before and not context.blueprint and not context.retrigger then
            --[[numDebuffed = 0
			for _, card_in_hand in ipairs(context.scoring_hand) do
				if card_in_hand.debuff then
                	numDebuffed = numDebuffed + 1
                end
      		end]]
            if (#context.scoring_hand) >= #context.full_hand then
			--if (#context.scoring_hand) >= #context.full_hand then
                card.ability.extra.mult = 0
			    return {
				    message = 'Reset!',
				    colour = G.C.MULT,
				    card = card
			    }
            else
                num = ((#context.full_hand) - (#context.scoring_hand)) * tonumber(card.ability.extra.mult_gain)
				--num = ((#context.full_hand) - (#context.scoring_hand)) * tonumber(card.ability.extra.mult_gain)
                card.ability.extra.mult = card.ability.extra.mult + num
			    return {
				    message = '+' .. tostring(num) .. ' ' .. localize('k_mult') .. '!',
				    colour = G.C.MULT,
				    card = card
			    }
            end
		end
        if context.joker_main then
		return {
				mult = card.ability.extra.mult,
		}
		end
	end
}