;; Org
(use-package org
  :ensure t
  :bind (("C-c c" . org-capture)
         ("C-c a" . org-agenda))
  :init (progn
          (setq org-directory "~/Dropbox/org")
          (setq org-agenda-files (quote ("~/Dropbox/org/agenda/agenda.org")))
          (setq org-agenda-files (cons "~/Dropbox/org/notes.org" (cons "~/Dropbox/org/agenda.org" (directory-files-recursively "~/Dropbox/org/agenda/" "\.org$"))))
          (setq org-default-notes-file (concat org-directory "/notes.org"))
          (setq org-capture-templates
                '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks") "* TODO %?\n  %i\n  %a")
                  ("n" "Note" entry (file+headline org-default-notes-file "Note") "* Note: %?\n  %i\n  %a")))
          (setq org-todo-keywords
                '((sequence "TODO" "INPROGRESS" "DONE(!)" )))
          (setq org-directory "~/Dropbox/org")
          (setq org-mobile-inbox-for-pull "~/Dropbox/org/inbox.org")
          (setq org-mobile-directory "~/Dropbox/Aplicaciones/MobileOrg")
          (setq org-mobile-files '("~/Dropbox/org")))
  :config
  (use-package org-bullets
    :ensure t
    :config (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))
