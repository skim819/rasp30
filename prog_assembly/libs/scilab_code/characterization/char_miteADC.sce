clear mite_473_977_10uA;
mite_473_977_10uA=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_miteADC/data_miteADC473_977_chip"+chip_num+brdtype);
//polyfit
[p_mite_977_10uA,S_mite_977_10uA]=polyfit(mite_473_977_10uA(:,1), mite_473_977_10uA(:,2),7);
size_a=size(mite_473_977_10uA);
MITE_range_977 = mite_473_977_10uA(size_a(1,1),1):1:mite_473_977_10uA(1,1);
MITE_fit_977 = polyval(p_mite_977_10uA,MITE_range_977,S_mite_977_10uA);

clear mite_473_978_10uA;
mite_473_978_10uA=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_miteADC/data_miteADC473_978_chip"+chip_num+brdtype);
//polyfit
[p_mite_978_10uA,S_mite_978_10uA]=polyfit(mite_473_978_10uA(:,1), mite_473_978_10uA(:,2),7);
size_b=size(mite_473_978_10uA);
MITE_range_978 =  mite_473_978_10uA(size_b(1,1),1):1:mite_473_978_10uA(1,1);
MITE_fit_978 = polyval(p_mite_978_10uA,MITE_range_978,S_mite_978_10uA);

clear mite_473_979_10uA;
mite_473_979_10uA=csvRead("~/rasp30/prog_assembly/libs/scilab_code/characterization/char_miteADC/data_miteADC473_979_chip"+chip_num+brdtype);
//polyfit
[p_mite_979_10uA,S_mite_979_10uA]=polyfit(mite_473_979_10uA(:,1), mite_473_979_10uA(:,2),7);
size_c=size(mite_473_979_10uA);
MITE_range_979 = mite_473_979_10uA(size_c(1,1),1):1:mite_473_979_10uA(1,1);
MITE_fit_979 = polyval(p_mite_979_10uA,MITE_range_979,S_mite_979_10uA);

//// Plot the data
//scf(7);
//clf(7);
//plot2d("nn", mite_473_977_10uA(:,1), mite_473_977_10uA(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=1;
//plot2d("nn", mite_473_978_10uA(:,1), mite_473_978_10uA(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=2;
//plot2d("nn", mite_473_979_10uA(:,1), mite_473_979_10uA(:,2));p = get("hdl"); p.children.mark_style = 9; p.children.thickness = 3; p.children.line_mode="off";p.children.mark_foreground=3;
//plot2d("nn", MITE_range_977, MITE_fit_977, style=1);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//plot2d("nn", MITE_range_978, MITE_fit_978, style=2);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//plot2d("nn", MITE_range_979, MITE_fit_979, style=3);p = get("hdl"); p.children.line_style = 1; p.children.thickness = 3; p.children.thickness = 3;p.children.line_mode="on";
//a=gca();//a.data_bounds=[0 0; 150 2.6];
//legend("mite_473_977","mite_473_978","mite_473_979","in_upper_right");
//xtitle("","ADC code","Vg (V)");
