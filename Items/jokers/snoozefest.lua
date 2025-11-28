SMODS.Joker {
	key = 'snoozefest',
	config = { extra = { xmult = 2, active = false, odds = 2} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 13, y = 0 },
	cost = 6,
    config = {
      extra = {
        hand_size = 1,
        hand_gain = 1
      }
    },
    eternal_compat = true,
    blueprint_compat = false,
    perishable_compat = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hand_size, card.ability.extra.hand_gain
            }
    }
    end,
	calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss and context.main_eval and G.GAME.current_round.discards_used == 0 and not context.blueprint then
            G.hand:change_size(-card.ability.extra.hand_size)
            card.ability.extra.hand_size = card.ability.extra.hand_size + card.ability.extra.hand_gain
            G.hand:change_size(card.ability.extra.hand_size)
            return {
			    message = localize('b_snooze'),
			    colour = G.C.ORANGE,
			-- The return value, "card", is set to the variable "card", which is the joker.
			-- Basically, this tells the return value what it's affecting, which if it's the joker itself, it's usually card.
				-- It can be things like card = context.other_card in some cases, so specifying card (return value) = card (variable from function) is required.
			    card = card
			}
        end
	end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.hand_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_size)
    end
}