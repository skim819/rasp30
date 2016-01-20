global chip_num board_num;

nFET_IV=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_nFETpFET/data_nFET_IVg_curve_chip"+chip_num+brdtype);
//polyfit
[p_nFET_IVg_d25V,S_nFET_IVg_d25V]=polyfit(nFET_IV(:,1), log(nFET_IV(:,2)),10);
size_nFET_IV=size(nFET_IV);
nFET_IVg_range =  nFET_IV(1,1):0.1:nFET_IV(size_nFET_IV(1,1),1);
nFET_IVg_d25V_fit = polyval(p_nFET_IVg_d25V,nFET_IVg_range,S_nFET_IVg_d25V);
nFET_IVg_d25V_fit(:)=exp(nFET_IVg_d25V_fit(:));

pFET_IV=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_nFETpFET/data_pFET_IVg_curve_chip"+chip_num+brdtype);
//polyfit
[p_pFET_IVg_d25V,S_pFET_IVg_d25V]=polyfit(pFET_IV(:,1), log(pFET_IV(:,2)),10);
size_pFET_IV=size(pFET_IV);
pFET_IVg_range =  pFET_IV(1,1):0.1:pFET_IV(size_pFET_IV(1,1),1);
pFET_IVg_d25V_fit = polyval(p_pFET_IVg_d25V,pFET_IVg_range,S_pFET_IVg_d25V);
pFET_IVg_d25V_fit(:)=exp(pFET_IVg_d25V_fit(:));

//// Plot the data
//scf(8);clf(8);
//plot2d("nl", nFET_IV(:,1), nFET_IV(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
//plot2d("nl", nFET_IV(:,1), nFET_IV(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=2;
//plot2d("nl", nFET_IV(:,1), nFET_IV(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=3;
//plot2d("nl", nFET_IV(:,1), nFET_IV(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=4;
//plot2d("nl", nFET_IV(:,1), nFET_IV(:,6));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=5;
//plot2d("nl", nFET_IVg_range, nFET_IVg_d25V_fit, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//a=gca();//a.data_bounds=[0 0; 150 2.6];
//legend("Vd=2.5V","Vd=2.0V","Vd=1.5V","Vd=1.0V","Vd=0.5V","in_lower_right");
//xtitle("","Vg (V)"," Id (A)");
//
//scf(9);clf(9);
//plot2d("nl", pFET_IV(:,1), pFET_IV(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
//plot2d("nl", pFET_IV(:,1), pFET_IV(:,3));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=2;
//plot2d("nl", pFET_IV(:,1), pFET_IV(:,4));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=3;
//plot2d("nl", pFET_IV(:,1), pFET_IV(:,5));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=4;
//plot2d("nl", pFET_IV(:,1), pFET_IV(:,6));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=5;
//plot2d("nl", pFET_IVg_range, pFET_IVg_d25V_fit, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//a=gca();//a.data_bounds=[0 0; 150 2.6];
//legend("Vd=0.2V","Vd=1.0V","Vd=1.5V","Vd=2.0V","Vd=2.3V","in_lower_left");
//xtitle("","Vg (V)"," Id (A)");
