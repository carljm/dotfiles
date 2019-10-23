(add-to-list 'load-path "~/.emacs.d/lisp" load-path)

; https://lists.gnu.org/archive/html/emacs-devel/2017-09/msg00211.html
(eval-after-load "enriched"
  '(defun enriched-decode-display-prop (start end &optional param)
     (list start end)))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar required-packages
  '(flycheck
    solarized-theme
    jinja2-mode
    markdown-mode
    multi-term
    muse
    scss-mode
    flymake-sass
    json-mode
    flymake-json
    cython-mode
    yaml-mode)
  "Packages which should be installed upon launch")

(dolist (p required-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'solarized-dark t)

(require 'init-etags)
(require 'init-django)
(require 'init-jinja)
(require 'init-git)

(require 'beancount)
(add-to-list 'auto-mode-alist '("\\.beancount\\'" . beancount-mode))

(require 'blacken)
(defvar blacken-executable "/usr/local/bin/black")

(require 'hack-mode)
(add-to-list 'auto-mode-alist '("\\.php$" . hack-mode))

(require 'muse-mode)
(require 'muse-wiki)

(setq muse-project-alist
      '(("dnd" ("~/org/dnd/2019.04.07" :default "TheNarrative"))))

(require 'scss-mode)
(defun cjm-scss-mode-hook()
  (flycheck-mode t))
(add-hook 'scss-mode-hook 'cjm-scss-mode-hook)

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.pyi$" . python-mode))

(require 'multi-term)
(setq multi-term-program "/bin/bash")
(global-set-key [f9] 'multi-term)

(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(autoload 'revbufs "revbufs" "Revert all buffers" t)

(add-to-list 'auto-mode-alist '("\\.md" . markdown-mode))

; from http://www.emacswiki.org/emacs/CopyAndPaste
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

(ido-mode)

(defun isort nil
  "Sort python imports"
  (interactive)
  (shell-command-on-region
   (point-min) (point-max)
   "isort -"
   nil t nil t))

(defun my-copy-simple (&optional beg end)
  "Save the current region (or line) to the `kill-ring' after stripping extra whitespace and new lines"
  (interactive
   (if (region-active-p)
       (list (region-beginning) (region-end))
     (list (line-beginning-position) (line-end-position))))
  (let ((my-text (buffer-substring-no-properties beg end)))
    (with-temp-buffer 
      (insert my-text)
      (goto-char 1)
      (while (looking-at "[ \t\n]")
        (delete-char 1))
      (let ((fill-column 9333999))
        (fill-region (point-min) (point-max)))
      (kill-region (point-min) (point-max)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "firefox")
 '(c-basic-offset 2)
 '(c-default-style
   (quote
    ((java-mode . "java")
     (awk-mode . "awk")
     (other . "1tbs"))))
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(default-frame-alist (quote ((menu-bar-lines . 1))))
 '(enable-remote-dir-locals t)
 '(etags-table-search-up-depth 10)
 '(fill-column 79)
 '(ido-enable-flex-matching t)
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js-mode-hook (quote (flycheck-mode)) t)
 '(package-selected-packages
   (quote
    (muse yaml-mode solarized-theme scss-mode multi-term markdown-mode json-mode jinja2-mode flymake-sass flymake-json flycheck cython-mode)))
 '(python-mode-hook (quote (imenu-add-menubar-index flycheck-mode)) t)
 '(require-final-newline (quote visit-save))
 '(safe-local-variable-values
   (quote
    ((flycheck-python-flake8-executable . "/home/carljm/.venvs/books/bin/flake8")
     (flycheck-python-flake8-executable . "/home/carljm/.venvs/MonkeyType-sRi3GbGp/bin/flake8")
     (flycheck-python-flake8-executable . "/home/carljm/.venvs/interview/bin/flake8")
     (flycheck-python-flake8-executable . "/home/carljm/.venvs/wonderclean/bin/flake8")
     (flycheck-python-flake8-executable . "/home/carljm/.venvs/django35/bin/flake8")
     (flycheck-python-flake8-executable . "/home/carljm/.venvs/lru/bin/flake8")
     (flycheck-python-flake8-executable . "/home/carljm/.venvs/distillery/bin/flake8")
     (flycheck-python-flake8-executable . "/home/carljm/.venvs/wonderment/bin/flake8"))))
 '(same-window-buffer-names
   (quote
    ("*shell*" "*mail*" "*inferior-lisp*" "*ielm*" "*scheme*" "*Org Agenda*" "*Agenda Commands*")))
 '(scss-compile-at-save nil)
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
