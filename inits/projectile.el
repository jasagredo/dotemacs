;; Projectile
(use-package projectile
  :ensure t
  :diminish projectile-mode " Ⓟ "
  :init (progn
          (setq projectile-enable-caching nil)
          (setq projectile-switch-project-action 'projectile-dired))
  :config
  (global-set-key "" (quote projectile-run-eshell))
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
