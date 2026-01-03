SMODS.Blind {
    key = 'bile',
    mult = 2,
    boss_colour = HEX("787900"),
    boss = { min = 4,},
    atlas = 'Blinds',
    pos = {X = 0, y = 6 },
    order = 0,
    dollars = 5,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.before then
              
                low_id = 999
                for _, card_in_hand in ipairs(context.full_hand) do
				    if not SMODS.has_no_rank(context.full_hand[_]) and not (context.full_hand[_].debuff) then
					    if card_in_hand:get_id() == 14 then
						    low_id = 1
					    else 
						    if card_in_hand:get_id() < low_id then
						        low_id = card_in_hand:get_id()
						    end
					    end
                    end
			    end

                --[[high_id = 0
                for _, card_in_hand in ipairs(context.full_hand) do
				    if not SMODS.has_no_rank(context.full_hand[_]) and not (context.full_hand[_].debuff) then
					    if card_in_hand:get_id() == 14 then
						    high_id = 1
					    else 
						    if card_in_hand:get_id() > high_id then
						        high_id = card_in_hand:get_id()
						    end
					    end
                    end
			    end]]

               for _, card_in_hand in ipairs(context.full_hand) do
                    --[[if high_id == 1 then
                        high_id = 14
                    end]]
                    if low_id == 1 then
                        low_id = 14
                    end
                    if --[[card_in_hand:get_id() == high_id or]] card_in_hand:get_id() == low_id then
                        card_in_hand:juice_up(0.2, 0.2)
                        SMODS.debuff_card(card_in_hand, true, 'the_bile')
                    end
                end 
            end
        end
    end,
    set_blind = function(self)

    end,
    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_bile')
        end
    end,
    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_bile')
        end
    end
}