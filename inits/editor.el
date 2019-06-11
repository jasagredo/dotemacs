;; Editing

;;;; Undo-tree
(use-package undo-tree
  :diminish undo-tree-mode " Ⓤ "
  :config
  (global-undo-tree-mode))

;;;; Indent
(use-package indent-guide
  :config
  (add-hook 'prog-mode-hook 'indent-guide-mode))

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

;;;; Ido - buffer and file managing and autocompletion
(use-package ido
  :config
  (ido-mode t))

;;;; Remove trailing whitespace on saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(use-package dired
  :config
  (define-key dired-mode-map [mouse-2] 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file ".."))))
