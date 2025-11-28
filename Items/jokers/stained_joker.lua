SMODS.Joker {
	key = 'stained_joker',
	config = { },
	rarity = 3,
	atlas = 'Jokers',
	pos = { x = 32, y = 0 },
	cost = 7,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
    }
    end,
	calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == 'Joker' and context.card.edition then
            validApply = {}
            for _, joker in ipairs(G.jokers.cards) do
                edition = context.card.edition
                if joker ~= card and not joker.temp_edition and not joker.edition then
                    table.insert(validApply, joker)
                end
            end
            if #validApply > 0 then
                jokerToEdition = pseudorandom_element(validApply, pseudoseed('stained'))
                jokerToEdition:set_edition(edition, true)
                    return {
                        message = localize('b_stain'),
                        --colour = G.C.EDITION
                }
            else
                if not card.edition then
                    card:set_edition(edition, true)
                    return {
                        message = localize('b_stain'),
                        --colour = G.C.EDITION
                    }
                end
            end
        end
	end
}