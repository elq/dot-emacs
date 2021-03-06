;;-----------------------------------------------------------
;;javascript
;;-----------------------------------------------------------

(require 'javascript-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . javascript-mode))

(if (condition-case nil
        (symbol-function 'c-block-in-arglist-dwim)
      (error nil))
    (defun javascript-fixed-c-lineup-arglist (langelem)
      (save-excursion
        (if (c-block-in-arglist-dwim (c-langelem-2nd-pos c-syntactic-element))
            0
	    (c-lineup-arglist langelem))))
    (defun javascript-fixed-c-lineup-arglist (langelem)
      (c-lineup-arglist langelem)))


;; Ugghh....  So much trouble w/ what cc-mode allows to control or not.  Ended
;; up pulling everything in to try to get indentation correct, only to discover
;; that cc-mode does not currently allow the style I want.  Good thing I don't
;; have to do much Javascript programming ATM.

;; Setup a new "C" style to support this Javascript maddness
(c-add-style
 "javascript"
 ;; Expand all tabs with appropriate number of spaces
 '((indent-tabs-mode         . nil)
   (tab-width                . 4)
   (c-basic-offset           . 4)
   (fill-column              . 79)
   (c-ignore-auto-fill       . '(string cpp))
   ;; Most of this isn't necessary, but I don't feel like cleaning it
   (c-hanging-braces-alist   . ((defun-open after)
                                (defun-close  before after)
                                (defun-block-intro after)
                                (brace-list-intro after)
                                (brace-entry-open after)
                                (statement-cont after)
                                (statement-block-open after)
                                (statement-block-intro after)
                                (statement-case-open after)
                                (extern-lang-open after)
                                (namespace-open after)
                                (module-open after)
                                (composition-open after)
                                (inexpr-class-open after)
                                (inexpr-class-close before after)
                                (class-open        after)
                                (class-close       before after)
                                (brace-list-open   after)
                                (brace-list-close  before after)
                                (inline-open       after)
                                (inline-close      before after)
                                (brace-entry-open  after)
                                (substatement-open after)
                                (brace-entry-open  after)
                                (block-open        after)
                                (block-close       . c-snug-do-while)
                                (else-clause       after)
                                (arglist-cont-nonempty after)
                                (arglist-open after)))
   (c-offsets-alist          . ((inexpr-class . 0)
                                (inexpr-statement . 0)
                                (lambda-intro-cont . 0)
                                (inlambda . 0)
                                (template-args-cont c-lineup-template-args 0)
                                (incomposition . 0)
                                (inmodule . 0)
                                (innamespace . 0)
                                (inextern-lang . 0)
                                (composition-close . 0)
                                (module-close . 0)
                                (namespace-close . 0)
                                (extern-lang-close . 0)
                                (composition-open . 0)
                                (module-open . 0)
                                (namespace-open . 0)
                                (extern-lang-open . 0)
                                (objc-method-call-cont
                                 . c-lineup-ObjC-method-call)
                                (objc-method-args-cont
                                 . c-lineup-ObjC-method-args)
                                (objc-method-intro . [0])
                                (friend . 0)
                                (cpp-define-intro c-lineup-cpp-define 0)
                                (cpp-macro-cont . 0)
                                (cpp-macro . [0])
                                (inclass . 0)
                                (stream-op . c-lineup-streamop)
                                (arglist-cont-nonempty
                                 . javascript-fixed-c-lineup-arglist)
                                (arglist-cont . 0)
                                (comment-intro
                                 c-lineup-knr-region-comment
                                 c-lineup-comment)
                                (catch-clause . 0)
                                (else-clause . 0)
                                (do-while-closure . 0)
                                (access-label . -)
                                (case-label . 0)
                                (substatement . 0)
                                (statement-case-intro . 0)
                                (statement . 0)
                                (brace-entry-open . 0)
                                (brace-list-entry . 0)
                                (brace-list-intro . +)
                                (brace-list-close . 0)
                                (block-close . 0)
                                (block-open . 0)
                                (inher-cont . 0)
                                (inher-intro . 0)
                                (member-init-cont
                                 . c-lineup-multi-inher)
                                (member-init-intro . 0)
                                (topmost-intro-cont . 0)
                                (topmost-intro . 0)
                                (knr-argdecl . 0)
                                (func-decl-cont . 0)
                                (inline-close . 0)
                                (class-close . 0)
                                (class-open . 0)
                                (defun-block-intro . +)
                                (defun-close . 0)
                                (defun-open . 0)
                                (c . c-lineup-C-comments)
                                (string . c-lineup-dont-change)
                                (brace-list-open . 0)
                                (inline-open . 0)
                                (arglist-close . 0)
                                (arglist-intro . 0)
                                (statement-cont . 0)
                                (statement-case-open . 0)
                                (label . +)
                                (substatement-label . 2)
                                (substatement-open . 0)
                                (knr-argdecl-intro . 0)
                                (statement-block-intro . +)))))



(provide 'my-javascript)