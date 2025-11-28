SMODS.Joker {
	key = 'ad_infinitum',
	config = { extra = {
		--mult_gain = 1,
		--current_mult = 0,
		--max_per = 5,
        eights = 0,
		odds = 8,
	} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 27, y = 0 },
	cost = 6,
	eternal_compat = true,
	blueprint_compat = true,
	perishable_compat = true,
	loc_vars = function(self, info_queue, card)
		local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.eights, card.ability.extra.odds)
        return {
            vars = {
                numerator, denominator
            }
    	}
	end,
	calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card and not context.blueprint then
            if not SMODS.has_no_rank(context.other_card) and context.other_card:get_id() == 8 then
                card.ability.extra.eights = card.ability.extra.eights + 1
                return {
			        message = '+1',
			        colour = G.C.GREEN,
                    card = card
			    }                       
            end
        end
        if context.end_of_round and context.cardarea == G.jokers then
            if SMODS.pseudorandom_probability(card, 'ad_infinitum', card.ability.extra.eights, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local carder = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'car')
                            carder:add_to_deck()
                            G.consumeables:emplace(carder)
                            card.ability.extra.eights = 0
                            card:juice_up(0.3, 0.3)
                            return true
                        end}))                      
                    return {
			                    message = localize('k_plus_spectral'),
                                colour = G.C.SECONDARY_SET.Spectral,
			                }  
                end)}))
			else 
                             
                card.ability.extra.eights = 0
                card:juice_up(0.3, 0.3)
                return {
			        message = localize('k_nope_ex'),
			    }   
            end
            
        end
	end
}
