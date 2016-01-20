function [x,y,typ]=tgate(job,arg1,arg2)
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
        graphics=arg1.graphics
        model=arg1.model
        exprs=graphics.exprs
        while %t do
            [ok,in_num,fix_loc,exprs]=scicos_getvalue('LookUp Table Parameters',['No. of Inputs';'Fix_location'],list('vec',1,'vec',-1),exprs)
            if ~ok then break,end

            if ok then
                //model.in=-ones(in_num,1) 
                //model.in2=ones(in_num,1) 
                //model.intyp=-ones(in_num,1)
                model.in=[in_num;in_num]
                //model.in=-[1:1]'
                model.out=-1
                model.intyp=-ones(1,1)
                model.ipar=in_num
                model.rpar= [fix_loc'];
                graphics.exprs=exprs;
                x.graphics=graphics;
                x.model=model
                break;
            end

        end
    case 'define' then
        in_num=4
        fix_loc=[0 0 0]
        model=scicos_model()
        //model.sim=list('lkuptb_c',5)
        //model.in=-ones(in_num,1) 
        //model.in2=ones(in_num,1) 
        //model.intyp=-ones(in_num,1)
        model.in=[in_num;in_num]
        model.in2=[1;1]
        model.intyp=[-1;-1]
        //model.in=-[1:1]
        //model.intyp=-ones(1,1)
        model.out=-1
        model.out2=1
        model.outtyp=-1
        model.ipar=in_num
        model.rpar= [fix_loc'];
        model.state=zeros(1,1)
        model.blocktype='d'
        model.dep_ut=[%t %f] 

        exprs=[sci2exp(in_num);sci2exp(fix_loc)] //sci2exp(in_num);
        gr_i=['txt='' Tgate'';';'xstringb(orig(1),orig(2),txt,sz(1),sz(2),''fill'')']
        x=standard_define([6 2],model, exprs,gr_i) 
    end
endfunction
