; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл
include \masm32\include\masm32rt.inc
include \masm32\fpulib\Fpu.inc
includelib \masm32\fpulib\fpu.lib
; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл


.data
    fio DB "╤ЄхЇрэхэъю ╚трэ ╠шїрщыютшў"
    xa real8 0.0 ; a
    xb real8 0.0 ; b
    xc real8 0.0 ; c
    tmp1 real8 4.0 ; яюёЄю ээ√щ ьэюцшЄхы№ фы  фхёъЁшьшэрэЄр
    tmp2 real8 2.0 ; яюёЄю ээ√щ фхышЄхы№ фы  ъюЁэхщ
    Descriminant DD ?
    dsp DD ? ; фы  юўшёЄъш ёЄхър fpu
    tmp db 8 dup(?) ; т√тюф Ёхчєы№ЄрЄр
.code

start:
    call main
    exit
    
main proc
    fn MessageBox,0,offset fio,"╘╚╬",MB_OK
    fld xa
    fstp dsp
    cmp dsp, 0
        je equal
        jne sqrt

main endp

equal:
    call MoreSqrt
    jmp over
    
sqrt:
    call MathDescriminant
    call MathSquare
    exit
    
MoreSqrt proc
    fld xb
    fstp dsp
    cmp dsp,0
        je cmpC
        jne one_root
MoreSqrt endp

cmpC:
    fld xc
    fstp dsp
    cmp dsp,0
    je More_root
    jne none_sqr_root
    jmp over
    
MathDescriminant proc
    fld xb
    fmul xb
    fld tmp1
    fmul xa
    fmul xc
    fsub st(1), st(0)
    fstp dsp
MathDescriminant endp

MathSquare proc
    fst Descriminant
    cmp Descriminant,0
        jg two_sqr_roots
        je one_sqr_root
        jl none_sqr_root
    jmp over
MathSquare endp

More_root:
    fn MessageBox,0,"┴хёъюэхўэю ьэюую ъюЁэхщ","╬ЄтхЄ",MB_OK
    jmp over
    
one_root:
    fld xb
    fld xc
    fchs ; st(0) = -st(0)
    fdiv st(1),st(0)
    fstp dsp
    invoke FpuFLtoA, 0, 3, offset tmp, SRC1_FPU
    fn MessageBox,0,offset tmp,"юЄтхЄ",MB_OK
    jmp over
    
none_sqr_root:
    fn MessageBox,0,"╩юЁэхщ эхЄ","юЄтхЄ",MB_OK
    jmp over

two_sqr_roots:
    fsqrt
    fld tmp2
    fmul xa
    fld xb
    fchs
    fsub st(0), st(2)
    fdiv st(0), st(2)
    invoke FpuFLtoA, 0, 3, offset tmp, SRC1_FPU
    fn MessageBox,0,offset tmp,"─тр ъюЁэ ",MB_OK
    fstp dsp
    fstp dsp
    fld Descriminant
    fsqrt
    fld tmp2
    fmul xa
    fld xb
    fchs
    fadd st(2), st(0)
    fstp dsp
    fdiv st(1), st(0)
    fstp dsp
    invoke FpuFLtoA, 0, 3, offset tmp, SRC1_FPU
    fn MessageBox,0,offset tmp,"─тр ъюЁэ ",MB_OK
    jmp over
one_sqr_root:
    fld Descriminant
    fsqrt
    fld tmp2
    fmul xa
    fld xb
    fchs
    fadd st(2), st(0)
    fstp dsp
    fdiv st(1), st(0)
    fstp dsp
    invoke FpuFLtoA, 0, 3, offset tmp, SRC1_FPU
    fn MessageBox,0,offset tmp,"╬фшэ ъюЁхэ№",MB_OK
    jmp over
over:
    invoke ExitProcess,0
end start