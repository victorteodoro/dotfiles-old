;;; jsonnet-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "jsonnet-mode" "jsonnet-mode.el" (23197 62401
;;;;;;  218568 290000))
;;; Generated autoloads from jsonnet-mode.el

(autoload 'jsonnet-mode "jsonnet-mode" "\
jsonnet-mode is a major mode for editing .jsonnet files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist (cons "\\.jsonnet\\'" 'jsonnet-mode))

(autoload 'jsonnet-eval-buffer "jsonnet-mode" "\
Run jsonnet with the path of the current file.

\(fn)" t nil)

(autoload 'jsonnet-jump-to-definition "jsonnet-mode" "\
Jump to the definition of the jsonnet function IDENTIFIER.

\(fn IDENTIFIER)" t nil)

(autoload 'jsonnet-jump "jsonnet-mode" "\
Jumps to the definition of the Jsonnet expression at POINT.

\(fn POINT)" t nil)

(autoload 'jsonnet-reformat-buffer "jsonnet-mode" "\
Reformat entire buffer using the Jsonnet format utility.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; jsonnet-mode-autoloads.el ends here
