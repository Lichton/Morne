SMODS.Joker {
	key = 'chuckling_clown',
	config = { extra = {
		--mult_gain = 1,
		--current_mult = 0,
		--max_per = 5,
		mult = 3,
		prevScored = {},
		current_card = nil,
		exempt_card = nil
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 20, y = 0 },
	cost = 5,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
		list = ""
		if #card.ability.extra.prevScored > 0 then
			table.sort(card.ability.extra.prevScored)
			for i, v in ipairs(card.ability.extra.prevScored) do
				if v == 14 then
					val = table.remove(card.ability.extra.prevScored, i)
					table.insert(card.ability.extra.prevScored, 1, val)
				end
			end
			for i, v in ipairs(card.ability.extra.prevScored) do
				value = ""
				if v <= 10 then
					value = tostring(v)
				end
				if v > 10 then
					if v == 11 then
						value = 'J'
					end
					if v == 12 then
						value = 'Q'
					end
					if v == 13 then
						value = 'K'
					end
					if v == 14 then
						value = 'A'
					end
				end
				if i < #card.ability.extra.prevScored then
					returnVal = value .. ', '
				else
					returnVal = value
				end
				list = list .. returnVal
			end
		else
			list = 'N/A'
		end
		return {
			vars = {
			card.ability.extra.mult, 
			list
			}
		}
	end,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card then
			if not SMODS.has_no_rank(context.other_card) then
				doMult = true
				addTable = true
				for i, value in ipairs(card.ability.extra.prevScored) do
					if context.other_card:get_id() == value then
						doMult = false
					end
				end
				--[[if context.other_card == card.ability.extra.currentCard then
					addTable = false
					if card.ability.extra.exempt_card == context.other_card then
						doMult = true
					end
				end
				
				if card.ability.extra.exempt_card == nil then
					card.ability.extra.exempt_card = context.other_card
				end
				card.ability.extra.currentCard = context.other_card]]
				if doMult then
					--[[if context.other_card == card.ability.extra.currentCard then
						card.ability.extra.exempt_card = context.other_card
					end]]
					if addTable then
						table.insert(card.ability.extra.prevScored, context.other_card:get_id())
					end
					return {
						mult = card.ability.extra.mult,
					}
				end
			end
		end
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			card.ability.extra.prevScored = {}
			--card.ability.extra.currentCard = nil
			--card.ability.extra.exempt_card = nil
		end
	end
}
