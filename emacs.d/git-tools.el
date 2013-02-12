;; Copyright (c) 2012 Carl J Meyer
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
;; LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
;; OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
;; WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;; This code is based on bzr-tools.el
;; Copyright (c) 2008-2009 Jonathan Lange, Matthew Lefkowitz

(provide 'git-tools)

(defconst git-tools-grep-command
  "git grep --no-color -I -p -n -e %s | cat"
  "The command used for grepping files using git. See `git-tools-grep'.")

;; Run 'code' at the root of the repo which dirname is in.
(defmacro git-tools-at-branch-root (dirname &rest code)
  `(let ((default-directory (locate-dominating-file (expand-file-name ,dirname) ".git"))) ,@code))


(defun git-tools-grep (expression dirname)
  "Search a branch for `expression'. If there's a C-u prefix, prompt for `dirname'."
  (interactive
   (let* ((string (read-string "Search for: "))
          (dir (if (null current-prefix-arg)
                   default-directory
                 (read-directory-name (format "Search for %s in: " string)))))
     (list string dir)))
  (let ((grep-use-null-device nil))
    (git-tools-at-branch-root dirname
      (grep (format git-tools-grep-command (shell-quote-argument expression))))))
