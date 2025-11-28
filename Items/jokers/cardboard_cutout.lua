SMODS.Joker {
	key = 'cardboard_cutout',
	config = {
      extra = {
        num = 5,
        evil = 0,
      }
    },

    --fix bug with generating jokers and shit
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 3, y = 0 },
	cost = 6,
    eternal_compat = true,
	blueprint_compat = false,
	
	loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                card.ability.extra.num
            }
    	}
    end,
	calculate = function(self, card, context)
		--[[if context.using_consumeable and context.consumeable.ability.set == "Tarot" then
			if SMODS.pseudorandom_probability(card, 'cardboard_cutout', 1, card.ability.extra.odds) then
				G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                func = (function()
                    G.E_MANAGER:add_event(Event({
                        func = function() 
                            local carder = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'car')
                            carder:add_to_deck()
                            G.consumeables:emplace(carder)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end}))   
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                    return true
                end)}))
			end
		end]]
	end
}
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
    if G.jokers and #G.jokers.cards > 0 then
        for _, joker in ipairs(G.jokers.cards) do
            if joker.config.center.key == 'j_morne_cardboard_cutout' then
                if joker.ability.extra.evil < 1 then
                    if self.ability.set == 'Joker' then
                        --if G.jokers and #G.jokers.cards < G.jokers.config.card_limit then
                            editioner = self.edition
                            --print('hi')
                            --G.GAME.joker_buffer = G.GAME.joker_buffer + 2
                            --SMODS.bypass_create_card_edition = true
                            play_sound('tarot1')
                            joker:juice_up(0.3, 0.3)
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local jonkler = SMODS.add_card {
                                    set = 'Joker',
                                    edition = editioner,
                                    rarity = 'Uncommon',
                                    key_append = 'cardboard_cutout',
                                    --badges = badgeList,
                                    }
                                    --SMODS.bypass_create_card_edition = false
                                    jonkler:start_materialize()
                                    for k, v in pairs(G.shared_stickers) do
                                        if self.ability[k] then
                                            jonkler.ability[k] = true
                                        end
                                    end
                                    --G.GAME.joker_buffer = 0
                                    --jonkler:set_edition(editioner, true)
                                    return true
                                    end
                                }))
                            
                            --SMODS.bypass_create_card_edition = nil
                            joker.ability.extra.num = joker.ability.extra.num - 1
                            if joker.ability.extra.num <= 0 then
                                joker.ability.extra.evil = 1
                                G.E_MANAGER:add_event(Event({
                                func = function()
                                    if joker ~= self then
                                        play_sound('tarot1')
                                        joker.T.r = -0.2
                                        joker:juice_up(0.3, 0.3)
                                        joker.states.drag.is = true
                                        joker.children.center.pinch.x = true
                                        return {
                                            message = localize('k_nope_ex'),
                                            colour = G.C.GREEN
                                        }
                                    end
                                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                        func = function()
                                                G.jokers:remove_card(joker)
                                                joker:remove()
                                                joker = nil
                                             return {
                                            message = localize('k_plus_joker'),
                                            colour = G.C.GREEN
                                        } 
                                    end})) 
                                    return true
                                end
                            })) 
                            --end
    
                        end
                    end
                end
            end
        end
    end
    return ref
end
    