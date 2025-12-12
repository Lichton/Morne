SMODS.Joker {
	key = 'plastic_glove',
	config = { extra = { current_hand_size = 0, amount_five_per = 3, hand_size_gain = 1} },
	rarity = 2,
	atlas = 'Jokers',
	pos = { x = 38, y = 0 },
	cost = 4,
    eternal_compat = true,
    blueprint_compat = false,
    loc_vars = function(self, info_queue, card)
        fives = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 5 then 
                    fives = fives + 1 
                end
            end
        end
        return { vars = { math.floor(fives / card.ability.extra.amount_five_per) * card.ability.extra.hand_size_gain, card.ability.extra.hand_size_gain  }
    }
    end,
	calculate = function(self, card, context)
        if context.playing_card_added and not context.blueprint then
            fives = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 5 then 
                    fives = fives + 1 
                end
            end
            for _, playing_card in pairs(context.cards) do
                if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 5 then 
                    fives = fives + 1 
                end
            end
            if (card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)) ~= card.ability.extra.current_hand_size then
                G.hand:change_size(-card.ability.extra.current_hand_size * card.ability.extra.hand_size_gain)
                card.ability.extra.current_hand_size = card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)
                G.hand:change_size(card.ability.extra.hand_size_gain * card.ability.extra.current_hand_size)
                    return {
			        message = localize('b_five'),
			        colour = G.C.ORANGE,
			        card = card
			    }
            end
        end
        if context.remove_playing_cards and not context.blueprint then
            fives = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 5 then 
                    fives = fives + 1 
                end
            end
            for _, playing_card in pairs(context.removed) do
                if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 5 then 
                    fives = fives - 1 
                end
            end
            if (card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)) ~= card.ability.extra.current_hand_size then
                G.hand:change_size(-card.ability.extra.current_hand_size)
                card.ability.extra.current_hand_size = card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)
                G.hand:change_size(card.ability.extra.current_hand_size)
                    return {
			        message = localize('b_five_negative'),
			        colour = G.C.ORANGE,
			        card = card
			    }
            end
        end
        if context.change_rank and not context.blueprint then
            fives = 0
            for _, playing_card in ipairs(G.playing_cards) do
                if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 5 or (playing_card == context.other_card and context.new_rank == 5) then 
                    fives = fives + 1 
                end
                if playing_card == context.other_card and context.new_rank ~= 5 then
                    fives = math.max(0, fives - 1)
                end
            end
            if ((card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per))) > card.ability.extra.current_hand_size then
                G.hand:change_size(-card.ability.extra.current_hand_size)
                card.ability.extra.current_hand_size = card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)
                G.hand:change_size(card.ability.extra.current_hand_size)
                    return {
			        message = localize('b_five'),
			        colour = G.C.ORANGE,
			        card = card
			    }
            else 
                if ((card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per))) < card.ability.extra.current_hand_size then
                    G.hand:change_size(-card.ability.extra.current_hand_size)
                    card.ability.extra.current_hand_size = card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)
                    G.hand:change_size(card.ability.extra.current_hand_size)
                        return {
                        message = localize('b_five_negative'),
                        colour = G.C.ORANGE,
                        card = card
                    }
                end
            end
        end
	end,
    add_to_deck = function(self, card, from_debuff)
        local fives = 0
        for _, playing_card in ipairs(G.playing_cards) do
            if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 5 then 
                fives = fives + 1 
            end
        end
        card.ability.extra.current_hand_size = card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)
        G.hand:change_size(math.floor(fives / card.ability.extra.amount_five_per) * card.ability.extra.hand_size_gain)
    end,
    remove_from_deck = function(self, card, from_debuff)
        card.ability.extra.current_hand_size = card.ability.extra.hand_size_gain * math.floor(fives / card.ability.extra.amount_five_per)
        G.hand:change_size(-card.ability.extra.current_hand_size * card.ability.extra.hand_size_gain)
    end
}