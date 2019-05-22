;; Dashboard
(defun my/dashboard-banner ()
  (setq dashboard-banner-logo-title
        (format "Emacs ready in %.2f seconds."
                (float-time (time-subtract after-init-time before-init-time)))))

(defun dashboard-insert-org-trello (list-size)
  "Add the list of LIST-SIZE items of org-trello"
  (require 'org)
  (require 'org-trello)
  (org-trello-mode)
  ;; Get the trello config dir
  (setf dir org-trello--config-dir)
  (org-trello-mode -1)
  ;; Get a list with the entries in which
  ;; the accounts registered in org-trello
  ;; participate
  (setf entries
        (let ((accounts
               (mapconcat (lambda (x)
                            (car (split-string (car (last (split-string x "\/"))) "\\.")))
                          (cddr (directory-files dir t)) "|"))
              (entries nil))
          (org-map-entries
           (lambda ()
             (let ((item (org-get-heading t t t t))
                   (category (org-get-todo-state))
                   (loc (point))
                   (file (buffer-file-name)))
               (when (not (org-entry-is-done-p))
                 (push (list item category loc file) entries))))
           (concat "orgtrello_users={" accounts "}")
           'agenda)
          entries))
  (dashboard-insert-section
   "Trello TODOs"
   entries
   list-size
   "t"
   ;; Navigate to the item on click or RET
   `(lambda (&rest ignore)
      (let ((buffer (find-file-other-window (nth 3 ',el))))
        (with-current-buffer buffer
          (goto-char (nth 2 ',el)))
        (switch-to-buffer buffer)))
   (format "%s: %s" (nth 1 el) (nth 0 el))))

(use-package dashboard
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  (add-hook 'dashboard-mode-hook 'my/dashboard-banner)
  :config
  (setq dashboard-startup-banner 'logo)
  (dashboard-setup-startup-hook)
  (add-to-list 'dashboard-item-generators '(trello . dashboard-insert-org-trello))
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5))))
