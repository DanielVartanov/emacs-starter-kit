(setq emacs-config-dir (file-name-directory
                        (or (buffer-file-name) load-file-name)))
(load (concat emacs-config-dir "light.el"))


(setq org-agenda-files (list "~/Dropbox/my-texts/gtd.org"))
