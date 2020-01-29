;;; packages.el --- aaa-lispyville layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Anton Alekseev <anton [at] alekseev [dot] cc>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `aaa-lispyville-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `aaa-lispyville/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `aaa-lispyville/pre-init-PACKAGE' and/or
;;   `aaa-lispyville/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst aaa-lispyville-packages
  '(lispy
    lispyville)
  "The list of Lisp packages required by the aaa-lispyville layer.

Each entry is either:

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun aaa-lispyville/init-lispy ()
  "Lispy initialisation"
  (use-package lispy
    :defer t
    :init
    (progn
      (add-hook 'emacs-lisp-mode-hook 'lispy-mode)
      (add-hook 'common-lisp-mode-hook 'lispy-mode)
      (add-hook 'scheme-mode-hook 'lispy-mode)
      (add-hook 'lisp-mode-hook 'lispy-mode)
      (add-hook 'emacs-lisp-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'common-lisp-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'scheme-mode-hook #'turn-off-smartparens-mode)
      (add-hook 'lisp-mode-hook #'turn-off-smartparens-mode))
    :config
    (setq lispy-close-quotes-at-end-p t)))

(defun aaa-lispyville/init-lispyville ()
  "Lispyville initialisation"
  (use-package lispyville
    :defer t
    :init
    (add-hook 'lispy-mode-hook #'lispyville-mode)
    :config
    (progn
      (lispyville-set-key-theme '(operators
                                  s-operators
                                  slurp/barf-lispy
                                  additional
                                  (escape insert)
                                  (additional-movement normal)
                                  mark)))))
  
;;; packages.el ends here
