;; Org
(defun my/open-org-agenda ()
  "Opens agenda file."
  (interactive)
  (progn
    (split-window-right)
    (other-window 1)
    (find-file "~/org/index.org")))

(use-package org
  :ensure t
  :bind (("<f3>" . my/open-org-agenda)
         ("<f7>" . my/projectile-open-personal-notes)
         ("C-c c" . org-capture)
         ("C-c a" . org-agenda))
  :init (progn
          (setq org-directory "~/org")
          (setq org-default-notes-file (concat org-directory "/notes.org"))
          (setq org-capture-templates
                '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks") "* TODO %?\n  %i\n  %a")
                  ("n" "Note" entry (file+headline org-default-notes-file "Note") "* Note: %?\n  %i\n  %a")))
          (setq org-todo-keywords
                '((sequence "TODO" "INPROGRESS" "DONE(!)" )))
          )
  :config
  (use-package org-bullets
    :ensure t
    :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))
