; Rogelio Zaid Sariñana Hdez A01620778

#lang racket

(require "./trabajador.rkt")

(define pl (dynamic-place "./Tokenizador_Paralelo/trabajador.rkt" 'principal))
(define p2 (dynamic-place "./Tokenizador_Paralelo/trabajador.rkt" 'principal))

(define tiempo-inicial (current-inexact-monotonic-milliseconds))
(place-channel-put pl 1)
(place-channel-put p2 2)

(+(place-channel-get pl)
(place-channel-get p2)
 )

(define tiempo-final(current-inexact-monotonic-milliseconds))
(- tiempo-final tiempo-inicial)
