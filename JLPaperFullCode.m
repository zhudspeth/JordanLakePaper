%% Import Data

% Note: Must have JordanLakePaperData.xlsx, JLA.xlsx,
% JordanLakeTableImport downloaded and addaxis matlab add on installed.

Table = cell(26,1);
for i = 1:26
    Table{i} = readtable('JordanLakePaperData.xlsx','Sheet',i,'Range','A:F');
end
clear i;


Data = cell(26,1);
for i = 1:26
    Data{i}(:,1) = datenum(datetime(table2array(Table{i}(:,1)),'ConvertFrom','Excel'));
    Data{i}(:,2) = table2array(Table{i}(:,2));
    Data{i}(:,3) = table2array(Table{i}(:,3));
    Data{i}(:,4) = datenum(datetime(table2array(Table{i}(:,4)),'ConvertFrom','Excel'));
    Data{i}(:,5) = table2array(Table{i}(:,5));
    Data{i}(:,6) = table2array(Table{i}(:,6));
end

Exp = cell(26,1);
for i = 1:26
    Exp{i}(:,1) = (Data{i}(:,1)); %-Data{i}(1,1))*24;
    Exp{i}(:,2) = (Data{i}(:,2));
    Exp{i}(:,3) = (Data{i}(:,3));
    Exp{i}(:,4) = (Data{i}(:,4)); %-Data{i}(1,4))*24;
    Exp{i}(:,5) = Data{i}(:,5);
    Exp{i}(:,6) = Data{i}(:,6);
end

%% Create Experiment variables for when vaalvesd opened/closed
        % cell references are closest cell to when the experiment began (CL
        % mode) or ended (OL mode)

M = cell(26,1);
O = cell(26,1);
for i = 1:3
for j = 1:3

M{1}(:,i) = NaN;
O{1}(:,j) = NaN;

M{2}(:,i) = Exp{2}(4:2284,i);
O{2}(:,j) = NaN;

M{3}(:,i) = NaN;
O{3}(:,j) = NaN;

M{4}(:,i) = Exp{4}(1:1340,i);
O{4}(:,j) = Exp{4}(69:end,j+3);


M{5}(:,i) = Exp{5}(142:933,i);
O{5}(:,j) = Exp{5}(173:1293,j+3);


M{6}(:,i) = Exp{6}(1111:end,i);
O{6}(:,j) = NaN;

M{7}(:,i) = NaN;
O{7}(:,j) = NaN;

M{8}(:,i) = Exp{8}(4:2224,i);
O{8}(:,j) = Exp{8}(1:end,j+3);

