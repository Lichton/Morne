SMODS.Joker {
	key = 'maxout',
    config = { extra = 
    {
        current_mult = 1,
        addmult = 0.75,
        default = 1,
	} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 41, y = 0 },
	cost = 7,
	loc_vars = function(self, info_queue, card)
        return {
            vars = 
            {
                card.ability.extra.current_mult,
                card.ability.extra.addmult,
                card.ability.extra.default,
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, card_in_hand in ipairs(context.scoring_hand) do
                if not SMODS.has_no_rank(card_in_hand) and card_in_hand:get_id() == 9 then
                    card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.addmult
                end
            end
        end
        if context.joker_main then
			return {
				xmult = card.ability.extra.current_mult,
			}
		end
        if context.final_scoring_step and not context.blueprint then
            card.ability.extra.current_mult = card.ability.extra.default
        end

	end
}