function [x,y,typ]=cap(job,arg1,arg2)
    // Copyright INRIA
    x=[];y=[];typ=[];
    select job
    case 'plot' then
        standard_draw(arg1)
    case 'getinputs' then
        [x,y,typ]=standard_inputs(arg1)
    case 'getoutputs' then
        [x,y,typ]=standard_outputs(arg1)
    case 'getorigin' then
        [x,y]=standard_origin(arg1)
    case 'set' then
        x=arg1;
        graphics=arg1.graphics;exprs=graphics.exprs
        model=arg1.model;
        while %t do
            [ok,capt,exprs]=getvalue('Set CAPACITANCE block parameters',..
            ['Capacitance 64fF [1-6X]'],list('vec',-1),exprs)
            
            if ~ok then break,end


            if ok then
                model.rpar = capt
                graphics.exprs=exprs;
                x.graphics=graphics;x.model=model
                break
            end
        end
        
    case 'define' then
        in=1
        out=1
        capt=2
        model=scicos_model()
        model.sim=list('ota_func',5)
        model.in=in
        model.intyp=-1
        model.out=out
        model.outtyp=-1
        model.rpar = capt
        model.blocktype='d'
        model.dep_ut=[%t %f]

        exprs=[string(capt)]
        gr_i=['txt=[''ota''];'
        'style=5;'
        'rectstr=stringbox(txt,orig(1),orig(2),0,style,1);'
        'if ~exists(''%zoom'') then %zoom=1, end;'
        'w=(rectstr(1,3)-rectstr(1,2))*%zoom;'
        'h=(rectstr(2,2)-rectstr(2,4))*%zoom;'
        'xstringb(orig(1)+sz(1)/2-w/2,orig(2)-h-4,txt,w,h,''fill'');'
        'e=gce();'
        'e.font_style=style;']
        x=standard_define([4 2],model,exprs,gr_i)
    end
endfunction
