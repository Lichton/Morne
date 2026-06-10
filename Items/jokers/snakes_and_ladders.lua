SMODS.Joker {
	key = 'snakes_and_ladders',
    config = { extra = {
		xmult = 0.25,
		currentMult = 1,
		previousScored = 0,
		defaultMult = 1
	} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 52, y = 0 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
		returned = 'N/A'
		if card.ability.extra.previousScored > 1 and card.ability.extra.previousScored < 11  then
			returned = localize(tostring(card.ability.extra.previousScored), 'ranks')
		else
			if card.ability.extra.previousScored == 11 then
				returned = localize('Jack', 'ranks')
			end
			if card.ability.extra.previousScored == 12 then
				returned = localize('Queen', 'ranks')
			end
			if card.ability.extra.previousScored == 13 then
				returned = localize('King', 'ranks')
			end
			if card.ability.extra.previousScored == 14 then
				returned = localize('Ace', 'ranks')
			end
		end
        return {
			
            vars = {
				card.ability.extra.xmult,
				card.ability.extra.currentMult,
				returned
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				xmult = card.ability.extra.currentMult
			}
    	end
		if context.individual and context.cardarea == G.play and not context.blueprint then
			if(context.other_card:get_id() ~= 14) then
				if(context.other_card:get_id() < card.ability.extra.previousScored or previousScored == 0) then
					card.ability.extra.previousScored = context.other_card:get_id()
					card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.xmult
					return {
						message = localize('k_upgrade_ex') .. '!',
						colour = G.C.MULT,
						 message_card = card
                	}
				else
					card.ability.extra.previousScored = context.other_card:get_id()
					card.ability.extra.currentMult = card.ability.extra.defaultMult
					if(previousScored ~= 0) then
						return {
							message = localize('k_reset') .. '!',
							colour = G.C.MULT,
							 message_card = card
						}
					end
				end
			else
				if(card.ability.extra.previousScored < context.other_card:get_id() or previousScored == 0) then
					card.ability.extra.previousScored = context.other_card:get_id()
					card.ability.extra.currentMult = card.ability.extra.currentMult + card.ability.extra.xmult
					return {
						message = localize('k_upgrade_ex') .. '!',
						colour = G.C.MULT,
						 message_card = card
                	}
				else
					card.ability.extra.previousScored = context.other_card:get_id()
					card.ability.extra.currentMult = card.ability.extra.defaultMult
					if(previousScored ~= 0) then
						return {
							message = localize('k_reset') .. '!',
							colour = G.C.MULT,
							 message_card = card
						}
					end
				end
			end
		end
	end
}