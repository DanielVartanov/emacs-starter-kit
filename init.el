(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(require 'package)
;; Set ELPA packages dir explicitly for the case if you are running
;; from an alternative .emacs.d directory (i.e. not in ~/.emacs.d)
(setq package-user-dir (concat dotfiles-dir "elpa"))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize) ;; TODO: investigate why emacs 27.1 does not
;; initialize packages automatically, CHANGELOG says it should
;; See here: https://www.masteringemacs.org/article/whats-new-in-emacs-27-1

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl-lib)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)

;; Multiple cursors

(require 'multiple-cursors)


;; Load up starter kit customizations

(add-to-list 'load-path (concat dotfiles-dir "/starter-kit"))
(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-ruby)
(require 'starter-kit-js)

;; Load user-specific (like daniel.el) and machine-specific (like daniel-xps.el) init files

;; TODO: perhaps you do not need `daniel.el` as init.el is your file

(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el"))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
