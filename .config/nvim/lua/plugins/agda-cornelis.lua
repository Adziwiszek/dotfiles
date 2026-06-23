return {
  {
    'isovector/cornelis',
    name = 'cornelis',
    ft = 'agda',
    build = 'stack install',
    dependencies = { 'neovimhaskell/nvim-hs.vim', 'kana/vim-textobj-user' },
    version = '*',
    config = function()
      vim.keymap.set("n", "<leader>l", ":CornelisLoad<CR>", opts)
      vim.keymap.set("n", "<leader>mc", ":CornelisMakeCase<CR>", opts)
      vim.keymap.set("n", "<leader>q", ":CornelisQuestionToMeta<CR>", opts)
      vim.keymap.set("n", "<leader>a", ":CornelisAuto<CR>", opts)
      vim.keymap.set("n", "[p", ":CornelisPrevGoal<CR>", opts)
      vim.keymap.set("n", "[n", ":CornelisNextGoal<CR>", opts)
      vim.keymap.set("n", "<leader>g", ":CornelisGive<CR>", opts)

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.agda",
        callback = function()
          -- mapowania lokalne dla bufora
          local opts = { buffer = true, noremap = true, silent = true }

          --[[
          vim.keymap.set("n", "<leader>r", "<cmd>CornelisRefine<CR>", opts)
          vim.keymap.set("n", "<leader>,", "<cmd>CornelisTypeContext<CR>", opts)
          vim.keymap.set("n", "<leader>.", "<cmd>CornelisTypeContextInfer<CR>", opts)
          vim.keymap.set("n", "<leader>n", "<cmd>CornelisSolve<CR>", opts)
          vim.keymap.set("n", "<leader>a", "<cmd>CornelisAuto<CR>", opts)

          vim.keymap.set("n", "gd", "<cmd>CornelisGoToDefinition<CR>", opts)
          vim.keymap.set("n", "[/", "<cmd>CornelisPrevGoal<CR>", opts)
          vim.keymap.set("n", "]/", "<cmd>CornelisNextGoal<CR>", opts)

          vim.keymap.set("n", "<C-A>", "<cmd>CornelisInc<CR>", opts)
          vim.keymap.set("n", "<C-X>", "<cmd>CornelisDec<CR>", opts)
          --]]
        end,
      })

      -- close cornelis on exit
      vim.api.nvim_create_autocmd("QuitPre", {
        pattern = "*.agda",
        command = "CornelisCloseInfoWindows",
      })

      -- load cornelis on opening file
      local group = vim.api.nvim_create_augroup("AgdaCornelisLoad", { clear = true })

      local function cornelis_load_wrapper()
        -- odpowiednik: exists(":CornelisLoad") ==# 2
        if vim.fn.exists(":CornelisLoad") == 2 then
          vim.cmd("CornelisLoad")
        end
      end

      vim.api.nvim_create_autocmd("BufReadPre", {
        group = group,
        pattern = { "*.agda", "*.lagda*" },
        callback = cornelis_load_wrapper,
      })
    end,
  }
}
