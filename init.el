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
  (package-install 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Load packages installed locally
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "prolog")
(load "ghcid")

(defun report-missing-executable (exe name f)
  (if (executable-find exe)
      f
    (user-error (s-concat name " not found in PATH, please install it"))))

(org-babel-load-file "~/.emacs.d/config.org")
