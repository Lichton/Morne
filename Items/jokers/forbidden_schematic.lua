SMODS.Joker {
	key = 'forbidden_schematic',
	config = { extra = { } },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 18, y = 0 },
	cost = 4,
    eternal_compat = true,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
    }
    end,
	calculate = function(self, card, context)
        
	end
}