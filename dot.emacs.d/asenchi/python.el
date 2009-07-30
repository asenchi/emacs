(require 'doctest-mode)
(require 'pycomplete)
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")

(setq interpreter-mode-alist(cons '("python" . python-mode)
                                  interpreter-mode-alist))
(setq python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-python-command "/usr/local/bin/python2.5")
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'py-smart-indentation nil)
                    (set-variable 'indent-tabs-mode nil))))