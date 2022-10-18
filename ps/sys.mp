%% metapost for diagrams showing the setups
prologues := 3;
%defaultscale := 12pt / fontsize defaultfont;
input boxes;
input TEX;

numeric pic_h, pic_w;

defaultfont := "phvr8g";

verbatimtex
 \font\tenrm=phvr8g at 9pt
 \font\sevenrm=phvr8g at 7pt
 \font\fiverm=phvr8g at 5pt
 \textfont0=\tenrm
 \scriptfont0=\sevenrm
 \scriptscriptfont0=\fiverm
 \def\rm{\fam=0 \tenrm}
 \rm
etex

filenametemplate "%j-%c.eps";

def storage (expr w, h) =
    begingroup
    path res;
    pair p[];
    ang := 8;
    p0 := (0,0);
    p1 := (w,0);
    p2 := (w,h);
    p3 := (0,h);
    hprime :=  (w/2) * (sind(ang) / cosd(ang));
    p5 := (w/2, 0 - hprime);
    p6 := (w/2, h + hprime);
    p7 := (w/2, h - hprime);
    res := p0{down}...p5{right}...{up}p1--p2{up}...p6{left}...p3{down}...p7{right}...p2{up}...p6{left}...{down}p3--cycle;
    res shifted (-w/2, -h/2)
    endgroup
enddef;

vardef draw_storage (expr w, h, c, t) =
    path s;
    s := storage(w, h) shifted c;
    fill s withcolor white;
    draw s;
    draw thelabel(t, c - (0, .125h));
    s
enddef;



beginfig(1)
    begingroup
    numeric u, sep, rad;
    u := 1cm;
    sep = .75;
    rad = 0.2;

    boxit.c(btex Client etex);
    circleit.r1(btex MS etex);
    circleit.r2(btex MS etex);
    circleit.r3(btex MS etex);
    circleit.r4(btex MS etex);
    circleit.r5(btex MS etex);
    circleit.r6(btex MS etex);
    circleit.r7(btex MS etex);
    c.c = (0,0);
    r1.c =  c.c + sep * u * (2, 0);
    r2.c = r1.c + sep * u * 2 * dir 90;
    r3.c = r1.c + sep * u * 2 * dir -90;
    r5.c = r1.c + sep * u * 2 * dir 54;
    r7.c = r1.c + sep * u * 2 * dir -54;
    r4.c = r1.c + sep * u * 2 * dir 18;
    r6.c = r1.c + sep * u * 2 * dir -18;

    path store;
    store := draw_storage(1.75u, .6u, (c.c + (4 * sep * u * (-1, 0))), btex Untrusted Storage etex scaled .65);

    fill bpath c withcolor white;
    fill bpath r1 withcolor white;
    fill bpath r2 withcolor white;
    fill bpath r3 withcolor white;
    fill bpath r1 withcolor .5[white, (0,.4,1)];
    drawboxed(c);
    drawboxed(r2); drawboxed(r3); drawboxed(r4); drawboxed(r5); drawboxed(r6); drawboxed(r7);
    pickup pencircle scaled 1pt;
    drawboxed(r1);
    pickup pencircle scaled .4pt;

    draw c.c -- r1.c  cutafter bpath r1 cutbefore bpath c;
    draw r1.c -- r2.c cutafter bpath r2 cutbefore bpath r1;
    draw r1.c -- r3.c cutafter bpath r3 cutbefore bpath r1;
    draw r1.c -- r4.c cutafter bpath r4 cutbefore bpath r1;
    draw r1.c -- r5.c cutafter bpath r5 cutbefore bpath r1;
    draw r1.c -- r6.c cutafter bpath r6 cutbefore bpath r1;
    draw r1.c -- r7.c cutafter bpath r7 cutbefore bpath r1;

    draw c.w--(center store) cutafter store;

    endgroup;
endfig;


end
