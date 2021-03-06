;;; packages.el --- Nim Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author: Max Gonzih
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq aaa-nim-packages
      '(
        flycheck
        flycheck-nim
        nim-mode
        ))

(defun aaa-nim/post-init-flycheck ()
  (spacemacs/enable-flycheck 'nim-mode))

(defun aaa-nim/init-flycheck-nim ()
  (use-package flycheck-nim
    :if (configuration-layer/package-used-p 'flycheck)))

(defun aaa-nim/init-nim-mode ()
  (use-package nim-mode
    :defer t
    :init
    (progn
      (add-to-list 'spacemacs-indent-sensitive-modes 'nim-mode))
    :config
    (progn
      (defun spacemacs/nim-compile-run ()
        "Compile current buffer file."
        (interactive)
        (shell-command (concat "nim compile --run " (buffer-file-name))))

      (spacemacs/declare-prefix-for-mode 'nim-mode "mc" "compile")
      (spacemacs/declare-prefix-for-mode 'nim-mode "mg" "goto")

      (spacemacs/set-leader-keys-for-major-mode 'nim-mode
        "cr" 'spacemacs/nim-compile-run
        "gb" 'pop-tag-mark))))
