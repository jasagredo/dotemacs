;; Visual and navigation

;;;; Start maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(if (string-equal system-type "darwin")
    (progn
    (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
    (add-to-list 'default-frame-alist '(ns-appearance . dark))
    (setq ns-use-proxy-icon  nil)
    (setq frame-title-format nil)))
;;;; Show full file name
(setq frame-title-format '(:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b")))
;;;; Rainbow delimiters
(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
;;;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))
;;;; Mouse scroll
(setq mouse-wheel-follow-mouse 't)
(setq scroll-conservatively 101)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
;;;; Parens
(show-paren-mode 1)
(setq show-paren-delay 0)
;;;; Indicators and menus
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(display-battery-mode)
(display-time-mode 1)
;;;; Editor
(column-number-mode t)
(global-linum-mode)
;;;; Autocomplete
(use-package company
  :ensure t
  :diminish company-mode " Ⓒ "
  :init (global-company-mode)
  :config (progn
                (setq company-idle-delay .3)
                (setq company-echo-delay 0)
                (setq company-tooltip-limit 15)
                (setq company-minimum-prefix-length 1)
                (setq company-dabbrev-downcase nil)))
;;;; Sound
(setq ring-bell-function 'ignore)
;;;; Prettify
(global-prettify-symbols-mode)
;;;; Diminish
(use-package diminish)
;;;; All-the-icons
(use-package all-the-icons
  :ensure t)
;; Font size
(set-face-attribute 'default nil :height 190)
