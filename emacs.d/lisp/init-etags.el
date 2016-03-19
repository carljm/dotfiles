(require 'etags)

; http://www.emacswiki.org/emacs/etags-select.el
(require 'etags-table)
(require 'etags-select)

(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)
(global-set-key (kbd "C-;") 'dabbrev-expand)

(provide 'init-etags)
