(use-package org-trello
  :config
  (setq org-trello-current-prefix-keybinding "C-c o")
  (add-hook 'org-mode-hook 'org-trello-mode))
