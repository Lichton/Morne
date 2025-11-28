SMODS.Joker {
	key = 'photophobe',
	config = { extra = { xmult = 2.5, active = false, odds = 2} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 16, y = 0 },
	cost = 5,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                card.ability.extra.xmult, numerator, denominator, 
            }
    }
    end,
	calculate = function(self, card, context)
        evil = false
        first = true
        if context.end_of_round and context.cardarea == G.jokers then
            card.ability.extra.active = false
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.pre_discard then
            card.ability.extra.active = true
        end

        if context.stay_flipped and context.to_area == G.hand and card.ability.extra.active and not context.hook then
            if SMODS.pseudorandom_probability(card, 'photophobe', 1, card.ability.extra.odds) then
                evil = true
                return {
                    stay_flipped = true
                }
            end
        end
        if context.hand_drawn then
            
            card.ability.extra.active = false
            evil = false
        end
	end
}