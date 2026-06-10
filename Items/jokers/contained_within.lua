SMODS.Joker {
	key = 'contained_within',
    config = 
	{ 
		extra = {
			sum = 4
		} 
	},
	rarity = 1,
	atlas = 'Jokers',
	pos = { x = 46, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		sum = 0
		if G.playing_cards and G.deck and G.deck.cards then
            for _, playing_card in ipairs(G.deck.cards) do
                if not SMODS.has_no_rank(playing_card) and playing_card:get_id() == 4 or playing_card:get_id() == 7 or playing_card:get_id() == 9 then 
                    sum = sum + 1 
                end
            end
        end
        return {
            vars = {
				sum * 2
            }
    	}
    end,
    eternal_compat = true,
    blueprint_compat = true,
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and context.other_card then
			if not SMODS.has_no_rank(context.other_card) and (context.other_card:get_id() == 4 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9)  then
				local mysum = 0
				if G.playing_cards then
					for _, playing_card in ipairs(G.deck.cards) do
						if not SMODS.has_no_rank(playing_card) and (playing_card:get_id() == 4 or playing_card:get_id() == 7 or playing_card:get_id() == 9) then 
							mysum = mysum + 1 
						end
					end
				end
				return
				{
					mult = mysum * 2
				}
			end
		end
	end
}

function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end