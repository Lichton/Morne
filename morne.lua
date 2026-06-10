SMODS.Atlas {
	-- Key for code to find it with
	key = "Jokers",
	-- The name of the file, for the code to pull the atlas from
	path = "Jokers.png",
	-- Width of each sprite in 1x size
	px = 71,
	-- Height of each sprite in 1x size
	py = 95
}

SMODS.Atlas {
  key = "Vouchers",
  path = "Vouchers.png",
  px = 71,
  py = 95
}

SMODS.Atlas {
  key = "Tags",
  path = "Tags.png",
  px = 34,
  py = 34
}

SMODS.Atlas {
  key = 'modicon',
  px = 32,
  py = 32,
  path = 'modicon.png'
}

SMODS.Atlas { 
    key = 'Blinds', 
    path = 'Blinds.png', 
    px = 34, 
    py = 34, 
    frames = 21, 
    atlas_table = 'ANIMATION_ATLAS' 
}

SMODS.Atlas {
  key = "Enhancements",
  path = "Enhancements.png",
  px = 71, 
  py = 95
}

SMODS.Atlas {
  key = 'flux_atlas',
  path = "flux.png",
  px = 71, 
  py = 95
}

SMODS.Atlas {
  key = 'flux_hc_atlas',
  path = "flux_hc.png",
  px = 71, 
  py = 95
}

SMODS.Atlas {
  key = 'Tarots',
  path = "Tarots.png",
  px = 71, 
  py = 95
}

local atlas_lc = SMODS.Atlas {
      key = 'revelry' .. '_lc',
      path = 'collabs/lc/' .. 'revelry' .. '_lc.png',
      px = 71,
      py = 95
    }

    local atlas_hc = SMODS.Atlas {
      key = 'revelry' .. '_hc',
      path = 'collabs/hc/' .. 'revelry' .. '_hc.png',
      px = 71,
      py = 95
    }

SMODS.current_mod.optional_features = function()
    return {
        quantum_enhancements = true,
        post_trigger = true,
    }
end

--JOKERS

--Commons
assert(SMODS.load_file('Items/jokers/grotesque_joker.lua'))()
assert(SMODS.load_file('Items/jokers/loathsome_joker.lua'))()
assert(SMODS.load_file('Items/jokers/dopplejoker.lua'))()
assert(SMODS.load_file('Items/jokers/tentajoker.lua'))()
assert(SMODS.load_file('Items/jokers/blind_joker.lua'))()
assert(SMODS.load_file('Items/jokers/chuckling_clown.lua'))()
assert(SMODS.load_file('Items/jokers/impractical_joker.lua'))()
assert(SMODS.load_file('Items/jokers/iceberg.lua'))()
assert(SMODS.load_file('Items/jokers/lone_pawn.lua'))()
assert(SMODS.load_file('Items/jokers/forbidden_schematic.lua'))()
assert(SMODS.load_file('Items/jokers/striped_paint.lua'))()
assert(SMODS.load_file('Items/jokers/mirror_image.lua'))()
assert(SMODS.load_file('Items/jokers/cutoff_point.lua'))()
assert(SMODS.load_file('Items/jokers/contained_within.lua'))()
assert(SMODS.load_file('Items/jokers/contact_binary.lua'))()
assert(SMODS.load_file('Items/jokers/sinking_feeling.lua'))()
assert(SMODS.load_file('Items/jokers/lemon.lua'))()
assert(SMODS.load_file('Items/jokers/loosetongue.lua'))()
--Uncommons
assert(SMODS.load_file('Items/jokers/cardboard_cutout.lua'))()
assert(SMODS.load_file('Items/jokers/camo_joker.lua'))()
assert(SMODS.load_file('Items/jokers/verification_joker.lua'))()
assert(SMODS.load_file('Items/jokers/pyromancer.lua'))()
assert(SMODS.load_file('Items/jokers/photophobe.lua'))()
assert(SMODS.load_file('Items/jokers/cyclist.lua'))()
assert(SMODS.load_file('Items/jokers/snoozefest.lua'))()
assert(SMODS.load_file('Items/jokers/apples_to_oranges.lua'))()
assert(SMODS.load_file('Items/jokers/egomaniac.lua'))()
assert(SMODS.load_file('Items/jokers/dead_weight.lua'))()
assert(SMODS.load_file('Items/jokers/nickel_and_dime.lua'))()
assert(SMODS.load_file('Items/jokers/ad_infinitum.lua'))()
assert(SMODS.load_file('Items/jokers/tenancy.lua'))()
assert(SMODS.load_file('Items/jokers/inverted_pyramid.lua'))()
assert(SMODS.load_file('Items/jokers/hurricane.lua'))()
assert(SMODS.load_file('Items/jokers/maxout.lua'))()
assert(SMODS.load_file('Items/jokers/dyscalculia.lua'))()
assert(SMODS.load_file('Items/jokers/plastic_glove.lua'))()
assert(SMODS.load_file('Items/jokers/ruinful_jester.lua'))()
assert(SMODS.load_file('Items/jokers/snakes_and_ladders.lua'))()

