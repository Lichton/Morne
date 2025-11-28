SMODS.Blind {
    key = 'smudge',
    mult = 2,
    boss_colour = HEX("3e1382"),
    boss = { min = 1 },
    atlas = 'Blinds',
    pos = {X = 0, y = 4 },
    order = 0,
    dollars = 5,
    loc_vars = function(self)
        if G.GAME and G.GAME.current_round and G.GAME.current_round.the_smudge then
            return {
                vars = {
                localize(G.GAME.current_round.the_smudge.suit, 'suits_plural'),
				colours = { G.C.SUITS[G.GAME.current_round.the_smudge.suit] } -- sets the colour of the text affected by `{V:1}`
            }
            }
        end
    end,
    collection_loc_vars = function(self)
        return {
            vars = {'(Suits)'}
        }
    end,
    calculate = function(self, blind, context)
        if not blind.disabled and context.after then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                func = (function()
                    local potSuits = {'Hearts', 'Diamonds', 'Clubs', 'Spades'}
                    local prev = G.GAME.current_round.the_smudge.suit
                    for _, elem in pairs(potSuits) do
                        if elem == prev then
                            table.remove(potSuits, _)
                        end
                    end
                    G.GAME.current_round.the_smudge.suit = pseudorandom_element(potSuits, pseudoseed('the_smudge' .. '1'))
                    G.GAME.blind:wiggle()
                    G.GAME.blind:set_text()
                    for k, v in pairs(G.playing_cards) do
                        if (context.after or context.setting_blind) then
                            if not SMODS.has_no_suit(v) and v:is_suit(G.GAME.current_round.the_smudge.suit) then
                                SMODS.debuff_card(v, true, 'the_smudge')
                                v:juice_up(0.1, 0.1)
                            else
                                SMODS.debuff_card(v, false, 'the_smudge')
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
            if not SMODS.has_no_suit(v) and v:is_suit(G.GAME.current_round.the_smudge.suit) then
                SMODS.debuff_card(v, true, 'the_smudge')
            end
        end
    end,
    disable = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_smudge')
        end
    end,
    defeat = function(self)
        for k, v in pairs(G.playing_cards) do
            SMODS.debuff_card(v, false, 'the_smudge')
        end
    end
}


local igo = Game.start_run
function Game:start_run(args)
	local ret = igo(self, args)
    local potSuits = {'Hearts', 'Diamonds', 'Clubs', 'Spades'}
    G.GAME.current_round.the_smudge = { suit = pseudorandom_element(potSuits, pseudoseed('the_smudge' .. '1'))}
	return ret
end

local ease_anteref = ease_ante
function ease_ante(mod)
    if mod ~= 0 then
        local potSuits = {'Hearts', 'Diamonds', 'Clubs', 'Spades'}
        local prev = G.GAME.current_round.the_smudge.suit
        for _, elem in pairs(potSuits) do
            if elem == prev then
                table.remove(potSuits, _)
            end
        end
        G.GAME.current_round.the_smudge.suit = pseudorandom_element(potSuits, pseudoseed('the_smudge' .. '1'))
    end
    local ref = ease_anteref(mod)
    return ref
end