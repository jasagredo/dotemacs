;; Rust
(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
  :config
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls")))

(use-package lsp-ui
  :ensure t
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (setq lsp-ui-imenu-kind-position (quote left)))

(use-package rust-mode
  :config
  (setq cargo-process--command-build "build")
  (setq cargo-process--command-clippy "+nightly clippy --all")
  (setq cargo-process--command-fmt "+nightly fmt")
  (setq cargo-process--enable-rust-backtrace t)
  (setq rust-format-on-save t)
  (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t)
  (add-hook 'rust-mode-hook #'flycheck-mode)
  (add-hook 'rust-mode-hook 'hs-minor-mode)
  (add-hook 'rust-mode-hook 'lsp))

(use-package flycheck-rust)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package racer
  :diminish racer-mode " ® "
  :config
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package cargo
  :diminish cargo-mode " CRG "
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))
