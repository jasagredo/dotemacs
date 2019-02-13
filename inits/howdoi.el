;; Howdoi
(use-package howdoi
  :config
  (global-unset-key (kbd "C-x h"))
  (global-set-key (kbd "C-x h r") 'howdoi-query-line-at-point-replace-by-code-snippet))
