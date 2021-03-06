;;; semantic-adebug-eieio.el --- EIEIO extensions to adebug

;; Copyright (C) 2007 Eric M. Ludlam

;; Author: Eric M. Ludlam <eric@siege-engine.com>
;; X-RCS: $Id$

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; Extensions to semantic Adebug for EIEIO objects.
;;

;;;###autoload
(defun semantic-adebug-insert-object-fields (object prefix)
  "Insert all the fields of OBJECT.
PREFIX specifies what to insert at the start of each line."
  (let ((attrprefix (concat (make-string (length prefix) ? ) "] "))
	)
    (semantic-adebug/eieio-insert-fields object attrprefix)
    )
  )

(defun semantic-adebug-insert-object-fields-from-point (point)
  "Insert the object fields found at the object button at POINT."
  (let ((object (get-text-property point 'adebug))
	(indent (get-text-property point 'adebug-indent))
	start end
	)
    (end-of-line)
    (setq start (point))
    (forward-char 1)
    (semantic-adebug-insert-object-fields object
					  (concat (make-string indent ? )
						  "~ "))
    (setq end (point))
    (goto-char start)
    ))

;;;###autoload
(defun semantic-adebug-insert-object-button (object prefix prebuttontext)
  "Insert a button representing OBJECT.
PREFIX is the text that preceeds the button.
PREBUTTONTEXT is some text between PREFIX and the object button."
  (let ((start (point))
	(end nil)
	(str (object-name object))
	(tip (format "Object %s\nClass: %S\nParent(s): %S\n%d slots"
		     (object-name-string object)
		     (object-class object)
		     (class-parents (object-class object))
		     (length (object-slots object))
		     ))
	)
    (insert prefix prebuttontext str)
    (setq end (point))
    (put-text-property (- end (length str)) end 'face 'font-lock-keyword-face)
    (put-text-property start end 'adebug object)
    (put-text-property start end 'adebug-indent(length prefix))
    (put-text-property start end 'adebug-prefix prefix)
    (put-text-property start end 'help-echo tip)
    (put-text-property start end 'adebug-function
		       'semantic-adebug-insert-object-fields-from-point)
    (insert "\n")
    )
  )

;;; METHODS
;;
;; Each object should have an opportunity to show stuff about itself.

(defmethod semantic-adebug/eieio-insert-fields ((obj eieio-default-superclass)
						prefix)
  "Insert the fields of OBJ into the current ADEBUG buffer."
  (semantic-adebug-insert-thing (object-name-string obj)
				prefix
				"Name: ")
  (let* ((cl (object-class obj))
	 (cv (class-v cl)))
    (semantic-adebug-insert-thing (class-constructor cl)
				  prefix
				  "Class: ")
    ;; Loop over all the public slots
    (let ((publa (aref cv class-public-a))
	  (publd (aref cv class-public-d))
	  )
      (while publa
	(if (slot-boundp obj (car publa))
	    (let ((i (class-slot-initarg cl (car publa)))
		  (v (eieio-oref obj (car publa))))
	      (semantic-adebug-insert-thing
	       v prefix (concat 
			 (if i (symbol-name i)
			   (symbol-name (car publa)))
			 " ")))
	  ;; Unbound case
	  (let ((i (class-slot-initarg cl (car publa))))
	    (semantic-adebug-insert-thing
	     "#unbound" prefix
	     (concat (if i (symbol-name i)
		       (symbol-name (car publa)))
		     " ")))
	  )
	(setq publa (cdr publa) publd (cdr publd)))
      )))

;;; DEBUG METHODS
;;
;; A generic function to run ADEBUG on an object and popup a new buffer.
;;
;;;###autoload
(defmethod semantic-adebug-show ((obj eieio-default-superclass))
  "Run adebug against any EIEIO object OBJ"
  (let ((ab (semantic-adebug-new-buffer 
	     (format "*%s ADEBUG*" (object-name obj)))))
    (semantic-adebug-insert-object-fields obj "]"))
  )

;;; Code:

(provide 'semantic-adebug-eieio)

;;; semantic-adebug-eieio.el ends here
