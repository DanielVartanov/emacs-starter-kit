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

(require 'magit)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/gist"))
(require 'gist)

(add-to-list 'load-path (concat dotfiles-dir "vendor/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet/snippets"))

(add-to-list 'load-path (concat dotfiles-dir "/vendor/smooth-scroll"))
(require 'smooth-scroll)
(smooth-scroll-mode t)

(add-to-list 'load-path (concat dotfiles-dir "/vendor/slim-mode"))
(require 'slim-mode)

;; RSpec mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/rspec-mode"))
(require 'rspec-mode)

(defadvice rspec-compile (around rspec-compile-around)
  "Use BASH shell for running the specs because of RVM issues."
  (let ((shell-file-name "/bin/bash"))
    ad-do-it))
(ad-activate 'rspec-compile)

;; RVM
(add-to-list 'load-path (concat dotfiles-dir "/vendor/rvm.el"))
(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

;; Erlang setup

(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.6.6.5/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))

(setq erlang-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil))))
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq erlang-indent-level 2)
(require 'erlang-start)

;; Emacs frame setting

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)) 

(set-face-attribute 'default nil :height 120)


;; Misc options

(setq ido-use-filename-at-point nil)
(setq next-line-add-newlines nil)

;; Rebindings

(global-set-key (kbd "C-x 3") '(lambda () (interactive) (split-window-horizontally) (ido-find-file-other-window)))
(global-set-key (kbd "C-x 2") '(lambda () (interactive) (split-window-vertically) (ido-find-file-other-window)))

(global-set-key (kbd "C-x C-o") 'delete-blank-lines)

(global-set-key (kbd "M-b") 'ruby-backward-sexp)
(global-set-key (kbd "M-f") 'ruby-forward-sexp)

(global-set-key (kbd "C-S-s") 'replace-string)

;; (global-set-key (kbd "C-tab") 'other-window)
;; (global-set-key (kbd "C-backspace") 'backward-kill-sexp)

(global-set-key [(control  down)]  'scroll-up-1)
(global-set-key [(control  up)]    'scroll-down-1)
(global-set-key [(control  left)]  'scroll-right-1)
(global-set-key [(control  right)] 'scroll-left-1)
