;; Init package
(setq te (time-to-seconds (current-time)))
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (setq packages '(lsp-ui cargo racer flycheck-rust use-package rust-mode rainbow-delimiters projectile org-bullets neotree multiple-cursors magit howdoi haskell-mode flycheck diminish dashboard company))
  (mapc (lambda (x) (unless (package-installed-p x)
                 (package-install x))) packages))


(require 'use-package)
(message "Init time for %s: %s" "loading package and melpa" (- (time-to-seconds (current-time)) te))

(setq te (time-to-seconds (current-time)))
(setq inits-dir "~/.emacs.d/inits/")
(setq inits (directory-files-recursively inits-dir ".*\.el$"))
(message "Init time for %s: %s" "listing inits" (- (time-to-seconds (current-time)) te))
(mapc (lambda (x) (let ((te (time-to-seconds (current-time))))
		    (load x)
		    (message "Init time for %s: %s" x (- (time-to-seconds (current-time)) te)))) inits)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-rust-args (quote ("+nightly")))
 '(lsp-ui-imenu-kind-position (quote left))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/notes.org" "/Users/javiersagredo/Dropbox/org/agenda/agenda.org")))
 '(package-selected-packages
   (quote
    (lsp-ui cargo racer flycheck-rust use-package rust-mode rainbow-delimiters projectile org-bullets neotree multiple-cursors magit howdoi haskell-mode flycheck diminish dashboard company)))
 '(rust-format-on-save t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#212121" :foreground "#eeffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Iosevka"))))
 '(font-lock-constant-face ((t (:foreground "#C792EA"))))
 '(font-lock-keyword-face ((t (:foreground "#2BA3FF" :slant italic))))
 '(font-lock-preprocessor-face ((t (:inherit bold :foreground "#2BA3FF" :slant italic :weight normal))))
 '(font-lock-string-face ((t (:foreground "#C3E88D"))))
 '(font-lock-type-face ((t (:foreground "#FFCB6B"))))
 '(font-lock-variable-name-face ((t (:foreground "#FF5370")))))
