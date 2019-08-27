;; Init package
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
;; Solve issue with TLS
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
;; Add community driven repository
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
;; Install packages in first run
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (setq packages '(helm                 ;; minibuffer autocomplete engine
                   helm-company         ;; use helm in company
                   helm-flycheck        ;; use helm with flycheck
                   ace-window           ;; jump fast to other windows
                   intero               ;; haskell-stack
                   haskell-mode         ;; haskell
                   use-package          ;; pkg configurations
                   undo-tree            ;; better undo/redo
                   neotree              ;; file tree explorer
                   rainbow-mode         ;; colors on parenthesis
                   multiple-cursors     ;; multiple cursors
                   magit                ;; git
                   indent-guide         ;; visual indentation lines
                   exec-path-from-shell ;; get env variables
                   doom-themes          ;; themes
                   diminish             ;; small icons for modes
                   dashboard            ;; starting dashboard
                   company              ;; autocompletion
                   projectile           ;; project management
                   projectile-ripgrep   ;; rg
                   helm-projectile      ;; helm + projectile
                   lsp-ui               ;; visual help with doc powered by lsp
                   cargo                ;; cargo
                   racer                ;; more Rust
                   rust-mode            ;; Rust
                   rustic               ;; Better Rust
                   flycheck             ;; syntax checking
                   flycheck-rust        ;; syntax checking rust
                   which-key            ;; learn new key commands
                   carbon-now-sh        ;; code snapshots
                   org-bullets          ;; UTF bullets in org mode
                   deadgrep             ;; ripgrep
                   ))
  (mapc (lambda (x) (unless (package-installed-p x)
                 (package-install x))) packages))

(require 'use-package)
(require 'org)

(setq inits-dir "~/.emacs.d/inits/")
(setq inits (directory-files-recursively inits-dir ".*\.org$"))
(mapc (lambda (x) (org-babel-load-file x)) inits)

;; Exclude some files from recentf
(setq recentf-exclude (cons "~/.emacs.d/bookmarks" org-agenda-files))
;; customize file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
