(add-to-list 'load-path "~/dot/emacs.d/jinja2-mode")
(require 'jinja2-mode)
(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . jinja2-mode))
(add-to-list 'auto-mode-alist '("\\.j2\\'" . jinja2-mode))

(provide 'init-jinja)
