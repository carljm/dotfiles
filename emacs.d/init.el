(add-to-list 'load-path "~/.emacs.d" load-path)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq create-lockfiles nil)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar required-packages
  '(flycheck solarized-theme jinja2-mode markdown-mode etags-table multi-term)
  "Packages which should be installed upon launch")

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'solarized-dark t)

(require 'init-etags)
(require 'init-django)
(require 'init-jinja)
(require 'init-git)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(global-set-key [f9] 'multi-term)

(autoload 'revbufs "revbufs" "Revert all buffers" t)

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

; from http://www.emacswiki.org/emacs/CopyAndPaste
(global-set-key "\C-x\C-k" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

; from https://sites.google.com/site/steveyegge2/effective-emacs
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-m" 'execute-extended-command)

(ido-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "firefox")
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(default-frame-alist (quote ((menu-bar-lines . 1))))
 '(etags-table-search-up-depth 10)
 '(fill-column 79)
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js-mode-hook (quote (flycheck-mode)) t)
 '(python-mode-hook (quote (imenu-add-menubar-index flycheck-mode)) t)
 '(require-final-newline (quote visit-save))
 '(same-window-buffer-names (quote ("*shell*" "*mail*" "*inferior-lisp*" "*ielm*" "*scheme*" "*Org Agenda*" "*Agenda Commands*")))
 '(sgml-basic-offset 2)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tags-add-tables nil)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
