SMODS.Joker {
	key = 'melancholy_joker',
	loc_txt = {
		name = 'Melancholy Joker',
		text = {
			"Played cards with",
			
			"{C:hearts}Heart{} or {C:diamonds}Diamond{} suit give",

			"{C:mult}+#1#{} Mult when scored"
		}
	},
	config = { extra = { mult = 2} },
	loc_vars = function(self, info_queue, card)
		return { 
			vars = { 
				card.ability.extra.mult,
			} 
		}
	end,
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 7, y = 0 },
	cost = 5,
	blueprint_compat = true,
	eternal_compat = true,
	calculate = function(self, card, context)
		 if context.individual and context.cardarea == G.play and context.other_card then
			if context.other_card:is_suit('Diamonds') or context.other_card:is_suit('Hearts') then
				return {
				mult = card.ability.extra.mult,
				}
			end
		end
	end
}