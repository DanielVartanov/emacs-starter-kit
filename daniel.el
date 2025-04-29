(require 'better-defaults)

(set-frame-font "Source Code Pro")
(set-face-attribute 'default nil :height 140)

(setq-default truncate-lines nil)

(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)

(load-theme 'danneskjold t)
;; (load-theme 'nord t)

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))
(yas-global-mode 1)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(smex-initialize)

;; environment variables

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))


;; magit

(with-eval-after-load 'magit
  (transient-append-suffix 'magit-pull "-r"
    '("-A" "Autostash" "--autostash")))


;; RSpec mode

(setq rspec-use-rake-flag nil)
(setq rspec-use-rvm t)
(setq compilation-scroll-output nil)
(add-hook 'after-init-hook 'inf-ruby-switch-setup) ;; to use binding.pry or byebug


;; Lua mode

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


;; Kotlin mode

(add-to-list 'auto-mode-alist '("\\.kt\\'" . kotlin-ts-mode))


;; ANSI colours in shell

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)


;; Orderless

(require 'orderless)
(setq completion-styles '(orderless))


;; Selectrum

(selectrum-mode +1)


;; recentf

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 250)

(defun clear-message() (message nil)) ;; Clears the minibuffer while keeping the message in the `*Messages*` buffer
(advice-add 'recentf-save-list :after 'clear-message)
(run-with-timer 0 (* 5 60) 'recentf-save-list) ;; Because by default recentf would save the list only when/if Emacs exits properly


;; rg
(setq rg-executable "/usr/bin/rg") ;; Because in console we use a custom script which is badly compatible with `rg` emacs package
(setq rg-command-line-flags '("--hidden")) ;; Otherwise important files in ~/.home-directory don't get searched). If you have annoyingly large hidden files in your project, just use .rgignore to ignore them


;; projectile

(require 'projectile)

(setq projectile-project-search-path '("/home/daniel/src/"))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p s g") 'projectile-ripgrep)

(setq projectile-indexing-method 'hybrid)
(setq projectile-sort-order 'recentf)
(setq projectile-switch-project-action 'projectile-vc)

;; Invalidate Projectile cache when magit switched branches
(defun run-projectile-invalidate-cache (&rest _args)
  ;; We ignore the args to `magit-checkout'.
  (projectile-invalidate-cache nil))
(advice-add 'magit-checkout
            :after #'run-projectile-invalidate-cache)
(advice-add 'magit-branch-and-checkout ; This is `b c'.
            :after #'run-projectile-invalidate-cache)

(projectile-mode +1)


;; Ruby

(setq ruby-insert-encoding-magic-comment nil)


;; rubocop

(require 'rubocop)
(add-hook 'ruby-mode-hook #'rubocop-mode)


;; vterm

(setq vterm-shell "/bin/bash --login -c \"cd `git root` && exec bash --login\"")


;; man

(require 'man)
(set-face-attribute 'Man-overstrike nil :inherit font-lock-type-face :bold t)
(set-face-attribute 'Man-underline nil :inherit font-lock-keyword-face :underline t)


;; tree-sitter

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (gomod "https://github.com/camdencheek/tree-sitter-go-mod")
     (dockerfile "https://github.com/camdencheek/tree-sitter-dockerfile")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (kotlin "https://github.com/fwcd/tree-sitter-kotlin")
     (java "https://github.com/tree-sitter/tree-sitter-java")))

(dolist (source treesit-language-source-alist)
  (unless (treesit-ready-p (car source))
    (treesit-install-language-grammar (car source))))

(add-to-list 'major-mode-remap-alist '(go-mode . go-ts-mode))
(add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(ruby-mode . ruby-ts-mode))
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))


;; eglot

;;   eglot-go

(add-hook 'go-ts-mode-hook 'eglot-ensure)

(defun eglot-organize-imports-on-save ()
  (defun eglot-organize-imports-nosignal ()
    "Run eglot-organize-imports, but demote errors to messages."
    ;; Demote errors to work around
    ;; https://github.com/joaotavora/eglot/issues/411#issuecomment-749305401
    ;; so that we do not prevent subsequent save hooks from running
    ;; if we encounter a spurious error.
    (with-demoted-errors "Error: %s" (eglot-organize-imports)))
  (add-hook 'before-save-hook #'eglot-organize-imports-on-save))

(add-hook 'go-ts-mode-hook #'eglot-organize-imports-on-save)
(add-hook 'go-ts-mode-hook 'lsp-deferred)

;;   eglot-ruby

;; Important: in order to make eglot work with solargraph, ensure that
;; you install `solargraph`/`ruby-lsp` gem using _system_ Ruby (run `rvm use
;; system`) and using _global_ gemset (run `rvm gemset use global`)

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '(ruby-mode . ("solargraph" "socket" "--port" :autoport))))

(add-hook 'ruby-ts-mode-hook 'eglot-ensure)


;; Multiple cursors

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; web-mode

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))


;; good scroll

(good-scroll-mode 1)
(global-set-key (kbd "C-S-n") #'good-scroll-up)
(global-set-key (kbd "C-S-p") #'good-scroll-down)

;; Misc options

(setq default-input-method "russian-computer")
(setq ido-use-filename-at-point nil)
(setq next-line-add-newlines nil)
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

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command) ;; Old M-x.

(define-key global-map (kbd "RET") 'newline-and-indent)

(global-set-key (kbd "C-S-<prior>") 'text-scale-increase)
(global-set-key (kbd "C-S-<next>") 'text-scale-decrease)
(global-set-key (kbd "C-S-<home>") 'text-scale-set)


(message nil) ;; Clear mini-buffer
