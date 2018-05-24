;; -------------------------------------- ;;
;;               MELPA config             ;;
;; -------------------------------------- ;;

(require 'package)

;; Comment/uncomment these two lines to enable/disable
;; MELPA and MELPA Stable as desired
(add-to-list 'package-archives (cons "melpa" "http://melpa.milkbox.net/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; For important compatibility libraries like cl-lib
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/"))))
(package-initialize)

;; Use icicles for autocompletion on the minibuffer
(add-to-list 'load-path "/home/victor/.icicles")
(require 'icicles)
(icy-mode 1)


;; --------------------------------------- ;;
;;              Neotree config             ;;
;; --------------------------------------- ;;

;; Add Neotree to load-path
(add-to-list 'load-path "/home/victor/.neotree")
(require 'neotree)

;; Set a custom key-binding
(global-set-key (kbd "<f8>") 'neotree-toggle)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(neo-show-hidden-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ----------------------------------------------- ;;
;;             Set cutom keybindings               ;;
;; _______________________________________________ ;;

;; import-js keybinding
(global-set-key (kbd "<f4>") 'import-js-goto)
(define-prefix-command 'my-keymap)
(global-set-key (kbd "C-c a") 'my-keymap)
(define-key my-keymap (kbd "C-c i") 'import-js-import)

;; query regexp
(global-set-key (kbd "M-#") 'query-replace-regexp)

;; bindings for visual-regexp-steroids
(require 'visual-regexp-steroids)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
(define-key esc-map (kbd "C-r") 'vr/isearch-backward) ;; C-M-r
(define-key esc-map (kbd "C-s") 'vr/isearch-forward) ;; C-M-s

;; ----------------------------------------------- ;;
;;                Set default values               ;;
;; _______________________________________________ ;;

;; Set auto-complete on all buffers
(require 'auto-complete)
(global-auto-complete-mode t)

;; Get Neotree to show hidden files
(setq-default neo-show-hidden-files t)

;; Move Emacs backup iles to another directory
(setq backup-directory-alist '(("." . "~/.emacs-saves")))

;; Allow nxml to modify elements
(setq nxml-sexp-element-mode t)

;; Set rjsx indent to 2 s
(setq sgml-basic-offset 2)

;; Get js2-mode and rjsx-mode to ignore missing semi-colons
(setq js2-strict-missing-semi-warning nil)

;; ------------------------------------------------ ;;
;;    Set default modes for different file types    ;;
;; ------------------------------------------------ ;;
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

;; ------------------------------------------------ ;;
;;         Set custom hooks for cetain modes        ;;
;; ------------------------------------------------ ;;

;; Indent JS files with spaces instead of tabs
(defun my-js-mode-hook ()
  "Custom `js-mode' behaviours."
  (setq indent-tabs-mode nil))
(add-hook 'js-mode-hook 'my-js-mode-hook)

;; Use correct emmet expansion in JSX mode
(defun jsx-emmet-hook ()
  "Custom `rjsx-mode' emmet hook."
  (setq emmet-expand-jsx-className? t))
(add-hook 'rjsx-mode-hook 'jsx-emmet-hook)

;; Use nxml-mode with HTML
(add-hook 'rjsx-mode 'nxml-mode)
(add-hook 'web-mode 'nxml-mode)

;; Change the sel-cloding tag style
(add-hook 'rjsx-mode-hook (lambda () (setq emmet-self-closing-tag-style " /"))) 

;; Set js indent level
(defun js-indent-level ()
  "Custom `js-indent-level' when in rjsx-mode"
  ;; Set JS and JSX indent level
  (setq js-indent-level 2))
(add-hook 'rjsx-mode-hook 'js-indent-level)

;; Set web-mode indentation to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Enable Rainbow mode on css.
(add-hook 'scss-mode-hook  'rainbow-mode)

;; Enable Rainbow mode on JS and JSX.
(add-hook 'rjsx-mode-hook  'rainbow-mode)

;; ---------------------------------------------- ;;
;;    Set indent level for different file types   ;;
;; ---------------------------------------------- ;;

;; Set CSS and SCSS indent level
(setq css-indent-offset 2)
(setq scss-indent-offset 2)

;; Set JS and JSX indent level
(setq js-indent-level 2)
(setq jsx-indent-level 2)

;; indent c++ with 2 spaces
(setq-default c-basic-offset 2)

(put 'upcase-region 'disabled nil)

;; Set keybindings
(global-set-key (kbd "C-x =") 'enlarge-window)
(global-set-key (kbd "C-x -") 'shrink-window)

;; Enable line numbers on all files opened
(add-hook 'find-file-hook 'linum-mode)

;; Set ace-window key-binding
(global-set-key (kbd "M-q") 'ace-window)


;; --------------------------------------------- ;;
;;          Manage Minor Modes config            ;;
;; --------------------------------------------- ;;

;; manage-minor-modes config
(require 'manage-minor-mode)
(setq manage-minor-mode-default
      '((global
	 (on multiple-cursors)
	 (on rainbow-delimiters-mode))
	(emacs-lisp-mode
	 (on   rainbow-delimiters-mode eldoc-mode show-paren-mode))
	(js2-mode
	 (on   color-identifiers-mode)
	 (off  flycheck-mode))
	(web-mode
	 (on rainbow-mode)
	 (on emmet-mode))
	(scss-mode
	 (on emmet-mode)
	 (on rainbow-mode)
	 (on rainbow-delimiters-mode)
	 (on multiple-cursors))
	(rjsx-mode
	 (on emmet-mode)
	 (on auto-complete-mode)
	 (on rainbow-delimiters-mode))))

;; multiple-cursors config
(require 'multiple-cursors)
(global-set-key (kbd "M-.") 'mc/mark-next-like-this)
(global-set-key (kbd "M-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c M-.") 'mc/mark-all-like-this)

;; dashboard config
;; (require 'dashboard)
;; (dashboard-setup-startup-hook)

;; web-beautify hooks
(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'web-mode
  '(define-key web-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
    '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

;; ----------------------------------------------------------- ;;
;;                         CEDET config                        ;;
;; ----------------------------------------------------------- ;;
(load-file "~/.emacs.d/cedet/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion
(global-srecode-minor-mode 1)            ; Enable template insertion menu
;; (semantic-mode 1)			 ; Enable semantic mode
