;; Flycheck globally
(use-package flycheck
  :ensure t
  :diminish flycheck-mode " ✈ "
  :config (add-hook 'after-init-hook #'global-flycheck-mode))
