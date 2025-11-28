SMODS.Joker {
	key = 'tenancy',
	config = { extra = { dollars = 2, numb = 1, odds = 2, repetitions = 1 } },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 25, y = 0 },
	cost = 6,
    eternal_compat = true,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        --[[current = 2
        if G.jokers then
            current = math.max(0, card.ability.extra.dollars* (G.jokers.config.card_limit - #G.jokers.cards) + (2* #SMODS.find_card("j_morne_tenancy", true)))
        end
        return {
            vars = {
                card.ability.extra.dollars,
                current
            }]]
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numb, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator
        }
    }
    end,
    --[[calc_dollar_bonus = function(self, card)
        return card.ability.extra.dollars * 
        math.max(0, 1 * (G.jokers.config.card_limit - #G.jokers.cards) + (2* #SMODS.find_card("j_morne_tenancy", true)))
    end,]]
	calculate = function(self, card, context)
        if context.cardarea == G.play and context.repetition and not context.repetition_only then
			if SMODS.pseudorandom_probability(card, 'tenancy', card.ability.extra.numb, card.ability.extra.odds) then
				return {
					message = localize('k_again_ex'),
					repetitions = card.ability.extra.repetitions,
					-- The card the repetitions are applying to is context.other_card
					card = card
				}
			end
		end
    end
}