;; 
;;
;; WXME Converter
;; ----------------------------------
;; This program converts a WXME file into plain text
;; so that it can be processed by RST and be read
;; by human markers. The output is printed to the screen.
;;
;; Run this program from the terminal:
;; $ racket wxme_converter.rkt file-to-convert.rkt
;;
;; Information about the WXME format is here:
;;
;;    http://docs.racket-lang.org/gui/editor-overview.html?q=comment%20boxes#%28part._editorfileformat%29
;;    http://docs.racket-lang.org/gui/WXME_Decoding.html
;;
;; Last Revised by: Yi Cheng "Nick" Lee - yc2lee
;;                  on December 23, 2011
;;

#lang racket
(require wxme)
(require wxme/image)


;; displays one thing
(define (display-one-thing datum)
  (cond
    [(is-a? datum image%) (printf "\"Image removed by tutor.\"")]
    [(special-comment? datum)
     (printf " #| ")
     (print (send (special-comment-value datum) get-content-port))
     (printf " |# ")]
    [else (display datum)]))

;; prints source to standard output
(define (print source)
  (define ch (read-char-or-special source))
  (cond
    [(eof-object? ch) (void)]
    [else (display-one-thing ch)
          (print source)]))


;;
;; --------- START ------------------------
;;

;; check if user supplied one argument
(define args (current-command-line-arguments))
(cond
  [(not (= 1 (vector-length args)))
   (printf "To use this program, run it from the terminal:\n")
   (printf "$ wxme_converter file-to-convert.rkt\n")
   (exit 0)])

(define filename (vector-ref args 0))
(define src-handle (open-input-file filename))

;; Check if the file is in WXME.
;; If YES, convert it to plain-text and print to stdout.
;; If NO, print file and quit.
(cond
  [(is-wxme-stream? src-handle)
   (define plain-text (wxme-port->port src-handle))
   (print plain-text)
   (close-input-port plain-text)]
  [else
   (system (format "cat ~a" filename))
   (void)])

(close-input-port src-handle)

(newline) (newline)