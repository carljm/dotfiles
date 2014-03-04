(defun cjm-python-mode-hook ()
  (column-marker-1 80)
  (ropemacs-mode)
  (define-key python-mode-map "" (quote newline-and-indent)))

; requires pyflakes
;  sudo apt-get install pyflakes
(require 'flymake)
(require 'flymake-cursor)
(defun flymake-create-temp-intemp (file-name prefix)
  "Return file name in temporary directory for checking FILE-NAME.
This is a replacement for 'flymake-create-temp-inplace'. The
difference is that it gives a file name in
'temporary-file-directory' instead of the same directory as
FILE-NAME.

For the use of PREFIX see that function.

Note that not making the temporary file in another directory
\(like here) will not if the file you are checking depends on
relative paths to other files \(for the type of checks flymake
makes)."
  (unless (stringp file-name)
    (error "Invalid file-name"))
  (or prefix
      (setq prefix "flymake"))
  (let* ((name (concat
                (file-name-nondirectory
                 (file-name-sans-extension file-name))
                "_" prefix))
         (ext  (concat "." (file-name-extension file-name)))
         (temp-name (file-truename (make-temp-file name nil ext)))
         )
    (flymake-log 3 "create-temp-intemp: file=%s temp=%s" file-name temp-name)
    temp-name))
(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-intemp))
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
