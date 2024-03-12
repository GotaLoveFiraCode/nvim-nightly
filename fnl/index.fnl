(local nvim-treesitter-plugin
       {1 :nvim-treesitter/nvim-treesitter
        :event :VeryLazy
        :build ":TSUpdate"
        :config (fn []
                  ((. (require :nvim-treesitter.configs) :setup) {:auto_install true
                                                                  :highlight {:enable true}
                                                                  :indent {:enable true}
                                                                  :matchup {:enable true}
                                                                  :textsubjects {:enable true
                                                                                 :keymaps {:. :textsubjects-smart
                                                                                           ";" :textsubjects-container-outer
                                                                                           "," :textsubjects-container-inner}}}))})

(local nvim-cybu-plugin
       {1 :ghillb/cybu.nvim
        :dependencies [:nvim-tree/nvim-web-devicons :nvim-lua/plenary.nvim]
        :keys [[:<C-up> "<Plug>(CybuPrev)"]
               [:<C-down> "<Plug>(CybuNext)"]
               {1 :C-I 2 "<Plug>(CybuLastusedNext)" :mode [:n :v]}]
        :config (fn [] ; A huge part of this config might be unnecessary…
                  ((. (require :cybu) :setup) {:position {:anchor :bottomleft}
                                               :style {:path :relative
                                                       :border :rounded
                                                       :separator " "
                                                       :prefix "…"
                                                       :padding 1
                                                       :devicons {:enabled true
                                                                  :colored true
                                                                  :truncate true}
                                                       :highlights {:current_buffer :CybuFocus
                                                                    :adjacent_buffers :CybuAdjacent
                                                                    :border :CybuBorder}}}))})

(local nvim-telescope-plugin
       {1 :nvim-telescope/telescope.nvim
        :branch :0.1.x
        :dependencies [:nvim-lua/plenary.nvim
                       :nvim-telescope/telescope-frecency.nvim
                       :nvim-telescope/telescope-file-browser.nvim
                       {1 :nvim-telescope/telescope-fzf-native.nvim
                        :build :make}]
        ; For some reason I can’t use fennel code for this, so quoting for now.
        :keys [[:<Leader><Return> "<CMD>Telescope frecency workspace=CWD<CR>"]
               [:<Leader><Leader><Return> "<CMD>Telescope frecency<CR>"]
               [:<Leader>tr "<CMD>Telescope git_files<CR>"]
               [:<Leader>ts "<CMD>Telescope find_files theme=ivy<CR>"]
               [:<Leader>tn "<CMD>Telescope live_grep<CR>"]
               [:<Leader>ta "<CMD>Telescope buffers theme=dropdown<CR>"]
               [:<Leader>th "<CMD>Telescope help_tags<CR>"]
               ["-" "<CMD>Telescope file_browser<CR>"]]
        :config (fn []
                  ((. (require :telescope) :load_extension) :fzf)
                  ((. (require :telescope) :load_extension) :frecency)
                  ((. (require :telescope) :load_extension) :file_browser))})

(local nvim-sg-plugin {1 :sourcegraph/sg.nvim
                       :dependencies [:nvim-lua/plenary.nvim
                                      :nvim-telescope/telescope.nvim]
                       :config true})

(let [leap-plugin (require :plugins.leap)
      lspconfig-plugin (require :plugins.lspconfig)
      gitsigns-plugin (require :plugins.gitsigns)
      indent-lines-plugin (require :plugins.indent-lines)
      reticle-plugin (require :plugins.reticle)
      rustaceanvim-plugin (require :plugins.rust_tools)
      scroll-plugin (require :plugins.scroll)
      spider-plugin (require :plugins.spider)
      undotree-plugin (require :plugins.undotree)
      cmp-plugin (require :plugins.cmp)
      cmp-plug-plugin (require :plugins.cmp-plug)
      codeium-plugin (require :plugins.codeium)
      luasnip-plugin (require :plugins.snip)
      various-textobjs (require :plugins.textobj)
      unimpaired-plugin (require :plugins.unimpaired)]
  [:udayvir-singh/tangerine.nvim
   :udayvir-singh/hibiscus.nvim
   :jaawerth/fennel.vim
   :andymass/vim-matchup
   :Bekaboo/deadcolumn.nvim
   {1 :NMAC427/guess-indent.nvim :config true}
   {1 :rebelot/kanagawa.nvim :opts {:compile true}}
   {1 :anuvyklack/pretty-fold.nvim :opts {:fill_char "·"}}
   {1 :kylechui/nvim-surround :version "*" :config true :event :VeryLazy}
   {1 :m4xshen/autoclose.nvim
    :opts {:options {:pair_spaces true}}
    :event :VeryLazy}
   {1 :terrortylor/nvim-comment
    :keys [{1 :gcc} {1 :gc :mode [:n :v]}]
    :config (fn []
              ((. (require :nvim_comment) :setup) {:comment_empty false}))}
   {1 :norcalli/nvim-colorizer.lua
    :config true
    :keys [[:<Leader>ct vim.cmd.ColorizerToggle]
           [:<Leader>cc vim.cmd.ColorizerReloadAllBuffers]]}
   {1 :jinh0/eyeliner.nvim
    :keys [:f :F :t :T]
    :opts {:highlight_on_key true :dim true}}
   ; @@ Big Fennel configs @@
   nvim-cybu-plugin
   nvim-telescope-plugin
   nvim-treesitter-plugin
   ; @@ Lua Configs @@
   ;lspconfig-plugin
   leap-plugin
   gitsigns-plugin
   ;indent-lines-plugin
   reticle-plugin
   rustaceanvim-plugin
   scroll-plugin
   spider-plugin
   undotree-plugin
   cmp-plugin
   cmp-plug-plugin
   codeium-plugin
   luasnip-plugin
   ;nvim-sg-plugin ; Can’t login.
   unimpaired-plugin
   various-textobjs])

