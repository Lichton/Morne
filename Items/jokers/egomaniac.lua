SMODS.Joker {
	key = 'egomaniac',
	config = { extra = { xmult = 2, active = true} },
	rarity = 2,
	atlas = 'Jokers',
    ability = 'Egomaniac',
	pos = { x = 5, y = 0 },
	cost = 4,
    eternal_compat = true,
    blueprint_compat = true,
    loc_vars = function(self, info_queue, card)
        local active_text = localize('b_active')
        if not card.ability.extra.active then 
            active_text = localize('b_inactive')
        end
        return {
            vars = {
                card.ability.extra.xmult,
                active_text
            }
    }
    end,
	calculate = function(self, card, context)
        if card.ability.extra.active and context.joker_main then
            return {
            xmult = card.ability.extra.xmult
        }
        end   
        if context.buying_card and context.card.ability.set == 'Joker' and context.card.config.center.key ~= 'j_morne_egomaniac'  and not context.blueprint and card.ability.extra.active == true then
            card.ability.extra.active = false
            card:juice_up(0.3, 0.3)
			card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = 'What?!', 
			})
        end
        if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
            
            if card.ability.extra.active == false then
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = 'I forgive you...', 
			    })
            end
            card.ability.extra.active = true
        end
        --if context.before and context.cardarea == G.play then
            --if pseudorandom('marmo', 1, 60) == 7 then
            --if pseudorandom('marmo', 1, 2) == 1 then
              --  card_eval_status_text(card, 'extra', nil, nil, nil, {
               -- message = 'Total misplay.', 
			    --})
            --end
        --end

	end
}