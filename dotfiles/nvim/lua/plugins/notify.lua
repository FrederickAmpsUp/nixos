return {
    {
      "rcarriga/nvim-notify",
      config = function()
        local notify = require("notify")

        notify.setup({
          timeout = 3000,
          stages = "fade",
          render = "wrapped-compact",
          max_width = 80,
        })

        vim.notify = notify
      end,
    }
}
