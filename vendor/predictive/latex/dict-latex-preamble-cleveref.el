(provide 'dict-latex-preamble-cleveref)
(require 'dict-tree)
(defvar dict-latex-preamble-cleveref nil "Dictionary dict-latex-preamble-cleveref.")
(setq dict-latex-preamble-cleveref '(DICT "dict-latex-preamble-cleveref" nil t nil nil (TSTREE [nil [nil [nil [nil [nil [nil [[[nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] nil 102] [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] nil 102] nil 105] nil 116] nil 108] nil 117] nil 109] [nil [nil [nil [nil [[nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] nil 102] [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] nil 102] nil 105] nil 116] nil 108] nil 117] nil 109] nil 101] nil 103] nil 110] nil 97] nil 114] nil 102] nil 101] nil 114] [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] nil 102] nil 105] nil 116] nil 108] nil 117] [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil [nil (0) nil nil] nil 116] nil 97] nil 109] nil 114] nil 111] nil 102] nil 105] nil 116] nil 108] nil 117] nil 109] 102] nil 101] nil 103] nil 110] nil 97] nil 114] 109] 102] nil 102] nil 101] nil 114] nil 99] 67] nil 92] nil t] (lambda (a b) (cond ((and (null a) (null b)) 0) ((null a) -1) ((null b) 1) (t (- a b)))) (lambda (new cell) (if (null cell) (dictree--wrap-data (funcall (lambda (weight data) (cond ((not (or weight data)) 0) ((null weight) (1+ data)) ((null data) weight) (t (+ weight data)))) new nil)) (dictree--set-data cell (funcall (lambda (weight data) (cond ((not (or weight data)) 0) ((null weight) (1+ data)) ((null data) weight) (t (+ weight data)))) new (dictree--get-data cell))) cell)) lambda (a b) (funcall (lambda (a b) (if (= (cdr a) (cdr b)) (if (= (length (car a)) (length (car b))) (string< (car a) (car b)) (< (length (car a)) (length (car b)))) (> (cdr a) (cdr b)))) (cons (car a) (dictree--get-data (cdr a))) (cons (car b) (dictree--get-data (cdr b))))) (lambda (new cell) (if (null cell) (dictree--wrap-data (funcall (lambda (weight data) (cond ((not (or weight data)) 0) ((null weight) (1+ data)) ((null data) weight) (t (+ weight data)))) new nil)) (dictree--set-data cell (funcall (lambda (weight data) (cond ((not (or weight data)) 0) ((null weight) (1+ data)) ((null data) weight) (t (+ weight data)))) new (dictree--get-data cell))) cell)) (lambda (a b) (funcall (lambda (a b) (if (= (cdr a) (cdr b)) (if (= (length (car a)) (length (car b))) (string< (car a) (car b)) (< (length (car a)) (length (car b)))) (> (cdr a) (cdr b)))) (cons (car a) (dictree--get-data (cdr a))) (cons (car b) (dictree--get-data (cdr b))))) nil nil nil nil nil 0.1))
(let ((ordered-hash (make-hash-table :test 'equal))
      (tstree (dictree--tstree dict-latex-preamble-cleveref)))
  (mapc
   (lambda (entry)
     (puthash
      (car entry)
      (dictree--cache-create
       (mapcar
        (lambda (key)
          (cons key (tstree-member tstree key)))
        (dictree--cache-completions (cdr entry)))
       (dictree--cache-maxnum (cdr entry)))
      ordered-hash))
   (dictree--ordered-hash dict-latex-preamble-cleveref))
  (dictree--set-ordered-hash dict-latex-preamble-cleveref ordered-hash))
(dictree--set-filename dict-latex-preamble-cleveref (locate-library "dict-latex-preamble-cleveref"))
(unless (memq dict-latex-preamble-cleveref dictree-loaded-list) (push dict-latex-preamble-cleveref dictree-loaded-list))
