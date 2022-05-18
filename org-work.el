(setq emacs-config-dir (file-name-directory
                        (or (buffer-file-name) load-file-name)))
(load (concat emacs-config-dir "light.el"))


(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-bright t)


(setq org-agenda-files (list "~/Dropbox/my-texts/deliveroo/gtd.org"))
