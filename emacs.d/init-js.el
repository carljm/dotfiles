(add-to-list 'load-path "~/dot/emacs.d/jshint-mode")
(require 'flymake-jshint)
(add-hook 'javascript-mode-hook
          (lambda () (flymake-mode t)))

(provide 'init-js)
