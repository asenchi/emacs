;; My customizations

(add-to-list 'load-path "~/.emacs.d/asenchi")
(load "functions")
(load "keys")
(load "lisp")
(load "modes")

;; require
(require 'cl)
(require 'paredit)
(require 'erc)
(require 'arduino)

;(require 'textmate)
;(textmate-mode)
