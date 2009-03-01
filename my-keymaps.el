;;-----------------------------------------------------------
;; key map stuff
;;-----------------------------------------------------------

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key [f5] 'call-last-kbd-macro)

;;goto line would be nice...
(global-set-key "\C-xg" 'goto-line)
(global-set-key "\C-x\C-g" 'goto-line)


(define-key global-map "\C-co" 'ff-find-related-file)
(define-key global-map "\C-cp" 'ffap)

;; C-. switches to other buffer -same as C-x o
(global-set-key [(control \.)] 'other-window)


;; Set up mouse wheel
(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)

(provide 'my-keymaps)