;; Spotify
(use-package spotify
  :ensure t
  :config
  (global-set-key (kbd "C-c s p") 'spotify-playpause)
  (global-set-key (kbd "C-c s f") 'spotify-next)
  (global-set-key (kbd "C-c s b") 'spotify-previous))
