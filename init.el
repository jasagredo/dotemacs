;; Global configs
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; Customize file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'package)
;; Add melpa
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (setq package-check-signature nil)
  (package-refresh-contents)
  (package-install 'gnu-elpa-keyring-update)
  (setq package-check-signature 'allow-unsigned)
  (package-initialize)
  (package-refresh-contents)
  (mapc (lambda (x) (unless (package-installed-p x)
                 (package-install x)))
        '(
          doom-themes
          magit
          projectile
          projectile-ripgrep
          flycheck
          company
          treemacs
          treemacs-projectile
          treemacs-magit
          helm
          helm-company
          helm-flycheck
          helm-projectile
          ace-window
          use-package
          undo-tree
          rainbow-mode
          multiple-cursors
          indent-guide
          exec-path-from-shell
          diminish
          dashboard
          which-key
          org-bullets
          deadgrep
          sane-term
          all-the-icons
          cheatsheet
          anzu
          beacon
          carbon-now-sh
          ;; programming
          lsp-mode
          haskell-mode
          cargo
          racer
          rust-mode
          flycheck-rust)))

;; Load packages installed locally
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "prolog")
(load "ghcid")

(org-babel-load-file "config.org")

