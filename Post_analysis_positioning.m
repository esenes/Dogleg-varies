%% Post-analysis positioning correction
%just a draft, be extremely careful on saving routine!
close all; clc; clearvars;
%load
uiopen('load')

tocorr = {...
    'g_20160923180310_441_B0',...
    'g_20160924202514_662_B0',...
    'g_20160925015802_854_B0',...
    'g_20160925065336_666_B0',...
    };

BDs = tocorr

%% 
ttlst = fieldnames(BD_struct);
for l=1:length(ttlst)
    data_struct.(ttlst{l}) = BD_struct.(ttlst{l});
end



%% plot and position
    f1=figure;
    figure(f1)
    timescale = 0:4e-9:799*4e-9;
    
    for n=1:length(BDs)
        %display timestamp
        disp([ BDs{n} ' is the number ' num2str(n) ' on ' num2str(length(BDs)) ])
        %get the current data
        INC_c = data_struct.(BDs{n}).INC.data;
        TRA_c = data_struct.(BDs{n}).TRA.data;
        REF_c = data_struct.(BDs{n}).REF.data;
        %check if the backup pulses are recorded
        precName = [BDs{n}(1:end-2) 'L1'];
        if isfield(data_struct,precName)% The backup pulse is present
            
            %grasp data 
            INC_prev = data_struct.(precName).INC.data;
            TRA_prev = data_struct.(precName).TRA.data;
            REF_prev = data_struct.(precName).REF.data;
            INC_prev_cal = data_struct.(precName).INC.data_cal;
            TRA_prev_cal = data_struct.(precName).TRA.data_cal;
            REF_prev_cal = data_struct.(precName).REF.data_cal;
            INC_c_cal = data_struct.(BDs{n}).INC.data_cal;
            TRA_c_cal = data_struct.(BDs{n}).TRA.data_cal;
            REF_c_cal = data_struct.(BDs{n}).REF.data_cal;
            BPM1_c = data_struct.(BDs{n}).BPM1.data_cal;
            BPM2_c = data_struct.(BDs{n}).BPM2.data_cal;
            inc_tra_c = data_struct.(BDs{n}).inc_tra;
            inc_ref_c = data_struct.(BDs{n}).inc_ref;
            
            %data already there
            TRAfall = data_struct.(BDs{n}).position.edge.time_TRA;
            REFraise = data_struct.(BDs{n}).position.edge.time_REF;
            
            %plotting
            figure(f1);
                plot(timescale, INC_c, '- b',...
                     timescale, INC_prev, '-- b',...
                     timescale, TRA_c,'- r',...
                     timescale, TRA_prev,'-- r',...
                     timescale, REF_c,'- g',...
                     timescale, REF_prev,'-- g')
                disp(data_struct.(BDs{n}).name)
                legend({'INC','TRA','REF'})
            

            xlim([0.450e-6 2.70e-6])
            xlabel('Time (s)')
            ylabel('Power (W)')
    
            line([TRAfall TRAfall], ylim, 'Color', 'r','LineWidth',1) %vertical line
            line([REFraise REFraise], ylim, 'Color', 'g','LineWidth',1) %vertical line
            

            
 

            % manual correction
            str = input('time_ind_TRA =   ','s');
            dcm_obj = datacursormode;
            info_struct = getCursorInfo(dcm_obj);
            if isfield(info_struct, 'Position')
                time_TRA = info_struct.Position(1);
                ind_TRA = find(timescale<=time_TRA,1,'last');%get index from time
                gone = true;
            else
                disp('Please type: ')
                str = input('time_ind_TRA =   ','s');
                time_TRA = str2double(str);
                ind_TRA = find(timescale<=time_TRA,1,'last');%get index from time
            end
            
            str = input('time_ind_REF =   ','s');
            info_struct = getCursorInfo(dcm_obj);
            if isfield(info_struct, 'Position')
                time_REF = info_struct.Position(1);
                ind_REF = find(timescale<=time_REF,1,'last');%get index from time
            else
                disp('Please type: ')
                str = input('time_ind_REF =   ','s');
                time_REF = str2double(str);
                ind_REF = find(timescale<=time_REF,1,'last'); %get index from time
            end
            
            %CREATE OUTPUT STRUCT
            %edge
            data_struct.(BDs{n}).position.edge.ind_REF = ind_REF; 
            data_struct.(BDs{n}).position.edge.time_REF = time_REF;
            data_struct.(BDs{n}).position.edge.ind_TRA = ind_TRA;
            data_struct.(BDs{n}).position.edge.time_TRA = time_TRA;
            BD_struct.(BDs{n}).position.edge.ind_REF = ind_REF; 
            BD_struct.(BDs{n}).position.edge.time_REF = time_REF;
            BD_struct.(BDs{n}).position.edge.ind_TRA = ind_TRA;
            BD_struct.(BDs{n}).position.edge.time_TRA = time_TRA;


        else % NO PREV PULSE
            disp('no prev pulse')
            
            %grasp data 
            INC_c_cal = data_struct.(BDs{n}).INC.data_cal;
            TRA_c_cal = data_struct.(BDs{n}).TRA.data_cal;
            REF_c_cal = data_struct.(BDs{n}).REF.data_cal;
            BPM1_c = data_struct.(BDs{n}).BPM1.data_cal;
            BPM2_c = data_struct.(BDs{n}).BPM2.data_cal;
            inc_tra_c = data_struct.(BDs{n}).inc_tra;
            inc_ref_c = data_struct.(BDs{n}).inc_ref;
            
            %data already there
            TRAfall = data_struct.(BDs{n}).position.edge.time_TRA;
            REFraise = data_struct.(BDs{n}).position.edge.time_REF;
            
            %plotting
            figure(f1);
                plot(timescale, INC_c, '- b',...
                     timescale, TRA_c,'- r',...
                     timescale, REF_c,'- g')
                disp(data_struct.(BDs{n}).name)
                legend({'INC','TRA','REF'})
            

            xlim([0.450e-6 2.70e-6])
            xlabel('Time (s)')
            ylabel('Power (W)')
    
            line([TRAfall TRAfall], ylim, 'Color', 'r','LineWidth',1) %vertical line
            line([REFraise REFraise], ylim, 'Color', 'g','LineWidth',1) %vertical line
            

            
 

            % manual correction
            str = input('time_ind_TRA =   ','s');
            dcm_obj = datacursormode;
            info_struct = getCursorInfo(dcm_obj);
            if isfield(info_struct, 'Position')
                time_TRA = info_struct.Position(1);
                ind_TRA = find(timescale<=time_TRA,1,'last');%get index from time
                gone = true;
            else
                disp('Please type: ')
                str = input('time_ind_TRA =   ','s');
                time_TRA = str2double(str);
                ind_TRA = find(timescale<=time_TRA,1,'last');%get index from time
            end
            
            str = input('time_ind_REF =   ','s');
            info_struct = getCursorInfo(dcm_obj);
            if isfield(info_struct, 'Position')
                time_REF = info_struct.Position(1);
                ind_REF = find(timescale<=time_REF,1,'last');%get index from time
            else
                disp('Please type: ')
                str = input('time_ind_REF =   ','s');
                time_REF = str2double(str);
                ind_REF = find(timescale<=time_REF,1,'last'); %get index from time
            end
            
            %CREATE OUTPUT STRUCT
            %edge
            data_struct.(BDs{n}).position.edge.ind_REF = ind_REF; 
            data_struct.(BDs{n}).position.edge.time_REF = time_REF;
            data_struct.(BDs{n}).position.edge.ind_TRA = ind_TRA;
            data_struct.(BDs{n}).position.edge.time_TRA = time_TRA;
            BD_struct.(BDs{n}).position.edge.ind_REF = ind_REF; 
            BD_struct.(BDs{n}).position.edge.time_REF = time_REF;
            BD_struct.(BDs{n}).position.edge.ind_TRA = ind_TRA;
            BD_struct.(BDs{n}).position.edge.time_TRA = time_TRA;
            
        end 
    

         pause;
    end
    disp('Saving ...')
    fileattrib(['/Users/esenes/swap_out/exp/' 'Exp_analized_Loaded43MW_11'  '.mat'],'+w','a');
    save(['/Users/esenes/swap_out/exp/' 'Exp_analized_Loaded43MW_11'  '.mat'],...
        'data_struct','BDs_ts',...
        'BD_struct','edge_delay','corr_delay','corr_fail','-v7.3');
    fileattrib(['/Users/esenes/swap_out/exp/' 'Exp_analized_Loaded43MW_11'  '.mat'],'-w','a');
    disp('Done.')
    
    