;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)


(use-package use-package-chords)
(use-package swiper)
;;(use-package multiple-cursors)
;;(use-package ryo-modal)
(use-package counsel)


;; (use-package ryo-modal
;;   :commands ryo-modal-mode
;;   :bind ("C-c SPC" . ryo-modal-mode)
;;   :config
;;   (ryo-modal-keys
;;    ("," ryo-modal-repeat)
;;    ("q" ryo-modal-mode)
;;    ("h" backward-char)
;;    ("j" next-line)
;;    ("k" previous-line)
;;    ("l" forward-char))
;; 
;;   (ryo-modal-keys
;;    ;; First argyment to ryo-modal-keys may be a list of keywords.
;;    ;; These keywords will be applied to all keybindings.
;;    (:norepeat t)
;;    ("0" "M-0")
;;    ("1" "M-1")
;;    ("2" "M-2")
;;    ("3" "M-3")
;;    ("4" "M-4")
;;    ("5" "M-5")
;;    ("6" "M-6")
;;    ("7" "M-7")
;;    ("8" "M-8")
;;    ("9" "M-9")))

;; https://github.com/jmorag/kakoune.el
(use-package kakoune
  :straight (kakoune :host github :repo "jmorag/kakoune.el")
  ;; fd to escape insert mode is something I picked up from trying Spacemacs and can't shake
  :chords ("fd" . ryo-enter)
  ;; Having a non-chord way to escape is important, since key-chords don't work in macros
  :bind ("C-c SPC" . ryo-modal-mode)
  :hook (after-init . my/kakoune-setup)
  :config
  (defun my/kakoune-setup ()
      "Call kakoune-setup-keybinds and then add some personal config."
      (kakoune-setup-keybinds)
      (setq ryo-modal-cursor-type 'box)
      ;;(add-hook 'prog-mode-hook #'ryo-enter)
      (define-key ryo-modal-mode-map (kbd "SPC h") 'help-command)
      ;; Access all C-x bindings easily
      (define-key ryo-modal-mode-map (kbd "z") ctl-x-map)
      (ryo-modal-keys
       ("," save-buffer)
       ("P" counsel-yank-pop)
       ("m" mc/mark-next-like-this)
       ("M" mc/skip-to-next-like-this)
       ("n" mc/mark-previous-like-this)
       ("N" mc/skip-to-previous-like-this)
       ("M-m" mc/edit-lines)
       ("*" mc/mark-all-like-this)
       ("v" er/expand-region)
       ("C-v" set-rectangular-region-anchor)
       ("M-s" mc/split-region)
       (";" (("q" delete-window)
             ("v" split-window-horizontally)
             ("s" split-window-vertically)))
       ("C-h" windmove-left)
       ("C-j" windmove-down)
       ("C-k" windmove-up)
       ("C-l" windmove-right)
       ("h" backward-char)
       ("j" next-line)
       ("k" previous-line)
       ("l" forward-char)
       ("C-u" scroll-down-command :first '(deactivate-mark))
       ("C-d" scroll-up-command :first '(deactivate-mark))))
    )


;;(use-package kakoune
;;  :straight (kakoune :host github :repo "jmorag/kakoune.el"))

;; This overrides the default mark-in-region with a prettier-looking one,
;; and provides a couple extra commands
(use-package visual-regexp
  :ryo
  ("s" vr/query-replace)
  ("?" vr/replace)
  ("M-/" vr/query-replace))

;; Emacs incremental search doesn't work with multiple cursors, but this fixes that
(use-package phi-search
  :bind (("C-s" . phi-search)
         ("C-r" . phi-search-backward)))

;; Probably the first thing you'd miss is undo and redo, which requires an extra package
;; to work like it does in kakoune (and almost every other editor).
(use-package undo-tree
  :config
  (global-undo-tree-mode)
  :ryo
  ("u" undo-tree-undo)
  ("U" undo-tree-redo)
  ("SPC u" undo-tree-visualize)
  :bind (:map undo-tree-visualizer-mode-map
              ("h" . undo-tree-visualize-switch-branch-left)
              ("j" . undo-tree-visualize-redo)
              ("k" . undo-tree-visualize-undo)
              ("l" . undo-tree-visualize-switch-branch-right)))

