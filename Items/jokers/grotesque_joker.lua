SMODS.Joker {
	key = 'grotesque_joker',
	config = { extra = { base_mult = 15} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 17, y = 0 },
	cost = 3,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local leading = "+"
        local name = localize('b_grotesque_joker')
        if (card.ability.extra.base_mult + -G.GAME.dollars) < 0 then
            leading = ""
        end
        if math.random(1, 15) == 14 then
            name = localize('b_really_sad_joker')
        end
        return {
            vars = {
                card.ability.extra.base_mult,
                card.ability.extra.base_mult + -G.GAME.dollars,
                leading,
                name,
            }
    }
    end,
	calculate = function(self, card, context)
        if context.joker_main then
		    return {
			    mult = math.max((card.ability.extra.base_mult + -G.GAME.dollars), -(mult)),
		    }
		end

	end
}