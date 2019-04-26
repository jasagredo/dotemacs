(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (setq exec-path-from-shell-variables (quote ("PATH" "MANPATH" "LD_LIBRARY_PATH"))))
