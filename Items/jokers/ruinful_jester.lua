SMODS.Joker {
    key = 'ruinful_jester',
    config = { extra = {
		draw_extra = 0,
	} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 43, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
        return {
            vars = 
			{
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
        if context.discard then
			if context.other_card:is_face() then
				card.ability.extra.draw_extra = card.ability.extra.draw_extra + 1
			end
		end
		if context.drawing_cards and card.ability.extra.draw_extra > 0 then
			to_draw = card.ability.extra.draw_extra
			card.ability.extra.draw_extra = 0
            return {
                cards_to_draw = context.amount + to_draw,
                message = "+" .. to_draw
            }
        end
	end
}