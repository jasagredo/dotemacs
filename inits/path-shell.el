(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-variables (quote ("PATH" "MANPATH" "LD_LIBRARY_PATH")))
  (exec-path-from-shell-initialize))
