SMODS.Joker {
	key = 'lemon',
    config = { extra = {
        mult = 15,
        poker_hand = nil,
        valid_types = 
        {
            'Two Pair',
            'Straight',
            'Flush',
            'Three of a Kind'
        },
        to_consume = false
	} },
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 31, y = 0 },
	cost = 4,
	loc_vars = function(self, info_queue, card)
        if not card.ability.extra.poker_hand then
            card.ability.extra.poker_hand = pseudorandom_element(card.ability.extra.valid_types, pseudoseed('lemon'))
        end
        if G.your_collection and #G.your_collection > 0 then
            for i, card_area in pairs(G.your_collection) do
                if card.area == card_area then
                    return {
                        vars = {
                            card.ability.extra.mult,
                            localize('b_random_hand')
                        }
                    }   
                end
            end
        end
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.poker_hand,
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
        if context.joker_main then
            if not card.ability.extra.poker_hand then
                card.ability.extra.poker_hand = pseudorandom_element(card.ability.extra.valid_types, pseudoseed('lemon'))
            end
            if context.poker_hands and next(context.poker_hands[card.ability.extra.poker_hand]) then

                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    colour = G.C.RED,
                    mult = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult .. ' '.. localize('k_mult')
			    })
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(card)
                                    card:remove()
                                    card = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.YELLOW
                }
	        else
                return {
                    mult = (card.ability.extra.mult)
                }
            end
        end

        --[[if context.post_joker then
            if card.ability.extra.to_consume then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        self.T.r = -0.2
                        self:juice_up(0.3, 0.4)
                        self.states.drag.is = true
                        self.children.center.pinch.x = true
                        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                            func = function()
                                    G.jokers:remove_card(self)
                                    self:remove()
                                    self = nil
                                return true; end})) 
                        return true
                    end
                })) 
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.RED
                }
	        end
        end]]
    end
}