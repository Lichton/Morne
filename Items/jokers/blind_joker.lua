SMODS.Joker {
	key = 'blind_joker',
	config = { extra = {} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 9, y = 0 },
	cost = 4,
    config = {
      extra = {
        odds = 7,
        chips = 0,
        chip_gain = 5
      }
    },
    eternal_compat = true,
	blueprint_compat = true,
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator, card.ability.extra.chips, card.ability.extra.chip_gain
            }
    	}
    end,
    calculate = function(self, card, context)
        local evil = false
        --[[if context.hand_drawn then
            evil = false
            for _, card_in_draw in ipairs(context.hand_drawn) do
                if SMODS.pseudorandom_probability(card, 'blindjoke', 1, card.ability.extra.odds) then
                    if card_in_draw.facing == 'front' then
                         return {
                        stay_flipped = true
                        }
                    end
                    if card_in_draw.facing == 'back' then
                        card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                        evil = true
                    end
                end
            end]]
        if context.stay_flipped and context.to_area == G.hand then
            if SMODS.pseudorandom_probability(card, 'blindjoke', 1, card.ability.extra.odds) then
                return {
                stay_flipped = true
                }
            end
        end
        if context.hand_drawn and not context.blueprint then
            for _, card_in_draw in ipairs(context.hand_drawn) do
                if card_in_draw.facing == 'back' then
                    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
                    evil = true
                end
            end
            if evil then
                return {
			        message = localize('k_upgrade_ex'),
			        colour = G.C.CHIPS,
				-- The return value, "card", is set to the variable "card", which is the joker.
				-- Basically, this tells the return value what it's affecting, which if it's the joker itself, it's usually card.
				-- It can be things like card = context.other_card in some cases, so specifying card (return value) = card (variable from function) is required.
			        card = card
			    }
            end
        end
        if context.joker_main then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
    end
}