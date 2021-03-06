(require 'better-defaults)

(set-frame-font "Source Code Pro")
(set-face-attribute 'default nil :height 130)

(setq-default truncate-lines nil)

(load-theme 'nord t)

;; (require 'magit)

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(yas-global-mode 1)

(require 'smooth-scroll) ;; TODO: this causes "Package cl is deprecated" warning on startup
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
(require 'centered-window)


;; fancy-narrow

(add-to-list 'load-path (concat dotfiles-dir "/vendor/fancy-narrow"))
(require 'fancy-narrow)


;; org-tree-slide

(add-to-list 'load-path (concat dotfiles-dir "/vendor/org-tree-slide"))
(require 'org-tree-slide)

(global-set-key (kbd "<f8>") 'org-tree-slide-mode)
(global-set-key (kbd "S-<f8>") 'org-tree-slide-skip-done-toggle)


;; projectile

(require 'projectile)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-sort-order 'recently-active)
(projectile-mode +1)

;; Ruby

(setq ruby-insert-encoding-magic-comment nil)

;; rubocop

(require 'rubocop)
(add-hook 'ruby-mode-hook #'rubocop-mode)

;; Multiple cursors

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; web-mode

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(set-face-attribute 'web-mode-html-tag-face          nil :foreground "#777777")
(set-face-attribute 'web-mode-html-attr-name-face    nil :foreground "#aaaaaa")
(set-face-attribute 'web-mode-html-attr-equal-face   nil :foreground "#eeeeee")
(set-face-attribute 'web-mode-html-attr-value-face   nil :foreground "RosyBrown")


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

(global-set-key (kbd "C-x 3") '(lambda ()
                                 (interactive)
                                 (split-window-horizontally)
                                 (other-window 1)))

(global-set-key (kbd "C-x 2") '(lambda () (interactive)
                                 (split-window-vertically)
                                 (other-window 1)))

(global-set-key (kbd "C-x C-o") 'delete-blank-lines)

(global-set-key (kbd "C-S-c C-r") 'ruby-send-region)

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
