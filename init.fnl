;(require-macros :hibiscus.core)
;(require-macros :hibiscus.vim)

(import-macros {: map!} :hibiscus.vim)
(import-macros {: exec!} :hibiscus.vim)
(import-macros {: set+} :hibiscus.vim)
(import-macros {: color!} :hibiscus.vim)

; Mapleader needs to be set before lazy is setup.
(exec! [let mapleader = " "])

; Basic Vim settings. Plus a few keybinds, etc.
(require :core)

; Old plugin configs in lua.
(local alpha-plugin (require :plugins.alpha))
(local comment-plugin (require :plugins.comment))
(local leap-plugin (require :plugins.leap))

;(local (sym (.. name :-plugin)) (require (.. ":plugins." (tostring name)))))

; Adding lazy dir to rtp.
(set+ rtp (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))

; Treesitter config. Might extract into another file later.
(local nvim-treesitter-plugin
       {1 :nvim-treesitter/nvim-treesitter
        :event :VeryLazy
        :build ":TSUpdate"
        :config (fn []
                  (let [treesitter (require :nvim-treesitter.configs)]
                    (treesitter.setup {:auto_install true
                                       :highlight {:enable true}
                                       :indent {:enable true}
                                       :matchup {:enable true}
                                       :textsubjects {:enable true
                                                      :keymaps {:. :textsubjects-smart
                                                                ";" :textsubjects-container-outer
                                                                "," :textsubjects-container-inner}}})))})

; LSP integration.
(local nvim-lspconfig-plugin {1 :neovim/nvim-lspconfig
                              :dependencies [:j-hui/fidget.nvim]
                              :config (fn []
                                        (map! [n] :<leader>e
                                              vim.diagnostic.open_float)
                                        ;(let [lspconfig (require :lspconfig)]
                                        ;(lspconfig.fennel_ls.setup {}))
                                        )})

; Plugins
(local plugins [:udayvir-singh/tangerine.nvim
                :udayvir-singh/hibiscus.nvim
                :jaawerth/fennel.vim
                {1 :NMAC427/guess-indent.nvim :config true}
                nvim-treesitter-plugin
                {1 :rebelot/kanagawa.nvim :opts {:compile true}}
                :andymass/vim-matchup
                {1 :kylechui/nvim-surround
                 :version "*"
                 :config true
                 :event :VeryLazy}
                {1 :m4xshen/autoclose.nvim
                 :opts {:options {:pair_spaces true}}
                 :event :VeryLazy}
                nvim-lspconfig-plugin
                alpha-plugin
                comment-plugin
                leap-plugin])

; Set lazy.nvim up.
(let [lazy (require :lazy)]
  (lazy.setup plugins))

; Colorscheme :)
(color! :kanagawa)

