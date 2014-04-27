(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized)))))

(set-face-attribute 'default nil :height 130)

(setq-default truncate-lines nil)



(setq dotfiles-dir (file-name-directory
                     (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)


(require 'starter-kit-bindings)


(add-to-list 'load-path (concat dotfiles-dir "/vendor/smooth-scroll"))
(require 'smooth-scroll)
(smooth-scroll-mode t)


(global-set-key (kbd "C-S-s") 'replace-string)
(global-set-key (kbd "C-S-n")  'scroll-up-1)
(global-set-key (kbd "C-S-p")    'scroll-down-1)


;; Add everything above this line

;; Если кажется, что нет чего-то привычного, расскомментируй эту строку
;; Но удали все, что ниже ее, оно скопировано из этого файла

;; (require 'starter-kit-misc)

(setq visible-bell t
      fringe-mode (cons 4 0)
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      shift-select-mode nil
      mouse-yank-at-point t
      require-final-newline t
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      ffap-machine-p-known 'reject
      whitespace-style '(trailing lines space-before-tab
                                  face indentation space-after-tab)
      ediff-window-setup-function 'ediff-setup-windows-plain
      xterm-mouse-mode t)

;; Save a list of recent files visited.
(recentf-mode 1)

;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point 'guess
        ido-max-prospects 10))

;; End of paste from starter-kit-misc. Do not add below this line
