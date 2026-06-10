SMODS.Joker {
	key = 'dyscalculia',
	config = {
      extra = {
		timesmult = 1.5,
        val_1 = 14,
        val_2 = 2,
        val_3 = 3
      }
    },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 51, y = 0 },
	cost = 3,
    eternal_compat = true,
	blueprint_compat = true,
	
	loc_vars = function(self, info_queue, card)
        local returned1 = 'N/A'
        local returned2 = 'N/A'
        local returned3 = 'N/A'
        if card.ability.extra.val_1 > 1 and card.ability.extra.val_1 < 11  then
			returned1 = localize(tostring(card.ability.extra.val_1), 'ranks')
		else
			if card.ability.extra.val_1 == 11 then
				returned1 = 'Jack'
			end
			if card.ability.extra.val_1 == 12 then
				returned1 = 'Queen'
			end
			if card.ability.extra.val_1 == 13 then
				returned1 = 'King'
			end
			if card.ability.extra.val_1 == 14 then
				returned1 = 'Ace'
			end
		end

       if card.ability.extra.val_2 > 1 and card.ability.extra.val_2 < 11  then
			returned2 = localize(tostring(card.ability.extra.val_2), 'ranks')
		else
			if card.ability.extra.val_2 == 11 then
				returned2 = 'Jack'
			end
			if card.ability.extra.val_2 == 12 then
				returned2 = 'Queen'
			end
			if card.ability.extra.val_2 == 13 then
				returned2 = 'King'
			end
			if card.ability.extra.val_2 == 14 then
				returned2 = 'Ace'
			end
		end

        if card.ability.extra.val_3 > 1 and card.ability.extra.val_3 < 11  then
			returned3 = localize(tostring(card.ability.extra.val_3), 'ranks')
		else
			if card.ability.extra.val_3 == 11 then
				returned3 = 'Jack'
			end
			if card.ability.extra.val_3 == 12 then
				returned3 = 'Queen'
			end
			if card.ability.extra.val_3 == 13 then
				returned3 = 'King'
			end
			if card.ability.extra.val_3 == 14 then
				returned3 = 'Ace'
			end
		end
        

        return {
            vars = {
				card.ability.extra.timesmult,
                returned1,
                returned2,
                returned3
            }
    	}
    end,
	calculate = function(self, card, context)
		if context.stay_flipped and context.to_area == G.hand then
            if not SMODS.has_no_rank(context.other_card) and (context.other_card:get_id() == card.ability.extra.val_1 or context.other_card:get_id() == card.ability.extra.val_2 or context.other_card:get_id() == card.ability.extra.val_3)  then
                return {
                stay_flipped = true
                }
            end
        end
        if context.individual and context.cardarea == G.play and context.other_card then
			if not SMODS.has_no_rank(context.other_card) and (context.other_card:get_id() == card.ability.extra.val_1 or context.other_card:get_id() == card.ability.extra.val_2 or context.other_card:get_id() == card.ability.extra.val_3)  then
            return{
                xmult = card.ability.extra.timesmult
            }
            end
        end
		if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
			local potentialList = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
            for i,v in pairs(potentialList) do
                if v == card.ability.extra.val_1 or v == card.ability.extra.val_2 or v == card.ability.extra.val_3 then
                    table.remove(potentialList,i)
                    break
                end
            end
            local valToAdd = pseudorandom_element(potentialList, pseudoseed('dyscalculia'))
            for i,v in pairs(potentialList) do
                if v == valToAdd then
                    table.remove(potentialList,i)
                    card.ability.extra.val_1 = valToAdd
                    break
                end
            end
            --
            local valToAdd = pseudorandom_element(potentialList, pseudoseed('dyscalculia'))
            for i,v in pairs(potentialList) do
                if v == valToAdd then
                    table.remove(potentialList,i)
                    card.ability.extra.val_2 = valToAdd
                    break
                end
            end
            --
            local valToAdd = pseudorandom_element(potentialList, pseudoseed('dyscalculia'))
            for i,v in pairs(potentialList) do
                if v == valToAdd then
                    table.remove(potentialList,i)
                    card.ability.extra.val_3 = valToAdd
                    break
                end
            end
		end
       
	end
}