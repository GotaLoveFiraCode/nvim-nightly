;; Import hibiscus macros to make life easier.
;(import-macros {: map!} :hibiscus.vim)
(import-macros {: exec!} :hibiscus.vim)
(import-macros {: set+} :hibiscus.vim)
(import-macros {: color!} :hibiscus.vim)

;; Mapleader needs to be set before lazy is setup.
(exec! [let mapleader = " "])

;; Basic Vim settings. Plus a few keybinds, etc.
(require :core)

;; Adding lazy dir to rtp.
(set+ rtp (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))

;; Set lazy.nvim up.
((. (require :lazy) :setup) (require :index)
                            {:performance {:rtp {:disabled_plugins [:gzip
                                                                    :matchit
                                                                    :matchparen
                                                                    :tarPlugin
                                                                    :tutor
                                                                    :zipPlugin
                                                                    :tohtml
                                                                    :netrwPlugin
                                                                    :editorconfig]}}})

;; Colorscheme :)
(color! :kanagawa)

