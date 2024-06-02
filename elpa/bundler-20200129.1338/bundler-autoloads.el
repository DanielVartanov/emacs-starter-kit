;;; bundler-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from bundler.el

(autoload 'bundle-open "bundler" "\
Queries for a gem name and opens the location of the gem in dired.

(fn GEM-NAME)" t)
(autoload 'bundle-console "bundler" "\
Run an inferior Ruby process in the context of the current bundle." t)
(autoload 'bundle-check "bundler" "\
Run bundle check for the current bundle." t)
(autoload 'bundle-install "bundler" "\
Run bundle install for the current bundle." t)
(autoload 'bundle-update "bundler" "\
Run bundle update for the current bundle.

(fn &optional UPDATE-CMD-ARGS)" t)
(autoload 'bundle-exec "bundler" "\


(fn COMMAND)" t)
(autoload 'bundle-gemfile "bundler" "\
Set BUNDLE_GEMFILE environment variable.

(fn &optional GEMFILE)" t)
(autoload 'bundle-outdated "bundler" "\
List installed gems with newer versions available." t)
(autoload 'bundle-major-version "bundler" "\
Returns the bundler major version. If no version is available it returns nil.")
(autoload 'bundle-show "bundler" "\
Shows all gems that are part of the bundle, or the path to a given gem." t)
(autoload 'bundle-version "bundler" "\
Prints version information." t)
(register-definition-prefixes "bundler" '("bundle-" "run-bundled-command"))

;;; End of scraped data

(provide 'bundler-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; bundler-autoloads.el ends here