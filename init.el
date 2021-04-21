;;; package --- Javier's Configuration

;;; Commentary:

;;; Code:
(defvar gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(package-initialize)
(unless (assoc-default "melpa" package-archives)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
(unless (assoc-default "org" package-archives)
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t))

(unless (package-installed-p 'use-package)
  (setq package-check-signature nil)
  (package-refresh-contents)
  (package-install 'gnu-elpa-keyring-update)
  (setq package-check-signature 'allow-unsigned)
  (package-refresh-contents)
  (package-install 'use-package))

;; -----------------------------------------------------------------------------
(require 'use-package)
;; -----------------------------------------------------------------------------
(use-package use-package                    :custom (use-package-verbose t)
                                                    (use-package-always-ensure t))
;; -----------------------------------------------------------------------------
(use-package use-package-ensure-system-package)
;; -----------------------------------------------------------------------------
(use-package auto-compile                  :config (auto-compile-on-load-mode))
;; -----------------------------------------------------------------------------
(use-package selectrum                     :init        (selectrum-mode))
;; -----------------------------------------------------------------------------
(use-package prescient                     :config      (prescient-persist-mode))
;; -----------------------------------------------------------------------------
(use-package selectrum-prescient           :init        (prescient-persist-mode))
;; -----------------------------------------------------------------------------
(use-package company-prescient             :init        (company-prescient-mode))
;; -----------------------------------------------------------------------------
(use-package marginalia                    :init        (marginalia-mode)
                                           :custom      (marginalia-annotators '(marginalia-annotators-heavy))
                                           :config      (advice-add #'marginalia-cycle :after (lambda () (when (bound-and-true-p selectrum-mode) (selectrum-exhibit)))))
;; -----------------------------------------------------------------------------
(use-package orderless                     :custom      (completion-styles '(orderless)))
;; -----------------------------------------------------------------------------
(use-package dired                         :ensure      nil
                                           :bind        (:map dired-mode-map
                                                            ("<mouse-2>" . dired-find-alternate-file)
                                                            ("RET" . dired-find-alternate-file)
                                                            ("^" . (lambda () (interactive) (find-alternate-file ".."))))
                                           :config      (put 'dired-find-alternate-file 'disabled nil))
;; -----------------------------------------------------------------------------
(use-package dashboard                     :config      (dashboard-setup-startup-hook)
                                                        (add-to-list 'recentf-exclude "/\\.emacs\\.d/")
                                                        (recentf-cleanup)
                                           :custom      (dashboard-items '((recents  . 10)
                                                                           (projects . 10)))
                                                        (dashboard-set-heading-icons t)
                                                        (dashboard-set-file-icons t))
;; -----------------------------------------------------------------------------
(use-package treemacs                      :bind        ("<f2>" . treemacs))
;; -----------------------------------------------------------------------------
(use-package treemacs-projectile)
;; -----------------------------------------------------------------------------
(use-package treemacs-magit)
;; -----------------------------------------------------------------------------
(use-package projectile                    :custom      (projectile-enable-caching nil)
                                                        (projectile-switch-project-action 'projectile-dired)
                                           :bind-keymap ("C-c p" . projectile-command-map)
                                           :init        (projectile-mode))
;; -----------------------------------------------------------------------------
(use-package consult                       :bind   ("M-g o" . consult-outline)
                                                   ("C-x b" . consult-buffer)
                                                   ("M-y" . consult-yank-pop)
                                                   ("M-g M-g" . consult-goto-line)
                                                   ("M-g i" . consult-imenu)
                                                   ("M-g I" . consult-project-imenu)
                                                   ("<f6>" . consult-find)
                                                   ("<f5>" . consult-ripgrep)
                                           :custom (register-preview-delay 0)
                                                   (register-preview-function #'consult-register-format)
                                                   (consult-project-root-function #'projectile-project-root)
                                                   (consult-narrow-key "<")
                                           :config (projectile-load-known-projects)
                                                   (defvar my/consult-source-projectile-projects
                                                         `(:name "Projectile projects"
                                                                 :narrow   ?P
                                                                 :category project
                                                                 :action   ,#'projectile-switch-project-by-name
                                                                 :items    ,projectile-known-projects))
                                                   (add-to-list 'consult-buffer-sources my/consult-source-projectile-projects 'append))
;; -----------------------------------------------------------------------------
(use-package exec-path-from-shell          :custom      (exec-path-from-shell-variables '("PATH"))
                                                        (exec-path-from-shell-check-startup-files nil)
                                                        (exec-path-from-shell-arguments nil)
                                           :config      (exec-path-from-shell-initialize))
;; -----------------------------------------------------------------------------
(use-package company                       :custom      (company-idle-delay .3)
                                                        (company-echo-delay 0)
                                                        (company-tooltip-limit 15)
                                                        (company-minimum-prefix-length 1)
                                                        (company-dabbrev-downcase nil)
                                           :hook        (prog-mode . company-mode))
;; -----------------------------------------------------------------------------
(use-package f)
;; -----------------------------------------------------------------------------
(use-package async)
;; -----------------------------------------------------------------------------
(use-package simple-httpd)
;; -----------------------------------------------------------------------------
(use-package all-the-icons)
;; -----------------------------------------------------------------------------
(use-package multiple-cursors              :bind        ("C-S-c C-S-c" . mc/edit-lines))
;; -----------------------------------------------------------------------------
(use-package ace-window                    :bind        ("M-o" . ace-window))
;; -----------------------------------------------------------------------------
(use-package expand-region                 :bind        ("C-=" . er/expand-region))
;; -----------------------------------------------------------------------------
(use-package undo-tree                     :config      (global-undo-tree-mode))
;; -----------------------------------------------------------------------------
(use-package anzu                          :config      (global-anzu-mode))
;; -----------------------------------------------------------------------------
(use-package doom-themes                   :config      (load-theme 'doom-dracula t))
;; -----------------------------------------------------------------------------
(use-package doom-modeline                 :config      (doom-modeline-mode))
;; -----------------------------------------------------------------------------
(use-package which-key                     :config      (which-key-mode))
;; -----------------------------------------------------------------------------
(use-package org-superstar                 :hook        (org-mode . org-superstar-mode))
;; -----------------------------------------------------------------------------
(use-package rainbow-delimiters            :hook        (prog-mode . rainbow-delimiters-mode))
;; -----------------------------------------------------------------------------
(use-package indent-guide                  :hook        (prog-mode . indent-guide-mode))
;; -----------------------------------------------------------------------------
(use-package beacon                        :hook        (prog-mode . beacon-mode))
;; -----------------------------------------------------------------------------
(use-package ws-butler                     :hook        (prog-mode . ws-butler-mode))
;; -----------------------------------------------------------------------------
(use-package flycheck                      :hook        (prog-mode . flycheck-mode)
                                           :custom      (flycheck-executable-find (lambda (cmd) (direnv-update-environment default-directory) (executable-find cmd))))
;; -----------------------------------------------------------------------------
(use-package paren                         :custom      (show-paren-delay 0)
                                           :config      (show-paren-mode))
;; -----------------------------------------------------------------------------
(use-package display-fill-column-indicator :config      (setq-default fill-column 80)
                                           :hook        (prog-mode . display-fill-column-indicator-mode))
;; -----------------------------------------------------------------------------
(use-package org)
;; -----------------------------------------------------------------------------
(use-package org-superstar                 :custom      (org-hide-leading-stars nil)
                                                        (org-superstar-leading-bullet ?\s)
                                                        (org-indent-mode-turns-on-hiding-stars nil)
                                                        (org-superstar-special-todo-items t)
                                           :config      (org-superstar-mode))
;; -----------------------------------------------------------------------------
(use-package deadgrep                      :ensure-system-package (rg . ripgrep)
                                           :bind        ("<f3>" . deadgrep))
;; -----------------------------------------------------------------------------
(use-package magit                         :ensure-system-package git
                                           :bind        ("C-x g" . magit-status))
;; -----------------------------------------------------------------------------
(use-package direnv                        :ensure-system-package direnv
                                           :config      (direnv-mode))
;; -----------------------------------------------------------------------------
(use-package haskell-mode                  :custom      (haskell-stylish-on-save t)
                                                        (haskell-tags-on-save t)
                                                        (haskell-compiler-type 'cabal)
                                                        (haskell-process-type 'cabal-repl)
                                                        (haskell-compile-stack-build-command "cabal build")
                                                        (haskell-indent-offset 4)
                                                        (haskell-interactive-popup-errors nil)
                                           :config      (add-to-list 'direnv-non-file-modes 'haskell-compilation-mode)
                                           :bind        (:map haskell-mode-map
                                                              ("<f4>" . haskell-compile))
                                           :hook        (haskell-mode . subword-mode))
;; -----------------------------------------------------------------------------
(use-package lsp-mode                      :commands    lsp
                                           :hook        (haskell-mode . lsp)
                                                        (lsp-mode . lsp-enable-which-key-integration)
                                           :custom      (lsp-prefer-flymake nil)
                                           :config      (push "[/\\\\]\\.stack-work\\'" lsp-file-watch-ignored-directories)
                                                        (advice-add 'lsp :before #'direnv-update-environment)
                                                        (setq company-minimum-prefix-length 1
                                                              company-idle-delay 0.0)
                                                        (setq gc-cons-threshold 100000000)
                                                        (setq read-process-output-max (* 1024 1024)))
;; -----------------------------------------------------------------------------
(use-package lsp-haskell)
;; -----------------------------------------------------------------------------
(use-package lsp-ui                        :hook        (lsp-mode . lsp-ui-mode)
                                           :custom      (lsp-ui-doc-header t)
                                                        (lsp-ui-doc-include-signature t)
                                                        (lsp-ui-doc-position 'top))
;; -----------------------------------------------------------------------------
(use-package lsp-treemacs                  :hook        (lsp-mode . lsp-treemacs-sync-mode))
;; -----------------------------------------------------------------------------
(use-package bug-reference                 :custom      (bug-reference-bug-regexp (rx (group (| (: (in ?I ?i) "ssue" (? ?\s) ?#)
                                                                                                (: "PR" (? ?\s) ?!)))
                                                                                      (group (+ digit))))
                                           :config      (defun my-github-url () ""
                                                          (format "https://github.com/input-output-hk/ouroboros-network/%s/%s"
                                                                  (if (string-suffix-p "!" (match-string-no-properties 1))
                                                                      "pull"
                                                                    "issues")
                                                                  (match-string-no-properties 2)))
                                                        (setq bug-reference-url-format #'my-github-url)
                                           :hook        (org-mode . bug-reference-mode)
                                                        (prog-mode . bug-reference-prog-mode))
;; -----------------------------------------------------------------------------
(use-package nix-mode)
;; -----------------------------------------------------------------------------
(use-package emacs
  :config
  (setq custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file))
  (global-auto-revert-mode)

  ; open the config
  (global-set-key (kbd "<f12>")
                  '(lambda () (interactive) (find-file user-init-file)))
  (global-set-key (kbd "C-<f12>")
                  '(lambda () (interactive) (progn (byte-compile-file user-init-file)
                                              (load (concat user-emacs-directory "init.elc")))))
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (toggle-scroll-bar -1)
  (setq-default cursor-type 'hbar)
  (add-hook 'prog-mode-hook #'linum-mode)
  (setq load-prefer-newer t)
  (column-number-mode)
  (setq frame-title-format '(:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b")))
  (setq visible-bell t)
  (global-prettify-symbols-mode)
  (global-hl-line-mode)
  (set-face-attribute 'default nil :height 120)
  (delete-selection-mode)
  (setq-default indent-tabs-mode nil)
  (setq tags-revert-without-query 1)
  (setq mouse-wheel-follow-mouse 't
        scroll-conservatively 101
        mouse-wheel-scroll-amount '(1 ((shift) . 1)))
  (windmove-default-keybindings)
  (set-language-environment "UTF-8")
  (set-default-coding-systems 'utf-8)
  (prefer-coding-system 'utf-8)
  (when (display-graphic-p)
    (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
  (setq create-lockfiles nil
        backup-directory-alist '(("." . "~/.emacs.d/backup"))
        backup-by-copying t
        version-control nil
        delete-old-versions t)
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "firefox")
  (bind-key (kbd "C-x k") #'kill-this-buffer)
  (defalias 'yes-or-no-p 'y-or-n-p)
  (add-to-list 'load-path (concat user-emacs-directory "lisp/prolog-mode"))
  (add-to-list 'load-path (concat user-emacs-directory "lisp/code-compass"))

  (defun repeat-times (times what) "Repeat WHAT TIMES times."
         (apply 'concat (make-list times what)))
  (defun create-boxed-title (title)
    "Create a box of 'fill-column' chars wide with a TITLE in the center."
    (interactive "sWrite the title: ")
    (let* ((width (string-width title)) ;; the length of the title
           (comm (replace-regexp-in-string "\s+$" "" comment-start)) ;; trimmed comment chars
           (comment-width (string-width comment-start)) ;; the length of the comment
           (side (/ (- fill-column width (* comment-width 2)) 2)) ;; spaces on each side
           (rem (- fill-column width (* comment-width 2) (* side 2))) ;; maybe one space at the right side if odd
           (buffer (current-buffer)))
      (insert (format "%s\n" (repeat-times (/ fill-column comment-width) comm)))
      (insert (format "%s%s%s\n" comm (repeat-times (- fill-column (* 2 comment-width)) " ") comm))
      (insert (format "%s%s%s\n" comm (concat (repeat-times side " ") title (repeat-times (+ rem side) " ")) comm))
      (insert (format "%s%s%s\n" comm (repeat-times (- fill-column (* 2 comment-width)) " ") comm))
      (insert (format "%s\n" (repeat-times (/ fill-column comment-width) comm)))))
  (add-hook 'prog-mode-hook (lambda() (global-set-key (kbd "C-c C-t") 'create-dashed-title))))
;; -----------------------------------------------------------------------------
(require 'code-compass)
;; -----------------------------------------------------------------------------
(require 'prolog)
(use-package prolog :custom (prolog-system 'swi)
                    :config (setq auto-mode-alist (append '(("\\.pl$" . prolog-mode)
                                                            ("\\.m$" . mercury-mode))
                                                          auto-mode-alist))
                            (autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
                            (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
                            (autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t))
(provide 'init)
