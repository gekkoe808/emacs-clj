(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load "~/.emacs.d/user.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector 
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(erc-autojoin-channels-alist (quote (("freenode.net" "#omgwtfbfitirc"))))
 '(erc-nick "gekkoe")
 '(ns-alternate-modifier (quote super))
 '(ns-command-modifier (quote meta))
 '(org-agenda-files (quote ("~/task-log.org")))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 '(rainbow-delimiters-depth-2-face ((t (:foreground "dark cyan"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "light green"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "MediumPurple2"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow3"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "cyan"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "orange4")))))
