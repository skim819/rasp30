function [x,y,typ]=fgota(job,arg1,arg2)
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
            [ok,in_out_num, ibias, p_ibias,n_ibias,smcap,exprs]=getvalue('Set FG OTA Parameters',..
            ['Number of FG OTAs';'Ibias';'P Ibias'; 'N Ibias';'Use small cap Yes-1 No-0'],list('vec',1,'str',-1,'str',-1,'str',-1,'vec',-1),exprs)

            if ~ok then break,end

            if in_out_num ~= 1 then

                if (size(evstr(ibias),'r') ~= in_out_num) & (size(evstr(ibias),'c') ~= in_out_num) then
                    message('The number of ibias values that you have entered does not match the number of Peak Detector blocks.');
                    ok=%f;
                end

                if (size(evstr(p_ibias),'r') ~= in_out_num) & (size(evstr(p_ibias),'c') ~= in_out_num) then
                    message('The number of p ibias values that you have entered does not match the number of Peak Detector blocks.');
                    ok=%f;
                end

                if (size(evstr(n_ibias),'r') ~= in_out_num) & (size(evstr(n_ibias),'c') ~= in_out_num) then
                    message('The number of n ibias values that you have entered does not match the number of Peak Detector blocks.');
                    ok=%f;
                end
            else 

                if (size(evstr(ibias),'r') ~= in_out_num) | (size(evstr(ibias),'c') ~= in_out_num) then
                    message('The number of ibias values that you have entered does not match the number of Peak Detector blocks.');
                    ok=%f;
                end

                if (size(evstr(p_ibias),'r') ~= in_out_num) | (size(evstr(p_ibias),'c') ~= in_out_num) then
                    message('The number of p ibias values that you have entered does not match the number of Peak Detector blocks.');
                    ok=%f;
                end

                if (size(evstr(n_ibias),'r') ~= in_out_num) | (size(evstr(n_ibias),'c') ~= in_out_num) then
                    message('The number of n ibias values that you have entered does not match the number of Peak Detector blocks.');
                    ok=%f;
                end
            end

            if length(smcap) ~= in_out_num then
                message('The number of small cap decision values that you have entered does not match the number of Peak Detector blocks.');
                ok=%f;
            end

            if ok then
                model.in=[in_out_num;in_out_num]
                model.out=in_out_num
                model.ipar=[in_out_num smcap]
                model.rpar=[ibias,p_ibias,n_ibias]
                graphics.exprs=exprs;
                x.graphics=graphics;x.model=model
                break
            end
        end
    case 'define' then
        in_out_num=1
        smcap = [0]
        ibias='10e-9'
        p_ibias='10e-9'
        n_ibias='10e-9 '
        model=scicos_model()
        model.sim=list('ota_func',5)
        model.in=[in_out_num;in_out_num]
        model.in2=[1;1]
        model.intyp=[-1;-1]
        model.out=in_out_num
        model.out2=1
        model.outtyp=-1
        model.ipar=[in_out_num smcap]
        model.rpar=[ibias,p_ibias,n_ibias]
        model.blocktype='c'
        model.dep_ut=[%t %f]

        exprs=[sci2exp(in_out_num);ibias;p_ibias;n_ibias;sci2exp(smcap)]
        gr_i=['text=[''FG''];';'xstringb(orig(1),orig(2),text,sz(1),sz(2),''fill'');']
        x=standard_define([8 3],model,exprs,gr_i)
    end
endfunction
