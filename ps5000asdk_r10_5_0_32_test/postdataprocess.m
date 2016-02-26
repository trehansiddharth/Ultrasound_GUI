clc;
close all;
clear all;

% ROI: line #2100 - #2300
%% load RF data
path = 'D:\MIT\Research\SW data\'; % change the parent folder
file = 'blck_run_B-1_50Hz_s_1000tri.mat'; % modify the file name
name = file;
load([path, file]);
dataA = dataA'; % dataA is now m-by-n matrix, m is nSamples, n is nCap
dataA_ori = dataA;

%% add region of interest??
nsamples = size(dataA, 1);


%% tracing and displacement evaluation 
nCap = size(dataA,2);
nSamples = size(dataA,1);
begin_line = 1;
end_line = nCap-1;
traces = zeros(nSamples, end_line - begin_line + 1); % create an empty tracing matrix
traces(:,1) = 1:nSamples; % the first column of the trace matix would be the row index
D = 25; % decimation rate in displacement estimation for speedup, e.g.: D = 1 computes all samples along the waveforms     

for i = 2:size(traces,2)
    
   % % ====== absolute estimation w.r.t. the first waveform (less accurate estimation due to waveform change)=====   
   disp(['Now computing displacement: ', num2str(i)]);
   [displacement index] = estimate_displace(dataA(:,begin_line)', dataA(:,begin_line+i-1)', 0, D);
   
   traces(:,i) = traces(:,1);   
   traces(index,i) = traces(index,1) + displacement;
   % % ====== absolute estimation w.r.t. the first waveform (less accurate estimation due to waveform change)=====
   
%    % % ====== accumulated estimation (less prefered; drift could occur; only for reference)=====   
%    [displacement index] = estimate_displace(dataA(:,i-1)', dataA(:,i)', 0);
%    
%    % interpolation on the displacement values, to obtain displacement at
%    % the current (non-integer) positions (i.e. traces(:,i-1); values outside the valid range are assigned 0)
%    interp_displacement = interp1(index,displacement,traces(:,i-1),'linear',0);       
%    traces(:,i) = traces(:,i-1) + interp_displacement;
%    % % ====== accumulated estimation (less prefered; drift could occur; only for reference)=====      
end   

%clear suptrace
suptrace(1,:) = [1:999];%superficial trace what is this superficial trace??
suptrace(2,:) = zeros(1,999);

% this visualization code only works for "absolute estimation w.r.t. the first waveform"
% fig_trace = figure;
% for i = index(1):D:size(traces,1)
%     figure(fig_trace); plot(-traces(i,:)); hold on;
%     title(file)
% end    
% 
% fig_trace = figure;
% for i = index(1):D:size(traces,1)
%     figure(fig_trace); plot(-traces(i,:)); hold on;
%     title(file)
%     %figure(fig_trace); plot(mean(traces(i,:))-traces(i,:)); hold on;
% end    

%% max depth: ??what does maximun depth mean? how to calculate maxdepth?

%maxdepth = 5035;
maxdepth = 2235;

%% plot stuff:
for i = 1:10:length(index)
    row = index(i);
    plot(traces(row,:)); 
    hold on;
    title(file)
end 