SMODS.Joker {
    key = 'ruinful_jester',
    config = { extra = {
		mult = 6,
	} },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 43, y = 0 },
	cost = 7,
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
        
	end
}