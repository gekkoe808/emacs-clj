;; env PATH
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
      (setenv "PATH" path-from-shell)
          (setq exec-path (split-string path-from-shell path-separator))))

;; Uncomment the lines below by removing semicolons and play with the
;; values in order to set the width (in characters wide) and height
;; (in lines high) Emacs will have whenever you start it

(setq initial-frame-alist '((top . 0) (left . 0) (width . 187) (height . 60)))


;; Place downloaded elisp files in this directory. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/.emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
;; 
;; Adding this code will make Emacs enter yaml mode whenever you open
;; a .yml file
(add-to-list 'load-path "~/.emacs.d/vendor")

;; TODO: Not sure that the next line is needed.
(add-to-list 'load-path "~/.emacs.d/elpa")

;; get rid of need to type out whole "yes" or "no" words
(defalias 'yes-or-no-p 'y-or-n-p) 

;; vi mode for great justice
(evil-mode 1)

; Without this next line, evil likes to lock your cursor color to black. Kinda evil of it.
(setq evil-default-cursor t)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; There's no place like...
(setq default-directory "~/")

;; Auto-indent when in lisp mode
(add-hook 'prog-mode-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")

(set-face-attribute 'default nil :height 160) ; set font size to 16 points

(load-theme 'tomorrow-night-bright t)

;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

(load "~/.emacs.d/vendor/clojure")

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

(setq ido-use-filename-at-point nil)

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.saves")))

;; Set up some standard org-mode shortcuts
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Map jk to escape in Evil's insert mode.
(define-key evil-insert-state-map "k" #'cofi/maybe-exit)
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "k")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?j))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

(global-linum-mode 1) ; show me some line nums pl0x

;; Adjust paredit to my evil ways
(add-to-list 'load-path "~/.emacs.d/elpa/evil-paredit-0.0.1")
(require 'evil-paredit)
(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)

; ido-mode too must know the joy of evil
(ido-mode t)
(define-key evil-ex-map "e " 'ido-find-file)
(define-key evil-ex-map "w " 'ido-write-file)
(define-key evil-ex-map "b " 'ido-switch-buffer)

; Yeah, I'm lazy...
(menu-bar-mode t)

;; setup load-path and autoloads
(add-to-list 'load-path "~/.emacs.d/slime")
(require 'slime-autoloads)

;; Set your lisp system and, optionally, some contribs
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))
;(slime-setup '(slime-fancy))