M{9}(:,i) = Exp{9}(13:2519,i); %Picked inflection point (minimum value of CH4 data
O{9}(:,j) = NaN;

M{10}(:,i) = Exp{10}(1:1988,i);
O{10}(:,j) = Exp{10}(8:3250,j+3);

M{11}(:,i) = Exp{11}(98:9017,i); %Start 3 hrs. after recorded time as laser on PST
O{11}(:,j) = Exp{11}(224:end,j+3);

M{12}(:,i) = Exp{12}(182:end,i); %Start 3 hrs. after recorded time as laser on PST
O{12}(:,j) = Exp{12}(196:10794,j+3);

M{13}(:,i) = NaN; %Exp{13}(11:end,i); SF
O{13}(:,j) = Exp{13}(16:end,j+3);

M{14}(:,i) = Exp{14}(6:end,i);
O{14}(:,j) = Exp{14}(7:3225,j+3);

M{15}(:,i) = NaN; %Exp{15}(1:end,i); SF
O{15}(:,j) = Exp{15}(1:4331,j+3);

M{16}(:,i) = Exp{16}(1:end,i);
O{16}(:,j) = Exp{16}(1:4334,j+3);

M{17}(:,i) = Exp{17}(1:end,i);
O{17}(:,j) = Exp{17}(1:2608,j+3);

M{18}(:,i) = Exp{18}(82:181,i);
O{18}(:,j) = Exp{18}(53:174,j+3);

M{19}(:,i) = Exp{19}(7:1884,i);
O{19}(:,j) = Exp{19}(16:1911,j+3);

M{20}(:,i) = Exp{20}(16:1594,i);
O{20}(:,j) = Exp{20}(30:1920,j+3);

M{21}(:,i) = Exp{21}(4:2129,i); 
O{21}(:,j) = Exp{21}(7:3744,j+3);

M{22}(:,i) = Exp{22}(1:1684,i);
O{22}(:,j) = Exp{22}(1:3049,j+3);

M{23}(:,i) = Exp{23}(1:1066,i);
O{23}(:,j) = Exp{23}(1:1709,j+3);
    M{23}(1:123,2) = NaN;


M{24}(:,i) = Exp{24}(31:1351,i);
O{24}(:,j) = Exp{24}(57:2311,j+3);

M{25}(:,i) = Exp{25}(21:1375,i);
O{25}(:,j) = Exp{25}(41:2351,j+3);

M{26}(:,i) = Exp{26}(12:1395,i);
O{26}(:,j) = Exp{26}(25:2385,j+3);

end
end

%% Cutoff if O2 goes below 2µM
        % Optode sensitivity is +/- 2µM, so anoxic is defined as 2µM


nM=cell(26,1);
O2=cell(26,1);

for i =1:3
    for j=1:11
        nM{j}(:,i) = M{j}(:,i);
        O2{j}(:,i) = O{j}(:,i);
    end

    nM{12}(:,i) = M{12}(1:6099,i);
    O2{12}(:,i) = O{12}(1:6121,i);

    nM{13}(:,i) = M{13}(:,i);
    O2{13}(:,i) = O{13}(1:3173,i);

    nM{14}(:,i) = M{14}(1:1806,i);
    O2{14}(:,i) = O{14}(1:2629,i);

    nM{15}(:,i) = M{15}(:,i);
    O2{15}(:,i) = O{15}(1:423,i);

    nM{16}(:,i) = M{16}(1:991,i);
    O2{16}(:,i) = O{16}(1:1441,i);

    nM{17}(:,i) = M{17}(1:1891,i);
    O2{17}(:,i) = O{17}(1:1892,i);

    nM{18}(:,i) = M{18}(:,i);
    O2{18}(:,i) = O{18}(:,i);

    nM{19}(:,i) = M{19}(1:1344,i);
    O2{19}(:,i) = O{19}(1:1353,i);

    nM{20}(:,i) = M{20}(1:1200,i);
    O2{20}(:,i) = O{20}(1:1435,i);

    for j=21:26
        nM{j}(:,i) = M{j}(:,i);
        O2{j}(:,i) = O{j}(:,i);
    end
end
%% Turn datetime into experiment time. 
      %% subtract 1st cell then multiply by 24

for i=1:26
nM{i}(:,1) = (nM{i}(:,1) - nM{i}(1,1))*24;
O2{i}(:,1) = (O2{i}(:,1) - O2{i}(1,1))*24; 
end


%% Temperature Interpolation
        %Interpolate Optode temperature measurements to methane sampling
        %time for conersion of ppm to nM
        %If no optode data is available, laser temperature is used with a
        %corrected baseline shift (average difference across exp between
        %laser and optode temp).





DiffTemp=cell(26,1);
O2CH4Temp=cell(26,1);

for i=16:26
O2CH4Temp{i} = interp1(O2{i}(:,1),O2{i}(:,3),nM{i}(:,1));
DiffTemp{i} = rmmissing(nM{i}(:,3)-O2CH4Temp{i});
end

for i=14
O2CH4Temp{i} = interp1(O2{i}(:,1),O2{i}(:,3),nM{i}(:,1));
DiffTemp{i} = rmmissing(nM{i}(:,3)-O2CH4Temp{i});
end

for i=10:12
O2CH4Temp{i} = interp1(O2{i}(:,1),O2{i}(:,3),nM{i}(:,1));
DiffTemp{i} = rmmissing(nM{i}(:,3)-O2CH4Temp{i});
end

for i=8
O2CH4Temp{i} = interp1(O2{i}(:,1),O2{i}(:,3),nM{i}(:,1));
DiffTemp{i} = rmmissing(nM{i}(:,3)-O2CH4Temp{i});
end

for i=4:5
O2CH4Temp{i} = interp1(O2{i}(:,1),O2{i}(:,3),nM{i}(:,1));
DiffTemp{i} = rmmissing(nM{i}(:,3)-O2CH4Temp{i});
end

T=ones(26,3);
for i=1:26
    T(i,1) = mean(DiffTemp{i});
    T(i,2) = std(DiffTemp{i});
    T(i,3) = var(DiffTemp{i});
end


%% Convert to nM from ppm
    %uses formula from Duan et al. 1992 (see paper for details)

CH4 = cell(26,1);


for i = 1:26

    CH4{i}(:,1)=nM{i}(:,1);

    if isnan(T(i,1))
           CH4{i}(:,3) = nM{i}(:,3) - mean(rmmissing(T(:,1)));     
    else
        CH4{i}(:,3) = nM{i}(:,3) - T(i,1);

    end
end

for i=1:26
    if isnan(nM{i}(1,1))
        CH4{i}(1,2) = NaN;
    else
        for j=1:length(CH4{i}(:,2))
            CH4{i}(j,2) = ppmv2nm(nM{i}(j,2),CH4{i}(j,3),1013,0);
        end
    end
end

%% For future use
ControlCH4 = cell(3,1);

for i =1:3
    ControlCH4{i} = CH4{20+i}(:,:);

end



%% Must edit Exp 23 as laser did not turn on to start exp.

CH4{23} = CH4{23}(124:end,:);


%% Set string with Experiment dates

ExpDate = ["SF";"3/20/20";"SF";"3/30/20";"4/14/20";"4/20/20";"SF";"4/27/20";"5/5/20";"5/12/20";"6/16/20";"6/16/20";"6/26/20";"6/26/20";"6/29/20";"6/29/20";"7/17/20";"10/26/20";"10/26/20";"10/26/20";"6/25/21";"6/29/21";"7/10/21";"10/29/21";"10/29/21";"10/29/21"];

%% Plot all data in one large figure, this code includes AMOR fits, and plots CH4 plus O2 measurements

x=cell(26,1);
y=cell(26,1);
 Fit = cell(26,1);
fig = figure;
 
FS = 14;
for i = 1:2
    if isnan(CH4{i}(1,1))
        x{i}(:,1) = [NaN,NaN,NaN];
        y{i}(:,1) = NaN;
        if isnan(O2{i}(:,1))
            subplot(6,4,1)
            title("Experiment 1, 3, & 7");
            axis off
        else
        subplot(6,4,1),set(gcf, 'Color','w');
        yyaxis right
        plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'Color','r')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
        %ylabel('O2 [\muM]');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(2).Color = 'r';
        ax.YAxis(1).Color = 'b';
        yyaxis left
        set(gca,'YTickLabel',{' '})
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

        end
        
        
    else
        fun = @(x)(x(1)*exp(x(2)*rmmissing(CH4{i}(:,1))) + x(3) - rmmissing(CH4{i}(:,2)));
                %fun = @(x)(x(1)*exp(x(2)*(CH4{i}(:,1))) + x(3) - (CH4{i}(:,2)));

        x0 = [CH4{i}(1,2),0,5];
        x{i}(:,1) = lsqnonlin(fun,x0,[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);
        x{i}(:,1) = lsqnonlin(fun,x{i},[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);
        x{i}(:,1) = lsqnonlin(fun,x{i},[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);

        L = nM{i}(1,1):0.01:nM{i}(end,1);
        y{i}(:,1) = x{i}(1,1)*exp(x{i}(2,1)*L) + x{i}(3,1);

       
        Fit{i}(:,1) = L;
        Fit{i}(:,2) = y{i}(:,1);

        subplot(6,4,i),set(gcf, 'Color','w');
        plot(CH4{i}(:,1),CH4{i}(:,2),'.','MarkerSize',4.5,'Color','b')
        hold on;
        plot(Fit{i}(:,1),Fit{i}(:,2),'-','LineWidth',1.5,'Color','g')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
        %xlabel('Time [Hours]'); ylabel('CH4 [nM]');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(1).Color = 'b';
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

        if isnan(O2{i}(:,1))
        else
        yyaxis right
        plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'Color','r')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
        %ylabel('O2 [\muM]');
        %legend('CH4 Raw nM','Exponential Fit y = Ae^-^k^t+\theta','Oxygen \muM');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(1).Color = 'b';
        ax.YAxis(2).Color = 'r';
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

        end
    end
end

for i = 3:6
    if isnan(CH4{i}(1,1))
        x{i}(:,1) = [NaN,NaN,NaN];
        y{i}(:,1) = NaN;
        if isnan(O2{i}(:,1))
            subplot(6,4,1)
            title("Experiment 1, 3, & 7");
            axis off
        else
        subplot(6,4,i),set(gcf, 'Color','w');
        yyaxis right
        plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'Color','r')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
        %ylabel('O2 [\muM]');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(2).Color = 'r';
        ax.YAxis(1).Color = 'b';
        yyaxis left
        set(gca,'YTickLabel',{' '})
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

        end
        
        
    else
        fun = @(x)(x(1)*exp(x(2)*rmmissing(CH4{i}(:,1))) + x(3) - rmmissing(CH4{i}(:,2)));
                %fun = @(x)(x(1)*exp(x(2)*(CH4{i}(:,1))) + x(3) - (CH4{i}(:,2)));

        x0 = [CH4{i}(1,2),0,5];
        x{i}(:,1) = lsqnonlin(fun,x0,[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);
        x{i}(:,1) = lsqnonlin(fun,x{i},[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);
        x{i}(:,1) = lsqnonlin(fun,x{i},[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);

        L = nM{i}(1,1):0.01:nM{i}(end,1);
        y{i}(:,1) = x{i}(1,1)*exp(x{i}(2,1)*L) + x{i}(3,1);

       
        Fit{i}(:,1) = L;
        Fit{i}(:,2) = y{i}(:,1);

        subplot(6,4,i-1),set(gcf, 'Color','w');
        plot(CH4{i}(:,1),CH4{i}(:,2),'.','MarkerSize',4.5,'Color','b')
        hold on;
        plot(Fit{i}(:,1),Fit{i}(:,2),'-','LineWidth',1.5,'Color','g')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
       % xlabel('Time [Hours]'); ylabel('CH4 [nM]');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(1).Color = 'b';
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

        if isnan(O2{i}(:,1))
        else
        yyaxis right
        plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'Color','r')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
       % ylabel('O2 [\muM]');
        %legend('CH4 Raw nM','Exponential Fit y = Ae^-^k^t+\theta','Oxygen \muM');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(1).Color = 'b';
        ax.YAxis(2).Color = 'r';
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

        end
    end
end

for i = 7:26
    if isnan(CH4{i}(1,1))
        x{i}(:,1) = [NaN,NaN,NaN];
        y{i}(:,1) = NaN;
        if isnan(O2{i}(:,1))
            subplot(6,4,1)
            axis off
             title("Experiment 1, 3, & 7");
        else
            
        subplot(6,4,i-2),set(gcf, 'Color','w');
        yyaxis right
        plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'Color','r')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
        %ylabel('O2 [\muM]');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(1).Color = 'b';
        ax.YAxis(2).Color = 'r';
        yyaxis left
        set(gca,'YTickLabel',{' '})
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

        end
        
        
    else
        %fun = @(x)(x(1)*exp(x(2)*(CH4{i}(:,1))) + x(3) - (CH4{i}(:,2)));
                fun = @(x)(x(1)*exp(x(2)*rmmissing(CH4{i}(:,1))) + x(3) - rmmissing(CH4{i}(:,2)));

        x0 = [CH4{i}(1,2),0,5];
        x{i}(:,1) = lsqnonlin(fun,x0,[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);
        x{i}(:,1) = lsqnonlin(fun,x{i},[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);
        x{i}(:,1) = lsqnonlin(fun,x{i},[0,-0.5,-10],[(max(CH4{i}(:,2))*2),1,300]);

        L = nM{i}(1,1):0.01:nM{i}(end,1);
        y{i}(:,1) = x{i}(1,1)*exp(x{i}(2,1)*L) + x{i}(3,1);

       
        Fit{i}(:,1) = L;
        Fit{i}(:,2) = y{i}(:,1);

        subplot(6,4,i-2),set(gcf, 'Color','w');
        plot(CH4{i}(:,1),CH4{i}(:,2),'.','MarkerSize',4.5,'Color','b')
        hold on;
        plot(Fit{i}(:,1),Fit{i}(:,2),'-','LineWidth',1.5,'Color','g')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
       % xlabel('Time [Hours]'); ylabel('CH4 [nM]');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(1).Color = 'b';
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');
        if isnan(O2{i}(:,1))
        else
        yyaxis right
        plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'Color','r')
        title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized', 'Position', [0.67 0.8 1]);
        %ylabel('O2 [\muM]');
        %legend('CH4 Raw nM','Exponential Fit y = Ae^-^k^t+\theta','Oxygen \muM');
        set(gca, 'FontSize',FS)
        ax = gca;
        ax.YAxis(1).Color = 'b';
        ax.YAxis(2).Color = 'r';
        set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');
        end
    end
end

subplot(6,4,1)
plot(0,0,'.','MarkerSize',15,'Color','b')
hold on;
plot(0,0,'.','MarkerSize',15,'Color','r')
plot(0,0,'-','LineWidth',2.5,'Color','g')
axis off
lgd = legend({'Methane Laser Data','Oxygen Optode Data','Exponential Fit'},'FontSize',18);
lgd.FontName = 'Times New Roman';
lgd.LineWidth = 1.5;


%% For future use

ControlFit = cell(3,1);
ControlO2 = cell(3,1);
for i =1:3
    ControlFit{i} = Fit{20+i}(:,:);
    ControlO2{i} = O2{20+i}(:,:);
end

save('ControlData',"ControlCH4","ControlFit","ControlO2");
% sgtitle('Jordan Lake Methane Oxidation Rate Experiments 1-26');


%% AMMONIUM SECTION


TableNH4 = readtable('AmmoniumForJLPaper','Sheet',1,'Range','A:U');




NH4 = cell(26,1);

for i=1:10
    NH4{i}(1,1:2) = NaN;
end

NH4{13}(1,1:2) = NaN;
NH4{15}(1,1:2) = NaN;

for i=17:20
    NH4{i}(1,1:2) = NaN;
end
for i=24:26
    NH4{i}(1,1:2) = NaN;
end

NH4{11}(:,1) = rmmissing(datenum(datetime(table2array(TableNH4(:,1)),'ConvertFrom','Excel')));
NH4{11}(:,2) = rmmissing(table2array(TableNH4(:,2)));
NH4{11}(:,3) = rmmissing(table2array(TableNH4(:,3)));
NH4{12}(:,1) = rmmissing(datenum(datetime(table2array(TableNH4(:,4)),'ConvertFrom','Excel')));
NH4{12}(:,2) = rmmissing(table2array(TableNH4(:,5)));
NH4{12}(:,3) = rmmissing(table2array(TableNH4(:,6)));
NH4{14}(:,1) = rmmissing(datenum(datetime(table2array(TableNH4(:,7)),'ConvertFrom','Excel')));
NH4{14}(:,2) = rmmissing(table2array(TableNH4(:,8)));
NH4{14}(:,3) = rmmissing(table2array(TableNH4(:,9)));
NH4{16}(:,1) = rmmissing(datenum(datetime(table2array(TableNH4(:,10)),'ConvertFrom','Excel')));
NH4{16}(:,2) = rmmissing(table2array(TableNH4(:,11)));
NH4{16}(:,3) = rmmissing(table2array(TableNH4(:,12)));
NH4{21}(:,1) = rmmissing(datenum(datetime(table2array(TableNH4(:,13)),'ConvertFrom','Excel')));
NH4{21}(:,2) = rmmissing(table2array(TableNH4(:,14)));
NH4{21}(:,3) = rmmissing(table2array(TableNH4(:,15)));
NH4{22}(:,1) = rmmissing(datenum(datetime(table2array(TableNH4(:,16)),'ConvertFrom','Excel')));
NH4{22}(:,2) = rmmissing(table2array(TableNH4(:,17)));
NH4{22}(:,3) = rmmissing(table2array(TableNH4(:,18)));
NH4{23}(:,1) = rmmissing(datenum(datetime(table2array(TableNH4(:,19)),'ConvertFrom','Excel')));
NH4{23}(:,2) = rmmissing(table2array(TableNH4(:,20)));
NH4{23}(:,3) = rmmissing(table2array(TableNH4(:,21)));


for i=1:26
    NH4{i}(:,1) = (NH4{i}(:,1) - NH4{i}(1,1))*24;
end


NH4test = cell(26,1);
NH4Fit = cell(26,1);
NH4Time = cell(26,1);

for i=1:26
    if isnan(NH4{i}(1,2))
        NH4test{i}(1,1) = NaN;
        NH4Time{i}(1,1) = NaN;
        NH4Fit{i}(1,1) = NaN;
    else
        J=NH4{i}(sum(isnan(NH4{i}),2)==0,:);
        K2 = J(:,2);
        K = [(ones(length(J(:,1)),1)),J(:,1)];
        NH4test{i}(:,:) = K\K2;
        NH4Time{i}(:,1) = (NH4{i}(1,1):0.1:NH4{i}(end,1));
        NH4Fit{i}(:,1) = NH4test{i}(1,1)+NH4test{i}(2,1)*NH4Time{i}(:,1);

        % figure
        % %plot(NH4{i}(:,1),NH4{i}(:,2),'.','MarkerSize',4,'Color',[0.5 0 0.5])
        % errorbar(NH4{i}(:,1),NH4{i}(:,2),NH4{i}(:,3))
        % hold on;
        % plot(NH4Time{i}(:,1),NH4Fit{i}(:,1),'-','Color',[0.5 0 0.5])
   end
end    




for i=12
     if isnan(CH4{i}(1,1))
     else
        if isnan(NH4{i}(1,1))
    %     figure,set(gcf, 'Color','w');
    %     plot(CH4{i}(:,1),CH4{i}(:,2),'.','MarkerSize',5,'Color','b')
    %     hold on;
    %     plot(Fit{i}(:,1),Fit{i}(:,2),'-','LineWidth',2,'Color','g')
    %     title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized');
    %     yyaxis right
    %     plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'Color','r')
    %     title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized');
    %     set(gca, 'FontSize',FS)
    %     ax = gca;
    %     ax.YAxis(2).Color = 'r';
    %     ax.YAxis(1).Color = 'b';
        else


        figure,set(gcf, 'Color','w');
        plot(CH4{i}(:,1),CH4{i}(:,2),'.','MarkerSize',5,'Color','b')
        ylabel('Methane (nM)')
        hold on;
        plot(Fit{i}(:,1),Fit{i}(:,2),'-','LineWidth',1.5,'Color','g')
%         title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized');
        yyaxis right
        errorbar(NH4{i}(:,1),NH4{i}(:,2)/1000,3*NH4{i}(:,3)/1000,'.','Color',[0.5 0 0.5], ...
            'MarkerSize',10,'MarkerFaceColor',[0.5 0 0.5],'MarkerEdgeColor',[0.5 0 0.5],'Capsize',10,'LineStyle','none')
        hold on;
        plot(NH4Time{i}(:,1),NH4Fit{i}(:,1)/1000,'-','Color',[0.5 0 0.5],'LineWidth',1.5)
        ylabel('Ammonium (µM)'); ylim([0 3]);

%         title(string("Exp. " + i + " - " + string(ExpDate(i))), 'Units', 'normalized');
        % hAx1=gca;                % get the first axis handle so can address each desired
        % pos = get(hAx1, 'position');
        % hAx2=axes('YAxisLocation','right','Color','none','YTick',[]);
        % hAx2.Position = hAx1.Position-[0 0 0.4 0];
        % hAx2.FontName = ('Times New Roman');
        % % hAx2.XAxis.Visible = 'off';
        % hAx2.FontSize = 14;
        % hAx2.LineWidth = 1.5;
        % hAx2 = errorbar(NH4{i}(:,1),NH4{i}(:,2),NH4{i}(:,3));

        plot(O2{i}(:,1),O2{i}(:,2),'.','MarkerSize',3,'MarkerFaceColor','r')
        addaxis(O2{i}(:,1),O2{i}(:,2),'.','Color','r','MarkerSize',3,'MarkerFaceColor','r');

        %addaxisset([0 3.500],2); 
        addaxislabel(2, 'Oxygen (µM)');
        set(gca, 'FontSize',18)
        set(gca,'LineWidth',2); set(gca,'FontName','Times New Roman');
        ax = gca;
        ax.YAxis(2).Color = [0.5 0 0.5];
        ax.YAxis(1).Color = 'k';
        xlabel('Duration (hours)');
        end
    end
end






%%Compare addition experiments



CH4 = cell(5,1);
O2 = cell(5,1);
CH4I = cell(5,1);
O2I = cell(5,1);

for i = 1:5
CH4I{i} = readtable('JLA1.xlsx','Sheet',i,'Range','A:C');
O2I{i} = readtable('JLA1.xlsx','Sheet',i,'Range','D:F');
end

clear i;

for i = 1:5
    CH4{i}(:,1) = (datenum(datetime(table2array(CH4I{i}(:,1)),'ConvertFrom','Excel')));
    CH4{i}(:,2) = (table2array(CH4I{i}(:,2)));
    CH4{i}(:,3) = (table2array(CH4I{i}(:,3)));
    O2{i}(:,1) = (datenum(datetime(table2array(O2I{i}(:,1)),'ConvertFrom','Excel')));
    O2{i}(:,2) = (table2array(O2I{i}(:,2)));
    O2{i}(:,3) = (table2array(O2I{i}(:,3)));
end



%Remove NaNs from experiment

CH4{1} = CH4{1}(1:2253,:);
CH4{2} = CH4{2}(9:2274,:);
O2{2} = O2{2}(15:end,:);
CH4{3} = CH4{3}(1:2582,:);
CH4{4} = CH4{4}(1:2571,:);
CH4{5} = CH4{5}(1:2644,:);

%Convert times to hourse

for i = 1:5
    CH4{i}(:,1) = (CH4{i}(:,1)-CH4{i}(1,1))*24;
    O2{i}(:,1) = (O2{i}(:,1)-O2{i}(1,1))*24;
end

%End when oxygen <2µM

A = [0;0;3794;0;1995];
B = [0;0;2101;0;1264];
z = zeros(5,1);
for i=1:5
    if A(i) == 0
        z(i) = 1;
    else
        z(i) = 0;
        O2{i} = O2{i}(1:A(i),:);
        CH4{i} = CH4{i}(1:B(i),:);
    end
end

%Find corresponding ambient temperatures for laser data

for i=1:5
O2CH4Temp{i} = interp1(O2{i}(:,1),O2{i}(:,3),CH4{i}(:,1));
DiffTemp{i} = rmmissing(CH4{i}(:,3)-O2CH4Temp{i});
end

%Convert to nM

nM = CH4;
for i=1:5
        for j=1:length(CH4{i}(:,2))
            nM{i}(j,2) = ppmv2nm(CH4{i}(j,2),O2CH4Temp{i}(j,1),1013,0);
        end
end


for i=1:5
    for j = 1:length(nM{i}(:,1))
        if isnan(nM{i}(j,2))
            nM{i}(j,1) = NaN;
        end
        if nM{i}(j,2) == 0
            nM{i}(j,1) = NaN;
            nM{i}(j,2) = NaN;
        end
    end
end

%CH4 fits
Fit=cell(5,1);
X = zeros(5,3);
for i = 1:5
    fun = @(x)(x(1)*exp(x(2)*rmmissing(nM{i}(:,1))) + x(3) - rmmissing(nM{i}(:,2)));
    x0 = [300,0,5];
    x = lsqnonlin(fun,x0,[0,-1,-10],[(max(nM{i}(:,2))*2),1,300]);
    x = lsqnonlin(fun,x,[0,-1,-10],[(max(nM{i}(:,2))*2),1,300]);
    x = lsqnonlin(fun,x,[0,-1,-10],[(max(nM{i}(:,2))*2),1,300]);
    x = lsqnonlin(fun,x,[0,-1,-10],[(max(nM{i}(:,2))*2),1,300]);
    x = lsqnonlin(fun,x,[0,-1,-10],[(max(nM{i}(:,2))*2),1,300]);

    X(i,:) = x;

    t = 0:0.01:max(nM{i}(:,1));
    y = x(1)*exp(x(2)*t) + x(3);


    Fit{i}(:,1) = t;
    Fit{i}(:,2) = y;


    % figure,plot(nM{i}(:,1),nM{i}(:,2))
    % hold on;
    % plot(Fit{i}(:,1),Fit{i}(:,2))
    % yyaxis right
    % plot(O2{i}(:,1),O2{i}(:,2),'.','Color','r')
end


%O2 fits

Btest = cell(5,1);
o2Fit = cell(5,1);
o2Time = cell(5,1);

for i=1:5
        J=O2{i}(sum(isnan(O2{i}),2)==0,:);
        K2 = J(:,2);
        K = [ones(length(J(:,1)),1),J(:,1)];
        Btest{i}(:,1) = K\K2;
        o2Time{i}(:,1) = (O2{i}(1,1):0.1:O2{i}(end,1));
        o2Fit{i}(:,1) = Btest{i}(1,1)+Btest{i}(2,1)*o2Time{i}(:,1);

        % figure,plot(O2{i}(:,1),O2{i}(:,2))
        % hold on;
        % plot(o2Time{i}(:,1),o2Fit{i}(:,1))
end


%% Ammonium addition

load("ControlData.mat")


MS = 2;
LW = 1;

figure,
subplot(1,3,1)
h(1) = plot(nM{1}(:,1),nM{1}(:,2),'.','Color','g','MarkerSize',MS);
hold on;
h(2) = plot(ControlCH4{1}(:,1),ControlCH4{1}(:,2),'.','Color','b','MarkerSize',MS);
h(3) = plot(nM{2}(:,1),nM{2}(:,2),'.','Color','r','MarkerSize',MS);
a(1) = plot(Fit{1}(:,1),Fit{1}(:,2),'-','Color','g','LineWidth',LW);
hold on;
a(2) = plot(ControlFit{1}(:,1),ControlFit{1}(:,2),'-','Color','b','LineWidth',LW);
a(3) = plot(Fit{2}(:,1),Fit{2}(:,2),'-','Color','r','LineWidth',LW);
g(1) = plot(-40,-40,'.','MarkerSize',14,'Color','g');
g(2) = plot(-40,-40,'.','MarkerSize',14,'Color','b');
g(3) = plot(-40,-40,'.','MarkerSize',14,'Color','r');

legend(g,'iBag 1, 20.5µM NH_4^+, {\itk} = 0.075', 'iBag 2, Control, {\itk} = 0.089', 'iBag 3, 21.9µM NH_4^+, {\itk} = 0.51');

xlim([0 75]); ylim([0 400]); ylabel('Methane (nM)')
set(gca,'FontSize',18); set(gcf,'Color','w'); set(gca,'LineWidth',2); set(gca,'FontName','Times New Roman');


subplot(1,3,2)
j(1) = plot(nM{3}(:,1),nM{3}(:,2),'.','Color','g','MarkerSize',MS);
hold on;
j(2) = plot(ControlCH4{2}(:,1),ControlCH4{2}(:,2),'.','Color','b','MarkerSize',MS);
j(3) = plot(nM{4}(:,1),nM{4}(:,2),'.','Color','r','MarkerSize',MS);
a(1) = plot(Fit{3}(:,1),Fit{3}(:,2),'-','Color','g','LineWidth',LW);
hold on;
a(2) = plot(ControlFit{2}(:,1),ControlFit{2}(:,2),'-','Color','b','LineWidth',LW);
a(3) = plot(Fit{4}(:,1),Fit{4}(:,2),'-','Color','r','LineWidth',LW);

e(1) = plot(-40,-40,'.','MarkerSize',14,'Color','g');
e(2) = plot(-40,-40,'.','MarkerSize',14,'Color','b');
e(3) = plot(-40,-40,'.','MarkerSize',14,'Color','r');


legend(e,'iBag 1, 43.4µM NH_4^+, {\itk} = 0.042', 'iBag 2, Control, {\itk} = 0.033', 'iBag 3, 45.2µM NH_4^+, {\itk} = 0.38');

xlim([0 80]); ylim([0 500]); xlabel('Duration (hours)');
set(gca,'FontSize',18); set(gcf,'Color','w'); set(gca,'LineWidth',2); set(gca,'FontName','Times New Roman');

subplot(1,3,3)
k(1) = plot(nM{5}(:,1),nM{5}(:,2),'.','Color','g','MarkerSize',MS);
hold on;
k(2) = plot(ControlCH4{3}(:,1),ControlCH4{3}(:,2),'.','Color','b','MarkerSize',MS);
a(1) = plot(Fit{5}(:,1),Fit{5}(:,2),'-','Color','g','LineWidth',LW);
hold on;
a(2) = plot(ControlFit{3}(:,1),ControlFit{3}(:,2),'-','Color','b','LineWidth',LW);



d(1) = plot(-40,-40,'.','MarkerSize',14,'Color','g');
d(2) = plot(-40,-40,'.','MarkerSize',14,'Color','b');



legend(d,'iBag 1, 38.4µM NH_4^+, {\itk} = 0.19', 'iBag 2, Control, {\itk} = 0.023');

xlim([0 35]); ylim([0 200]);
set(gca,'FontSize',18); set(gcf,'Color','w'); set(gca,'LineWidth',2); set(gca,'FontName','Times New Roman');



%% Last three figures, rate constant vs variables, nh4 vs O2

clear all;

TableJL = readtable('JordanLakeTableImport.xlsx','Sheet',1,'Range','A:P');
JLData = table2array(TableJL);


%% Sort data into groups


Spring(1:10,1) = JLData(1:10,4);
Spring(1:10,2) = JLData(1:10,12);
Summer(1:7,1) = JLData(11:17,4);
Summer(1:7,2) = JLData(11:17,12);
Summer(8:10,1) = JLData(21:23,4);
Summer(8:10,2) = JLData(21:23,12);
Fall(1:3,1) = JLData(18:20,4);
Fall(1:3,2) = JLData(18:20,12);
Fall(4:6,1) = JLData(24:26,4);
Fall(4:6,2) = JLData(24:26,12);
Spring = rmmissing(Spring);
Summer = rmmissing(Summer);
Fall = rmmissing(Fall);
Sp = mean(Spring,1);
Su = mean(Summer,1);
Fa = mean(Fall,1);
SpSD = std(Spring,1);
SuSD = std(Summer,1);
FaSD = std(Fall,1);
A = [Sp;Su;Fa];
A(1:3,3:4) = [SpSD;SuSD;FaSD];


%% Plot Julian day data with error bars and date span bands

% plot(Sp(1,2),Sp(1,1),'o','Color','r','MarkerSize',5)
figure
rectangle('Position', [(A(1,2)-35) (0.001) (70) (0.005)],'FaceColor','c','EdgeColor','c');
hold on;
rectangle('Position', [(A(2,2)-25) (0.001) (50) (0.005)],'FaceColor','#228B22','EdgeColor','#228B22')
rectangle('Position', [(A(3,2)-10) (0.001) (20) (0.005)],'FaceColor','r','EdgeColor','r')
errorbar(A(1,2),A(1,1),A(1,3),'Color','c','LineWidth',2,'LineStyle','--','CapSize',0,'Marker','.','MarkerSize',20)
errorbar(A(2,2),A(2,1),A(2,3),'Color','#228B22','LineWidth',2,'LineStyle','--','CapSize',0,'Marker','.','MarkerSize',20)
errorbar(A(3,2),A(3,1),A(3,3),'Color','r','LineWidth',2,'LineStyle','--','CapSize',0,'Marker','.','MarkerSize',20)


hold on;
a(1) = plot(JLData(1:20,12),JLData(1:20,4),'+','Color','k','MarkerSize',10,'LineWidth',3);
a(2) = plot(JLData(21:26,12),JLData(21:26,4),'.','Color','k','MarkerSize',22);
legend(a,{'2020','2021'},'location','northwest','FontSize',14,'FontName','Times New Roman' ); legend boxoff

% xticks([0 31 59 90 120 151 181 212 243 273 304 334])
% xticklabels({'0','31','59','90','120','151','181','212','243','273','304','334';'J','F','M','A','M','J','J','A','S','O','N','D'})
% %xticklabels({'January','February','March','April','May','June','July','August','September','October','November','December'})
xlim([0 365])
yticks([ 0 .1 .2 .3 .4 .5])
ylabel('Rate Constant ({\it hr^-^1})','FontName','Times New Roman')
set(gca,'FontSize',14); set(gcf,'Color','w'); set(gca,'LineWidth',1.5); set(gca,'FontName','Times New Roman');

hAx1=gca;                % get the first axis handle so can address each desired
pos = get(hAx1, 'position');
    hAx2=axes('YAxisLocation','right','Color','none','YTick',[]);
    hAx2.Position = hAx1.Position-[0 0.055 0 0];
    hAx2.FontName = ('Times New Roman');
    hAx2.XLim = [0 365];
    hAx2.YAxis.Visible = 'off';
    hAx2.XTick = [15 46 75 105 135 166 196 227 258 288 319 349];
    hAx2.XTickLabel = {'J','F','M','A','M','J','J','A','S','O','N','D'};
    hAx2.TickLength = [0 0];
    hAx2.FontSize = 14;
    hAx2.LineWidth = 1.5;

%#fc8803



%% Oxygen vs K plot

clear all;
TableJL = readtable('JordanLakeTableImport.xlsx','Sheet',1,'Range','A:P');
JLData = table2array(TableJL);

A(:,1) = JLData(:,4);
A(:,2) = JLData(:,13);

A = rmmissing(A);


% Plot 2, log plot

        K2 = A(:,1);
        K = [ones(length(A(:,2)),1),log(A(:,2))];
        Btest2(:,1) = K\K2;
        o2Time2(:,1) = [log(min(A(:,2))),log(max(A(:,2)))];
        o2Fit2(:,1) = Btest2(1,1)+Btest2(2,1)*o2Time2(:,1);


figure,plot(log(A(:,2)),A(:,1),'.','MarkerSize',25,'Color','k')
set(gca,'FontSize',18)
set(gcf,'color','w')
ylabel('Rate Constant (hr^-^1)'); xlabel('ln Initial Oxygen Concentration (µM)')
hold on; plot(o2Time2,o2Fit2,'--','LineWidth',2,'Color','k')
ylim([0 0.5])
set(gca,'FontSize',24); set(gcf,'Color','w'); set(gca,'LineWidth',2); set(gca,'FontName','Times New Roman');
a(1) = plot(5,0.25,'.','Color','w');
a(2) = plot(4.9,0.25,'.','Color','w');
legend(a,'R^2 = 0.82','p-value < 0.001','FontName','Times New Roman','FontSize',24); legend boxoff;



r2 = ((A(:,1) - Btest2(1,1)) - Btest2(2,1).*log(A(:,2)) ).^2;
RR2 = sum(rmmissing(r2));
t2 = (A(:,1)) - (mean((A(:,1))));
TT2 = sum(rmmissing(t2).^2);
R22 = 1-(RR2/TT2);

%% NH4 rate vs O2 rate
C(:,1) = JLData(:,14);
C(:,2) = JLData(:,16);
B = rmmissing(C);
B(:,2) = B(:,2)/1000;


K2 = B(:,1);
K = [ones(length(B(:,2)),1),B(:,2)];
NvOtest(:,1) = K\K2;
NvOTime(:,1) = [-1,1.4];
NvOFit(:,1) = NvOtest(1,1)+NvOtest(2,1)*NvOTime(:,1);

Fit = [NvOFit,NvOTime];

r = ((B(:,1) - NvOtest(1,1)) - NvOtest(2,1).*B(:,2) ).^2;
RR = sum(rmmissing(r));
t = B(:,1) - mean(B(:,1));
TT = sum(rmmissing(t).^2);
R2 = 1-(RR/TT);

Xm = (B(:,2) - mean(B(:,2))).^2;
SE = sqrt((1/length(B(:,1)-2))*(sum(Xm)/sum(r)));
SE2 = sqrt((1/length(B(:,1)-2))*(sum(r)/sum(Xm)));

figure,plot(B(:,1),B(:,2),'square','MarkerSize',10,'Color','k','MarkerFaceColor','k')
xlim([0 7])
hold on;
plot(Fit(:,1),Fit(:,2),'-','Color','k','LineWidth',1.5)
plot(Fit(:,1),Fit(:,2)-(SE*1.959964),'--','Color','k','LineWidth',1) %Confidence intervals?
plot(Fit(:,1),Fit(:,2)+(SE*1.959964),'--','Color','k','LineWidth',1)
ylabel('Ammonium Production Rate (µM/hr)'); xlabel('Oxygen Consumption Rate (µM/hr)'); ylim([0 0.5]);
set(gca,'FontSize',18); set(gcf,'Color','w'); set(gca,'LineWidth',2); set(gca,'FontName','Times New Roman');


