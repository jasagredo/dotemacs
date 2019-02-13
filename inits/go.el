;; GO
(use-package go-mode
  :config
  (setenv "GOPATH" "/Users/javiersagredo/Coding/golang")
  (add-to-list 'exec-path (concat (getenv "GOPATH") "/bin")))

(defun my-go-mode-hook ()
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(with-eval-after-load 'go-mode
  (use-package go-autocomplete))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
