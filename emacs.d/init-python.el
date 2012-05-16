(defun cjm-python-mode-hook ()
  (column-marker-1 80)
  (ropemacs-mode)
  (define-key python-mode-map "" (quote newline-and-indent)))

; requires pyflakes
;  sudo apt-get install pyflakes
(require 'flymake)
(require 'flymake-cursor)
(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "pyflakes" (list local-file))))

(add-hook 'find-file-hook 'flymake-find-file-hook)

; requires pymacs, rope, ropemode, ropemacs
;  sudo apt-get install pymacs
;  sudo pip install rope ropemode https://bitbucket.org/agr/ropemacs/get/7e2e181c94df.tar.bz2
(defun load-rope ()
  (require 'pymacs)
  (setq ropemacs-enable-shortcuts nil)
  (setq ropemacs-local-prefix "C-c C-p")
  (pymacs-load "ropemacs" "rope-"))

(provide 'init-python)
