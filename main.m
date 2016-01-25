function main(AllCh_TargetCSV, AllCh_NonTargetCSV, Stimulus_duration)

%::::::::::::::: ?(^o^)? Inputs ?(^o^)? :::::::::::::::::
% ARG1 == .csv file which only contains TARGET stimulus 
% ARG2 == .csv file which only contains Non-TARGET stimulus 
%      -- These files could be generated using the dispense patch which issued by me
%      -- https://github.com/shartsu/OpenViBETargetSeparatorP300
% ARG3 == Stimulus_duration (this value may 0.8 but depents on its environment) 
%::::: (C) Takumi Kodama, University of Tsukuba, Japan :::::

%Firstly choose the target file(s)
[AllTargetData, Sampling_Hz, Electrodes] = fileProcessor(AllCh_TargetCSV);
%Secondly choose the non-target file(s)
[AllNonTargetData] = fileProcessor(AllCh_NonTargetCSV);

%Check how many data acquired
whos AllTargetData;
whos AllNonTargetData;
%Electrodes

Duration_points = floor(Sampling_Hz * Stimulus_duration);

%Take BP Filter (5Hz-27Hz) and Downsampling (256Hz -> 64Hz)
[AllTargetData_Filtered_P300_DownSampled_64Hz, AllNonTargetData_Filtered_P300_DownSampled_64Hz, Duration_points_64Hz] = ...
    TakeLPF4AllCh(AllTargetData, AllNonTargetData, Electrodes, Duration_points);

whos AllTargetData_Filtered_P300_DownSampled_64Hz;
whos AllNonTargetData_Filtered_P300_DownSampled_64Hz;
Duration_points_64Hz

% === Data exploit from files % === 
[EachElectrodeAveragedTarget2d, SEEachElectrodeTarget2d, EachElectrodeAveragedNonTarget2d, SEEachElectrodeNonTarget2d, ...
    MeanAllElectrodeTarget1d, SEAllTarget1d, MeanAllElectrodeNonTarget1d, SEAllNonTarget1d] = ...
    getERPfromCSV(AllTargetData_Filtered_P300_DownSampled_64Hz, AllNonTargetData_Filtered_P300_DownSampled_64Hz, Duration_points_64Hz);

% === MeanAveragedGraph % === 
OV2ERPGraph(MeanAllElectrodeTarget1d, SEAllTarget1d, ...
    MeanAllElectrodeNonTarget1d, SEAllNonTarget1d, Stimulus_duration, Duration_points_64Hz)

% === EachElectrodeGraph % === 
if(length(Electrodes) == 8); OV2ERPGraph_Electrode_8(EachElectrodeAveragedTarget2d, SEEachElectrodeTarget2d, EachElectrodeAveragedNonTarget2d, SEEachElectrodeNonTarget2d, Stimulus_duration, Duration_points_64Hz, Electrodes); end
if(length(Electrodes) == 12); OV2ERPGraph_Electrode_12(EachElectrodeAveragedTarget2d, SEEachElectrodeTarget2d, EachElectrodeAveragedNonTarget2d, SEEachElectrodeNonTarget2d, Stimulus_duration, Duration_points_64Hz, Electrodes); end
if(length(Electrodes) == 16); OV2ERPGraph_Electrode_16(EachElectrodeAveragedTarget2d, SEEachElectrodeTarget2d, EachElectrodeAveragedNonTarget2d, SEEachElectrodeNonTarget2d, Stimulus_duration, Duration_points_64Hz, Electrodes); end

end