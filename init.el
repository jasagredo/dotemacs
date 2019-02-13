;; Init package
(require 'package)
(add-to-list 'package-archives (cons "melpa" "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(setq inits-dir "~/.emacs.d/inits/")
(setq inits (directory-files-recursively inits-dir ".*\.el"))
(mapc (lambda (x) (load x)) inits)
