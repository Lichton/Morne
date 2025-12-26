SMODS.Joker {
	key = 'cardboard_cutout',
	config = {
      extra = {
        num = 5,
        evil = 0,
      }
    },

    --FIX SELL PRICE ISSUES AND MULTIPLE COPIES ISSUES
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 3, y = 0 },
	cost = 6,
    eternal_compat = false,
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
                            editioner = self.edition
                            --print('hi')
                            if #G.jokers.cards + G.GAME.joker_buffer <= G.jokers.config.card_limit then
                                --SMODS.bypass_create_card_edition = true
                                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                                play_sound('tarot1')
                                joker:juice_up(0.3, 0.3)
                                if joker.ability.extra.num > 1 then
                                    --card_eval_status_text(joker, 'extra', nil, nil, nil, {message = localize('b_cardboard'), colour = G.C.RARITY.Uncommon})                       
                                end
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        local jonkler = SMODS.add_card {
                                        set = 'Joker',
                                        no_edition = true,
                                        edition = editioner,
                                        rarity = 'Uncommon',
                                        key_append = 'cardboard_cutout',
                                        --badges = badgeList,
                                        }
                                        --SMODS.bypass_create_card_edition = false
                                            --jonkler:set_cost()
                                        jonkler.base_cost = 0
                                        jonkler.extra_cost = -jonkler.extra_cost
                                        jonkler.sell_cost = 0
                                        jonkler:start_materialize()
                                        G.GAME.joker_buffer = 0
                                        for k, v in pairs(G.shared_stickers) do
                                            if self.ability[k] then
                                                jonkler.ability[k] = true
                                            end
                                        end
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
                                            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                                func = function()
                                                    G.jokers:remove_card(joker)
                                                    joker:remove()
                                                    joker = nil
                                                    return true; end})) 
                                                return true
                                            else
                                            return true
                                            end
                                        end
                                    })) 

                                end
                            end
                        end
                    end
                end
            end
        end
    return ref
end
    