return {
  {
    "catppuccin/nvim",          -- Plugin repository
    lazy = false,               -- This plugin is not lazy-loaded
    name = "catppuccin",        -- Plugin name
    priority = 1000,            -- Set the loading priority
    config = function()         -- Configuration function for the plugin
      require("catppuccin").setup({
        -- Custom color palette for the theme
        flavour = "macchiato",    -- You can use "macchiato", "latte", or "mocha" based on your preference
        background = {
          light = "latte",        -- Light mode color
          dark = "mocha",         -- Dark mode color
        },
        integrations = {
          cmp = true,            -- Enable for nvim-cmp integration
          gitsigns = true,       -- Enable for gitsigns integration
          telescope = true,      -- Enable for telescope integration
          treesitter = true,     -- Enable for treesitter integration
        },
        custom = {
          -- Custom color overrides for specific UI elements
          base = "#282c34",
          mantle = "#353b45",
          surface0 = "#3e4451",
          surface1 = "#545862",
          surface2 = "#565c64",
          text = "#abb2bf",
          rosewater = "#b6bdca",
          lavender = "#c8ccd4",
          red = "#e06c75",
          peach = "#d19a66",
          yellow = "#e5c07b",
          green = "#98c379",
          teal = "#56b6c2",
          blue = "#61afef",
          mauve = "#c678dd",
          flamingo = "#be5046",
          -- Extra custom colors
          maroon = "#e06c75",
          sky = "#d19a66",
          -- Additional colors for UI elements
          pink = "#F5C2E7",
          sapphire = "#74C7EC",
          subtext1 = "#BAC2DE",
          subtext0 = "#A6ADC8",
          overlay2 = "#9399B2",
          overlay1 = "#7F849C",
          overlay0 = "#6C7086",
          crust = "#11111B",
        },
      })
      -- Apply the color scheme after setup
      vim.cmd.colorscheme "catppuccin"
    end
  }
}
