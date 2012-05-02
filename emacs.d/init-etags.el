(require 'etags)

; cjm 2009.04.21 etags-table and etags-select
; http://www.emacswiki.org/emacs/etags-table.el
; http://www.emacswiki.org/emacs/etags-select.el
(require 'etags-table)
(require 'etags-select)

(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)
(global-set-key (kbd "C-;") 'dabbrev-expand)

(provide 'init-etags)
