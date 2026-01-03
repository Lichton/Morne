SMODS.Joker {
	key = 'loosetongue',
    config = { extra = {
		mult = 6,
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 42, y = 0 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
        return {
            vars = 
			{
				card.ability.extra.mult,
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
        if context.before then
			doTrigger = false
			for _, card_in_hand in ipairs(context.scoring_hand) do
				if card_in_hand:is_face() then
					doTrigger = true
				end
			end
		end

		if context.individual and context.cardarea == G.play and context.other_card then
            if not context.other_card:is_face() then
				return {
					mult = card.ability.extra.mult,
				}
			end
        end
	end
}