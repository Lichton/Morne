SMODS.Blind {
    key = 'sift',
    mult = 2,
    boss_colour = HEX("9a858f"),
    boss = { min = 1 },
    atlas = 'Blinds',
    pos = {X = 0, y = 0 },
    order = 0,
    dollars = 5,
    loc_vars = function(self)
        if G.GAME and G.GAME.current_round and G.GAME.current_round.the_sift_data then
            nums = {G.GAME.current_round.the_sift_data.first, G.GAME.current_round.the_sift_data.second, G.GAME.current_round.the_sift_data.third}
            table.sort(nums)
            newList = {}
            for i, v in ipairs(nums) do
                if v == 14 then
                    val = table.remove(nums, i)
                    table.insert(nums, 1, val)
                end
            end
            for i, integ in ipairs(nums) do
                if integ < 11 and integ ~= 14 then
                    table.insert(newList, tostring(integ) .. 's')
                end
                if integ == 11 then
                    table.insert(newList, 'Jacks')
                end
                if integ == 12 then
                    table.insert(newList, 'Queens')
                end
                if integ == 13 then
                    table.insert(newList, 'Kings')
                end
                if integ == 14 then
                    table.insert(newList, 'Aces')
                end
            end

            return {
                vars = {newList[1], newList[2], newList[3]}
            }
        end
    end,
    collection_loc_vars = function(self)
        return {
            vars = {'(Ranks)', '(Ranks)', '(Ranks)'}
        }
    end,
    calculate = function(self, blind, context)
        local temp = G.GAME.blind and G.GAME.blind.disabled
        if temp then
            return
        end
        if context.after and not temp then
            local PotentialNums = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
            --num1 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
            --num2 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
            --num3 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
            prev = {G.GAME.current_round.the_sift_data.first, G.GAME.current_round.the_sift_data.second, G.GAME.current_round.the_sift_data.third}
            for _, elem in pairs(prev) do
                if elem == num1 then
                    table.remove(PotentialNums, _)
                end
            end
            num1 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
            for _, elem in pairs(PotentialNums) do
                if elem == num1 then
                    table.remove(PotentialNums, _)
                end
            end

            num2 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
            for _, elem in pairs(PotentialNums) do
                if elem == num2 then
                    table.remove(PotentialNums, _)
                end
            end

            num3 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
            for _, elem in pairs(PotentialNums) do
                if elem == num3 then
                    table.remove(PotentialNums, _)
                end
            end
            G.GAME.current_round.the_sift_data = { first = num1, second = num2, third = num3 }
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function()
                    G.GAME.blind:wiggle()
                    G.GAME.blind:set_text()
                    for k, v in pairs(G.playing_cards) do
                        if (context.after or context.setting_blind) then
                            if not SMODS.has_no_rank(v) and (v:get_id() == G.GAME.current_round.the_sift_data.first or v:get_id() == G.GAME.current_round.the_sift_data.second or v:get_id() == G.GAME.current_round.the_sift_data.third) then
                                SMODS.debuff_card(v, true, 'the_sift')
                                v:juice_up(0.1, 0.1)
                            else
                                SMODS.debuff_card(v, false, 'the_sift')
                                v:juice_up()
                            end
                        end
                    end
                return true 
                end
            )}))
        end
    end,
    set_blind = function(self)
        for k, v in pairs(G.playing_cards) do
            if not SMODS.has_no_rank(v) and (v:get_id() == G.GAME.current_round.the_sift_data.first or v:get_id() == G.GAME.current_round.the_sift_data.second or v:get_id() == G.GAME.current_round.the_sift_data.third) then
                SMODS.debuff_card(v, true, 'the_sift')
            end
        end
    end,
    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_sift')
        end
    end,
    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_sift')
        end
    end
}

local igo = Game.start_run
function Game:start_run(args)
	local ret = igo(self, args)
    local PotentialNums = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
    --num1 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
    --num2 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
    --num3 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
    num1 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
    for _, elem in pairs(PotentialNums) do
        if elem == num1 then
            table.remove(PotentialNums, _)
        end
    end

    num2 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
    for _, elem in pairs(PotentialNums) do
        if elem == num2 then
            table.remove(PotentialNums, _)
        end
    end

    num3 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
    for _, elem in pairs(PotentialNums) do
        if elem == num3 then
            table.remove(PotentialNums, _)
        end
    end
    G.GAME.current_round.the_sift_data = { first = num1, second = num2, third = num3 }
	return ret
end

local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        local PotentialNums = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}
        --num1 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
        --num2 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
        --num3 = table.remove(PotentialNums, pseudorandom(pseudoseed('the_sift'), PotentialNums[0], PotentialNums[#PotentialNums]))
        prev = {G.GAME.current_round.the_sift_data.first, G.GAME.current_round.the_sift_data.second, G.GAME.current_round.the_sift_data.third}
        for _, elem in pairs(prev) do
            if elem == num1 then
                table.remove(PotentialNums, _)
            end
        end

        num1 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
        for _, elem in pairs(PotentialNums) do
            if elem == num1 then
                table.remove(PotentialNums, _)
            end
        end

        num2 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
        for _, elem in pairs(PotentialNums) do
            if elem == num2 then
                table.remove(PotentialNums, _)
            end
        end

        num3 = pseudorandom_element(PotentialNums, pseudoseed('the_sift' .. '1'))
        for _, elem in pairs(PotentialNums) do
            if elem == num3 then
                table.remove(PotentialNums, _)
            end
        end
        G.GAME.current_round.the_sift_data = { first = num1, second = num2, third = num3 }
    end
    local ref = ease_anteref(mod)
    return ref
end