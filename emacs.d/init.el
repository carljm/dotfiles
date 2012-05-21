(add-to-list 'load-path "~/.emacs.d" load-path)

(require 'init-etags)
(require 'init-python)
(require 'init-django)

(require 'column-marker)
(autoload 'revbufs "revbufs" "Revert all buffers" t)

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

; from http://www.emacswiki.org/emacs/CopyAndPaste
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

(ido-mode)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "firefox")
 '(default-frame-alist (quote ((menu-bar-lines . 1) (tool-bar-lines . 0))))
 '(etags-table-search-up-depth 10)
 '(fill-column 79)
 '(flymake-allowed-file-name-masks (quote (("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init) ("\\.xml\\'" flymake-xml-init) ("\\.cs\\'" flymake-simple-make-init) ("\\.py\\'" flymake-pyflakes-init) ("\\.p[ml]\\'" flymake-perl-init) ("\\.php[345]?\\'" flymake-php-init) ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup) ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup))))
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(python-mode-hook (quote (imenu-add-menubar-index cjm-python-mode-hook)))
 '(require-final-newline (quote visit-save))
 '(same-window-buffer-names (quote ("*shell*" "*mail*" "*inferior-lisp*" "*ielm*" "*scheme*" "*Org Agenda*" "*Agenda Commands*")))
 '(sgml-basic-offset 2)
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tags-add-tables nil)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


(when (require 'color-theme nil 'noerror)
  (when (require 'color-theme-solarized nil 'noerror)
    (color-theme-solarized-dark)))
