return {
  "kylechui/nvim-surround",
  event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = true,
}

--ys iw "- surround with
--ds " - remove
--cs "' - change from " to '
