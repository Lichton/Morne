SMODS.Joker {
	key = 'tentajoker',
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 6, y = 0 },
	cost = 5,
	config = {
      extra = {
        chips = 0,
        chip_gain = 8
      }
    },
	loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips, card.ability.extra.chip_gain
            }
    	}
    end,
    eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = false,
	calculate = function(self, card, context)
		 if context.before and context.scoring_hand and not context.blueprint then
			val = 0
			for _, card_in_hand in ipairs(context.full_hand) do
				if not SMODS.has_no_rank(context.full_hand[_]) and not (context.full_hand[_].debuff) then
					if context.full_hand[_]:get_id() == 14 then
						val = val + 1
					else
						val = val + context.full_hand[_]:get_id()
					end
				end
      		end
			if val == 8 then
				card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
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
		if context.joker_main and not (card.ability.extra.chips == 0) then
			return {
				chip_mod = card.ability.extra.chips,
				message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
			}
		end
	end
}