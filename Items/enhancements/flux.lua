SMODS.Enhancement {
    key = 'flux',
    atlas = 'Enhancements',
    order = 3,
    pos = { x = 1, y = 0 },
    config = {
        timesmult = 1.5
    },
    no_suit = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = {card.ability.timesmult} 
        }
	end,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return{
                xmult = card.ability.timesmult
            }
        end
    end,
    set_sprites = function(self, card, front)
        if card and card.base and card:get_id() then
            if(card:get_id() < 15 and card:get_id() > 1) then
            --#region
                if not G.SETTINGS.colourblind_option then
                    card.children.front.atlas = G.ASSET_ATLAS["morne_flux_atlas"]
                    card.children.front:set_sprite_pos({x=card:get_id()-2, y=0})
                else
                    card.children.front.atlas = G.ASSET_ATLAS["morne_flux_hc_atlas"]
                    card.children.front:set_sprite_pos({x=card:get_id()-2, y=0})
                end
            --#region
            else
                if not G.SETTINGS.colourblind_option then
                    card.children.front.atlas = G.ASSET_ATLAS["morne_flux_atlas"]
                    card.children.front:set_sprite_pos({x=13, y=0})
                else
                    card.children.front.atlas = G.ASSET_ATLAS["morne_flux_hc_atlas"]
                    card.children.front:set_sprite_pos({x=13, y=0})
                end
                
            end
        end
    end
    
}