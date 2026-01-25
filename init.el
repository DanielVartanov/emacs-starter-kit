(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(require 'package)
;; Set ELPA packages dir explicitly for the case if you are running
;; from an alternative .emacs.d directory (i.e. not in ~/.emacs.d)
(setq package-user-dir (concat dotfiles-dir "elpa"))

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("jcs-elpa" . "https://jcs-emacs.github.io/jcs-elpa/packages/") t)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl-lib)
(require 'ffap)
(require 'ansi-color)

;; Load up starter kit customizations

(add-to-list 'load-path (concat dotfiles-dir "/starter-kit"))
(require 'starter-kit-defuns)
(require 'starter-kit-bindings)
(require 'starter-kit-misc)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-ruby)
(require 'starter-kit-js)

;; Load secrets

(load (locate-user-emacs-file "secrets") t)

;; Load user-specific (like daniel.el) and machine-specific (like daniel-xps.el) init files

;; TODO: perhaps you do not need `daniel.el` as init.el is your file

(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el"))

(if (file-exists-p system-specific-config) (load system-specific-config))
(if (file-exists-p user-specific-config) (load user-specific-config))
