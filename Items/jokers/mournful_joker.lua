SMODS.Joker {
	key = 'mournful_joker',
	loc_txt = {
		name = 'Mournful Joker',
		text = {
			"Played cards with",
			
			"{C:spades}Spade{} or {C:clubs}Club{} suit give",

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
	pos = { x = 0, y = 0 },
	cost = 5,
	blueprint_compat = true,
	eternal_compat = true,
	calculate = function(self, card, context)
		 if context.individual and context.cardarea == G.play and context.other_card then
			if context.other_card:is_suit('Spades') or context.other_card:is_suit('Clubs') then
				return {
				mult = card.ability.extra.mult,
				}
			end
		end
	end
}