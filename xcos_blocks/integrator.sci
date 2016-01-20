function [x,y,typ]=integrator(job,arg1,arg2)
    // Copyright INRIA
    x=[];y=[];typ=[];
    select job
    case 'plot' then
        standard_draw(arg1)
    case 'getinputs' then //** GET INPUTS 
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
            [ok,in_out_num,ibias,nibias,cap1,exprs]=getvalue('Set FG OTA Parameters',..
            ['Number of FG OTAs';'Ota0 bias (A)';'Ota1 bias (A)';'Input Cap 64fF [1-6X]'],list('vec',1,'vec',-1,'vec',-1,'vec',-1),exprs)

            if ~ok then break,end

            if ok then
                model.in=[in_out_num;in_out_num;in_out_num]
                model.out=in_out_num
                model.ipar=in_out_num
                model.rpar=[ibias,nibias,cap1]
                graphics.exprs=exprs;
                x.graphics=graphics;x.model=model
                break
            end
        end
    case 'define' then
        in_out_num=1
        cap1 = 5
        ibias=1e-6
        nibias=2e-6
        model=scicos_model()
        model.sim=list('ota_func',5)
        model.in=[in_out_num;in_out_num;in_out_num]
        model.in2=[1;1;1]
        model.intyp=[-1;-1;-1]
        model.out=in_out_num
        model.out2=1
        model.outtyp=-1
        model.ipar=[in_out_num]
        model.rpar=[ibias,nibias,cap1]
        model.blocktype='c'
        model.dep_ut=[%t %f]

        exprs=[sci2exp(in_out_num);sci2exp(ibias);sci2exp(nibias);sci2exp(cap1)]
        gr_i=['text=[''Integrator''];';'xstringb(orig(1),orig(2),text,sz(1),sz(2),''fill'');']
        x=standard_define([8 3],model,exprs,gr_i)
    end
endfunction