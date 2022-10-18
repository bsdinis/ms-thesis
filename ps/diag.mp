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

def height(expr b) = ypart (urcorner b - llcorner b) enddef;
def width(expr b) = xpart (urcorner b - llcorner b) enddef;

def scale_to(expr pic_h, pic_w) =
    save b, c;
    pair c;
    path b;
    c = center bbox currentpicture;
    b = (unitsquare shifted -(.5, .5)) yscaled pic_h xscaled pic_w shifted c;
    setbounds currentpicture to b;
enddef;

def storage (expr w, h) =
    begingroup
    path res;
    pair p[];
    ang := 30;
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

    circleit.c(btex C etex);
    circleit.r1(btex P etex);
    circleit.r2(btex R etex);
    circleit.r3(btex R etex);
    circleit.r4(btex R etex);
    circleit.r5(btex R etex);
    circleit.r6(btex R etex);
    circleit.r7(btex R etex);

    c.c = (0, 0);
    r1.c =  c.c + sep * u * (0, 2);
    r2.c = r1.c + sep * u * (2.5, 2);
    r3.c = r1.c + sep * u * (-2.5, 2);
    r4.c = r1.c + sep * u * (.5, 2);
    r5.c = r1.c + sep * u * (1.5, 2);
    r6.c = r1.c + sep * u * (-.5, 2);
    r7.c = r1.c + sep * u * (-1.5, 2);

    path st;
    st := draw_storage(.7u, .6u, (c.c + (2.5 * sep * u * (0,-1))), btex S3 etex scaled .9);

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

    draw c.c--(center st) cutafter st cutbefore bpath c;

    label.lft(btex 40$\,$ms | R etex rotated 90 scaled .7, .45[c.c, center st]);
    label.rt(btex 90$\,$ms | W etex rotated 90 scaled .7, .45[c.c, center st]);
    label.bot(btex 50$\,$ms etex rotated angle(r2.c - r1.c) scaled .7, .5[r1.c, r2.c] + (0, .1u));
    label.lft(btex 50$\,$ms etex rotated 90 scaled .7, .5[c.c, r1.c]);
    endgroup;
    pic_h = height(bbox currentpicture);
    pic_w = width(bbox currentpicture);
    scale_to(pic_h, pic_w);
endfig;


beginfig(2)
    begingroup
    numeric u, sep, rad;
    u := 1cm;
    sep = .75;
    rad = 0.2;

    circleit.c(btex C etex);
    circleit.r1(btex P etex);
    circleit.r2(btex R etex);
    circleit.r3(btex R etex);
    circleit.r4(btex R etex);
    circleit.r5(btex R etex);
    circleit.r6(btex R etex);
    circleit.r7(btex R etex);
    c.c = (0,0);
    r1.c =  c.c + sep * u * (1, 0);
    r2.c = r1.c + sep * u * (0, 1);
    r3.c = r1.c + sep * u * (0, -1);
    r4.c = r1.c + sep * u * (2,   .5);
    r5.c = r1.c + sep * u * (2,  1.5);
    r6.c = r1.c + sep * u * (2,  -.5);
    r7.c = r1.c + sep * u * (2, -1.5);

    path local;
    pair p[];
    p1 = c.c - (2 * sep * u * (-1, 0));
    c.c = .5[p1, p2];
    p3 = c.c + 2(r2.c - r1.c);
    c.c = .5[p3, p4];
    local := p1...p3...p2...p4...cycle;

    fill local withcolor .1[white, red];
    draw local dashed evenly;

    path st, rr; %, lr;
    st := draw_storage(.7u, .6u, (c.c + (3 * sep * u * (0,1))), btex S3 etex scaled .9);
    rr := draw_storage(.75u, .6u, (c.c + (3 * sep * u * (0, -1))), btex Redis etex scaled .75);
    %lr := draw_storage(.75u, .6u, (c.c + (1 * sep * u * (-1, 0))), btex Redis etex scaled .75);

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

    draw c.e -- r1.w; draw r1.n -- r2.s; draw r1.s -- r3.n;
    draw r1.c -- r4.c cutafter bpath r4 cutbefore bpath r1;
    draw r1.c -- r5.c cutafter bpath r5 cutbefore bpath r1;
    draw r1.c -- r6.c cutafter bpath r6 cutbefore bpath r1;
    draw r1.c -- r7.c cutafter bpath r7 cutbefore bpath r1;

    draw c.n--(center st) cutafter st;
    draw c.s--(center rr) cutafter rr;
    %draw c.w--(center lr) cutafter lr;

    label.lft(btex 40$\,$ms | R etex rotated 90 scaled .7, .4[c.c, center st] + (.05u, 0));
    label.rt(btex 90$\,$ms | W etex rotated 90 scaled .7, .4[c.c, center st] - (.05u, 0));
    label.lft(btex 50$\,$ms etex rotated 90 scaled .7, .4[c.c, center rr] + (.05u, 0));
    label.top(btex 50$\,$ms etex rotated angle(r5.c - r1.c) scaled .7, .6[r1.c, r5.c] - (0, .1u));
    endgroup;
    scale_to(pic_h, pic_w);
endfig;


beginfig(3)
    begingroup
    numeric u, sep, rad;
    u := 1cm;
    sep = .75;
    rad = 0.2;

    circleit.c(btex C etex);
    circleit.r1(btex P etex);
    circleit.r2(btex R etex);
    circleit.r3(btex R etex);
    circleit.r4(btex R etex);
    circleit.r5(btex R etex);
    circleit.r6(btex R etex);
    circleit.r7(btex R etex);

    c.c = (0,0);
    r1.c =  c.c + sep * u * (2, 1);
    r2.c = r1.c + sep * u * (1.5, 1.5);
    r3.c = r1.c + sep * u * (1.5, -3.5);
    r4.c = r1.c + sep * u * (1.5, -.5);
    r5.c = r1.c + sep * u * (1.5,  .5);
    r6.c = r1.c + sep * u * (1.5, -1.5);
    r7.c = r1.c + sep * u * (1.5, -2.5);

    path coloc;
    pair p[];
    p0 = c.c + sep * u * (2.75, 0);
    p1 = p0 + sep * u * (2.75/2, 3.19);
    p0 = .5[p1, p3];
    p2 = p0 + sep * u * (2.75/2, -3.19);
    p0 = .5[p2, p4];
    coloc = p1--p2--p3--p4--cycle;
    fill coloc withcolor .1[white, red];
    draw coloc dashed evenly;


    path redis; % fs;
    redis := draw_storage(.75u, .6u, c.c + sep * u * (2, -1), btex Redis etex scaled .75);
    %fs := draw_storage(.75u, .6u, c.c + sep * u * (0, -1.5), btex FS etex scaled .75);

    fill bpath c withcolor white; fill bpath r1 withcolor white; fill bpath r2 withcolor white; fill bpath r3 withcolor white; fill bpath r4 withcolor white; fill bpath r5 withcolor white; fill bpath r6 withcolor white; fill bpath r7 withcolor white;
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

    draw c.c--(center redis) cutafter redis cutbefore bpath c;
    %draw c.c--(center fs) cutafter fs cutbefore bpath c;

    label.top(btex 10$\,$ms etex rotated angle(r1.c - c.c ) scaled .7, .40[c.c, r1.c] - (0, .1u));
    label.bot(btex 10$\,$ms etex rotated angle(center(redis) - c.c ) scaled .7, .40[c.c,center(redis)] + (0, .1u));
    endgroup;
    scale_to(pic_h, pic_w);
endfig;
end
