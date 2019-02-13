;; Haskell
(use-package haskell-mode
  :config
  (setq haskell-process-type (quote cabal-new-repl))
  (setq haskell-stylish-on-save t))
