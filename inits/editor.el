;; Editing

;;;; Neotree
(use-package neotree
  :config
  (global-set-key (kbd "C-x n t") 'neotree-toggle)
  (setq neo-smart-open t)
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
;;;; Delete selection
(delete-selection-mode 1)
;;;; Tabs
(setq-default indent-tabs-mode nil)
;;;; Multiple cursors
(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines))
;;;; backup and lock files
(setq create-lockfiles nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t
  version-control t
  delete-old-versions t
  kept-new-versions 20
  kept-old-versions 5)
;;;; Commands
(setq grep-command "grep -rnw . -e ")
;;;; Ido - buffer and file managing and autocompletion
(use-package ido
  :config
  (ido-mode t))
;;;; Remove trailing whitespace on saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