--Rares
assert(SMODS.load_file('Items/jokers/stained_joker.lua'))()
assert(SMODS.load_file('Items/jokers/backwards_joker.lua'))()
assert(SMODS.load_file('Items/jokers/deadly_number.lua'))()
assert(SMODS.load_file('Items/jokers/smog.lua'))()
assert(SMODS.load_file('Items/jokers/dumpster_diving.lua'))()
assert(SMODS.load_file('Items/jokers/eruption.lua'))()
assert(SMODS.load_file('Items/jokers/one_armed_bandit.lua'))()

--VOUCHERS

assert(SMODS.load_file('Items/vouchers/bushel.lua'))()
assert(SMODS.load_file('Items/vouchers/cornucopia.lua'))()

--BOSS BLINDS
assert(SMODS.load_file('Items/blinds/sift.lua'))()
assert(SMODS.load_file('Items/blinds/smudge.lua'))()
assert(SMODS.load_file('Items/blinds/myriad.lua'))()
assert(SMODS.load_file('Items/blinds/morph.lua'))()
assert(SMODS.load_file('Items/blinds/drab.lua'))()
assert(SMODS.load_file('Items/blinds/bile.lua'))()

--TAROTS
assert(SMODS.load_file('Items/tarots/fountain.lua'))()

to_big = to_big or function(n)
  return n
	end
to_number = to_number or function(n)
		return n
	end
--ENHANCEMENTS
--assert(SMODS.load_file('Items/enhancements/recycled.lua'))()
assert(SMODS.load_file('Items/enhancements/flux.lua'))()
--[[local injectitems_ref = SMODS.injectItems
G.morne = {}
SMODS.injectItems = function()
    injectitems_ref()
    G.morne.flux_atlas = {}
      for i = 2, 14 do
          local fluxcard = SMODS.create_sprite(0, 0, 1, 1, 'morne_flux_atlas', {
              x = i,
              y = 0
              })
          table.insert(G.morne.flux_atlas, fluxcard)
      end
    end]]

SMODS.DeckSkin {
      key = "revelry" .. '_hearts',
      suit = "Hearts",
      loc_txt = {
        ['en-us'] = "Ruinful Revelry"
      },
      palettes = {
        {
          key = 'lc',
          ranks = {'King', 'Queen', 'Jack'},
          display_ranks = {'King', 'Queen', 'Jack'},
          pos_style = 'ranks',
          atlas = atlas_lc.key
        },
        {
          key = 'hc',
          ranks = {'King', 'Queen', 'Jack'},
          display_ranks = {'King', 'Queen', 'Jack'},
          pos_style = 'ranks',
          atlas = atlas_hc.key,
          hc_default = true
        }
      }
    }
