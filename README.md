%  
% :-:-:-:-:-:-:-:-:-: Up to date INFO :-:-:-:-:-:-:-:-:  
%  
% (24/Feb/2016) Caution! Now version is only for the file 6 for now (Filterling setting or so)  
%  
% :-:-:-:-:-:-:-:-:-: Instruction :-:-:-:-:-:-:-:-:-:  
%  
% main_P300Decoder(ARG_1(directory), ARG_2(double), ARG_3(double), ARG_4(double), ARG_5(double), ARG_6(double), ARG_7(double))  
%  
% === Input ===  
%  
% ARG_1 directory(char): File directory location which has csv files generated by OpenViBE  
% ARG_2 Stimulus_1duration(double): Value of stimulus duration + ISI duration (ex. 0.4)  
% ARG_3 Stimulus_2duration(double): Value of stimulus duration * 3 + ISI duration * 2 (ex. 0.7) to show the sequence of the waves  
% ARG_4 header(double): Value of file identifier, if(training) value = 5; elseif(trial) value = 6;  
% ARG_5 Ymax(double): Ymax means the maximum value the Y axis in the graph  
% ARG_6 Ymin(double): Ymin means the minimum value the Y axis in the graph  
% ARG_7 savePNG(double): If you want to save the result of the graph, this value should be set to 1, othewise 0  
%  
% === Output ===  
%  
% Figure 1: EEG graph for averaging all the channels result in each  
% Figure 2: EEG graph for averaging result in each channel  
%  
% === Example ===  
%  
% MATLAB > main_P300Decoder('Home/User/DirectoryName', 0.4, 0.7, 6, 3, -3, 0)  
% MATLAB > main_P300Decoder('../User/DirectoryName', 0.4, 0.7, 6, 5, -5, 1)  
%  
% ::::: (C) Takumi Kodama, University of Tsukuba, Japan :::::  

