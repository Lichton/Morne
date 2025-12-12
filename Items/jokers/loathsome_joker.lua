SMODS.Joker {
	key = 'loathsome_joker',
	config = { extra = { chip_per = 10, saved_chips = 150} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 37, y = 0 },
	cost = 3,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local leading = "+"
        local name = localize('b_loathsome_joker')
        if (card.ability.extra.saved_chips) < 0 then
            leading = ""
        end
        if math.random(1, 15) == 14 then
            name = localize('b_really_fat_joker')
        end
        return {
            vars = {
                card.ability.extra.saved_chips,
                leading,
                name,
                card.ability.extra.chip_per,
            }
    }
    end,
	calculate = function(self, card, context)
        if context.end_of_round and context.cardarea == G.jokers and context.beat_boss then
            card.ability.extra.saved_chips = card.ability.extra.saved_chips - (G.GAME.dollars * 10)
            if(G.GAME.dollars > 0) then
                return {
                message = localize('b_downgrade'),
                colour = G.C.CHIPS,
                }
            end
            if(G.GAME.dollars < 0) then
                return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                }
            end
        end
        if context.joker_main then
		    return {
			    chips = math.max((card.ability.extra.saved_chips), 0),
		    }
		end

	end
}