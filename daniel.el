(setq jabber-account-list
    '(("aldor.kg@gmail.com" 
       (:network-server . "talk.google.com")
       (:connection-type . ssl))))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-twilight)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/feature-mode"))
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/rspec-mode"))
(require 'rspec-mode)

(require 'magit)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/gist.el"))
(require 'gist)

(add-to-list 'load-path (concat dotfiles-dir "vendor/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet/snippets"))


;; Emacs frame setting

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) 

(set-face-attribute 'default nil :height 120)


;; Rebindings
(global-set-key (kbd "C-x 3") '(lambda () (interactive) (split-window-horizontally) (ido-switch-buffer-other-window)))
(global-set-key (kbd "C-x 2") '(lambda () (interactive) (split-window-vertically) (ido-switch-buffer-other-window)))

(global-set-key (kbd "C-x C-o") 'delete-blank-lines)

(global-set-key (kbd "M-b") 'ruby-backward-sexp)
(global-set-key (kbd "M-f") 'ruby-forward-sexp)

;; (global-set-key (kbd "C-tab") 'other-window)
;; (global-set-key (kbd "C-backspace") 'backward-kill-sexp)
