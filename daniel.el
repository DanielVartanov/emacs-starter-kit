(require 'better-defaults)

;; Emacs frame setting

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . fullboth)))))

;; (toggle-frame-fullscreen)

(set-default-font "Source Code Pro")
(set-face-attribute 'default nil :height 130)

(setq-default truncate-lines nil)

;; (load-theme 'zenburn t)
(load-theme 'nord t)
(setq nord-comment-brightness 20)

;; (require 'magit)

(require 'gist)

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(yas-global-mode 1)

(require 'smooth-scroll)
(smooth-scroll-mode t)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(smex-initialize)


;; fzf

(add-to-list 'load-path (concat dotfiles-dir "/vendor/fzf"))
(require 'fzf)

;; RSpec mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/rspec-mode"))
(require 'rspec-mode)

(setq rspec-use-rake-flag nil)
(setq rspec-use-rvm t)
(setq rspec-use-zeus-when-possible t)
(setq rspec-compilation-buffer-name "*rspec*")
(setq compilation-scroll-output nil)


;; Lua mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/lua-mode"))

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


;; Go mode

(add-hook 'go-mode-hook 'lsp-deferred)

;; ANSI colours in shell

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)

;; demo-it

(add-to-list 'load-path (concat dotfiles-dir "/vendor/demo-it"))

;; centered-window-mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/centered-window-mode"))
(require 'centered-window-mode)

;; fancy-narrow

(add-to-list 'load-path (concat dotfiles-dir "/vendor/fancy-narrow"))
(require 'fancy-narrow)

;; org-tree-slide

(add-to-list 'load-path (concat dotfiles-dir "/vendor/org-tree-slide"))
(require 'org-tree-slide)

(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)

;; Misc options

(setq ido-use-filename-at-point nil)
(setq next-line-add-newlines nil)
;; (tabbar-mode -1)
(setq js-indent-level 4)

(setq magit-last-seen-setup-instructions "1.4.0")

;; Hooks

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq server-visit-hook (quote (save-place-find-file-hook)))

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

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; Old M-x.

(define-key global-map (kbd "RET") 'newline-and-indent)
