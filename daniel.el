;; Emacs frame setting

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; (toggle-frame-fullscreen)

(set-default-font "Source Code Pro")
(set-face-attribute 'default nil :height 130)

(setq-default truncate-lines nil)


;; Load plugins

(load-theme 'zenburn t)

(require 'magit)

(require 'gist)

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))

(yas-global-mode 1)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/smooth-scroll"))
(require 'smooth-scroll)
(smooth-scroll-mode t)


;; RVM

(require 'rvm)
;; (rvm-activate-corresponding-ruby)


;; RSpec mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/rspec-mode"))
(require 'rspec-mode)

(setq rspec-use-rake-flag nil)
(setq rspec-use-rvm t)
(setq rspec-use-zeus-when-possible t)
(setq rspec-compilation-buffer-name "*rspec*")


;; Feature mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/feature-mode"))
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))


;; Javascript mode

(require 'js2-mode)


;; Misc options

(setq ido-use-filename-at-point nil)
(setq next-line-add-newlines nil)
;; (tabbar-mode -1)
(setq js-indent-level 4)

(setq magit-last-seen-setup-instructions "1.4.0")

;; Hooks

(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Rebindings

(global-set-key (kbd "C-x 3") '(lambda () (interactive) (split-window-horizontally) (ido-find-file-other-window)))
(global-set-key (kbd "C-x 2") '(lambda () (interactive) (split-window-vertically) (ido-find-file-other-window)))

(global-set-key (kbd "C-x C-o") 'delete-blank-lines)

(global-set-key (kbd "C-C C-r") 'ruby-send-region)

(global-set-key (kbd "M-b") 'ruby-backward-sexp)
(global-set-key (kbd "M-f") 'ruby-forward-sexp)

(global-set-key (kbd "C-S-s") 'replace-string)

(global-set-key (kbd "C-S-n")  'scroll-up-1)
(global-set-key (kbd "C-S-p")    'scroll-down-1)
(global-set-key [(control left)]  'scroll-right-1)
(global-set-key [(control right)] 'scroll-left-1)

(setq magit-last-seen-setup-instructions "1.4.0")
