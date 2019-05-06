;; Rust
(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)
  :config
  (setq lsp-rust-rls-command '("rustup" "run" "rls"))
  (setq lsp-prefer-flymake nil))

(use-package lsp-ui
  :ensure t
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (setq lsp-ui-imenu-kind-position (quote left)))

(use-package rust-mode
  :config
  (setq rust-rustfmt-bin "~/.rustup/toolchains/nightly-2019-03-22-x86_64-unknown-linux-gnu/bin/rustfmt")
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
  (add-hook 'rust-mode-hook 'cargo-minor-mode)
  (setq cargo-process--command-build "build")
  (setq cargo-process--command-clippy "clippy --all")
  (setq cargo-process--command-fmt "+nightly fmt")
  (setq cargo-process--enable-rust-backtrace t))
