clc;
close all;
num =5 % reprat 5 times for every experiment
bw = 400; % bottleneck bandwidth is 400Mbps
rtt = [16 22 42 82 162]; % RTT value
%For one high-speed flow, RTT fixes to 162ms, the other RTT 0f high-speed
%flow varies from 16ms to 162ms
% FOr CUBIC protocol, the bandwidth for two high-speed flows and background
% traffic, the unit of bandwidth is Mbps
cubic_hs1_16 = [136 130 135 142 138];% RTT is 162ms, the bandwidth of high-speed flow 1
cubic_hs2_16 = [187 182 187 186 185];% RTT is 16ms, the bandwidth of high-speed flow 2
cubic_bg1_16 = [41.5 40 42.3 42.2 44];% RTT is 16ms, the bandwidth of background flows
cubic_bg2_16 = [18.4 18.2 19.3 19.1 18.7]; % RTT is 16ms, the bandwidth of background flows

cubic_hs1_22 = [143 142 145 147 142]; %RTT is 42ms
cubic_hs2_22 = [182 180 178 183 182];
cubic_bg1_22 = [40.5 41 42.5 43 43.5];
cubic_bg2_22 = [19.1 19 19.5 19.6 19.3];

cubic_hs1_42 = [142 143 141 146 152 ];%RTT is 82ms
cubic_hs2_42 = [180 178 185 189 183];
cubic_bg1_42 = [43.2 44 41.9 42 43];
cubic_bg2_42 = [18.9 18.9 19 19.3 19.2];

cubic_hs1_82 = [144 145 148 152 155];% RTT is 162ms
cubic_hs2_82 = [175 177 178 182 168];
cubic_bg1_82 = [42.6 43 41.9 42 42.8];
cubic_bg2_82 = [18.7 18.9 18.4 18.5 18.2];

cubic_hs1_162 = [160 164 158 157 159];% RTT is 324ms
cubic_hs2_162 = [163 167 165 162 163];
cubic_bg1_162 = [40.1 43 45.2 46.7 40];
cubic_bg2_162 = [18.3 19.2 19.4 18.7 18.5];

cubic_ratio_16 = cubic_hs1_16 ./cubic_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
cubic_used_16 = cubic_hs1_16 + cubic_hs2_16 + cubic_bg1_16 + cubic_bg2_16  %used bandwidth is the sum of all flows
cubic_util_16 = cubic_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

cubic_ratio_22 = cubic_hs1_22 ./cubic_hs2_22;
cubic_used_22 = cubic_hs1_22 + cubic_hs2_22 + cubic_bg1_22 + cubic_bg2_22;
cubic_util_22 = cubic_used_22 ./ bw;

cubic_ratio_42 = cubic_hs1_42 ./cubic_hs2_42;
cubic_used_42 = cubic_hs1_42 + cubic_hs2_42 + cubic_bg1_42 + cubic_bg2_42;
cubic_util_42 = cubic_used_42 ./ bw;

cubic_ratio_82 = cubic_hs1_82 ./cubic_hs2_82;
cubic_used_82 = cubic_hs1_82 + cubic_hs2_82 + cubic_bg1_82 + cubic_bg2_82;
cubic_util_82 = cubic_used_82 ./ bw;

cubic_ratio_162 = cubic_hs1_162 ./cubic_hs2_162;
cubic_used_162 = cubic_hs1_162 + cubic_hs2_162 + cubic_bg1_162 + cubic_bg2_162;
cubic_util_162 = cubic_used_162 ./ bw;

mean_cubic_ratio = [mean(cubic_ratio_16), mean(cubic_ratio_22), mean(cubic_ratio_42), mean(cubic_ratio_82), mean(cubic_ratio_162)]; %mean of throughput ratio
std_cubic_ratio = [std(cubic_ratio_16), std(cubic_ratio_22), std(cubic_ratio_42), std(cubic_ratio_82), std(cubic_ratio_162)]
mean_cubic_util = [mean(cubic_util_16), mean(cubic_util_22), mean(cubic_util_42), mean(cubic_util_82), mean(cubic_util_162)];
std_cubic_util = [std(cubic_util_16), std(cubic_util_22), std(cubic_util_42), std(cubic_util_82), std(cubic_util_162)];

% BIC_TCP
bic_hs1_16 = [135 132 136 138 142];
bic_hs2_16 = [193 189 187 198 199];
bic_bg1_16 = [38.1 40 40.2 41 40.5];
bic_bg2_16 = [18.5 19 19.2 18.6 18.5];

bic_hs1_22 = [135 136 139 142 130];
bic_hs2_22 = [193 190 189 184 179];
bic_bg1_22 = [39.3 40 40.3 40.6 41];
bic_bg2_22 = [17.8 18.2 18.4 19.2 19];

bic_hs1_42 = [136 135 142 136 138];
bic_hs2_42 = [193 190 198 201 203];
bic_bg1_42 = [37.5 38.9 38.5 39.4 39.5];
bic_bg2_42 = [18.1 19.4 19.5 18.5 18.6];

bic_hs1_82 = [139 146 157 162 158];
bic_hs2_82 = [190 189 182 179 174];
bic_bg1_82 = [37.1 37.5 37.4 37.6 38];
bic_bg2_82 = [18.7 18.3 17.5 18 18.1];

bic_hs1_162 = [154 158 169 174 172];
bic_hs2_162 = [170 177 174 179 183];
bic_bg1_162 = [40.7 41 38.6 37.5 36.4];
bic_bg2_162 = [18.4 19.3 19.5 19.8 18.5];

bic_ratio_16 = bic_hs1_16 ./bic_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
bic_used_16 = bic_hs1_16 + bic_hs2_16 + bic_bg1_16 + bic_bg2_16  %used bandwidth is the sum of all flows
bic_util_16 = bic_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

bic_ratio_22 = bic_hs1_22 ./bic_hs2_22;
bic_used_22 = bic_hs1_22 + bic_hs2_22 + bic_bg1_22 + bic_bg2_22;
bic_util_22 = bic_used_22 ./ bw;

bic_ratio_42 = bic_hs1_42 ./bic_hs2_42;
bic_used_42 = bic_hs1_42 + bic_hs2_42 + bic_bg1_42 + bic_bg2_42;
bic_util_42 = bic_used_42 ./ bw;

bic_ratio_82 = bic_hs1_82 ./bic_hs2_82;
bic_used_82 = bic_hs1_82 + bic_hs2_82 + bic_bg1_82 + bic_bg2_82;
bic_util_82 = bic_used_82 ./ bw;

bic_ratio_162 = bic_hs1_162 ./bic_hs2_162;
bic_used_162 = bic_hs1_162 + bic_hs2_162 + bic_bg1_162 + bic_bg2_162;
bic_util_162 = bic_used_162 ./ bw;

mean_bic_ratio = [mean(bic_ratio_16), mean(bic_ratio_22), mean(bic_ratio_42), mean(bic_ratio_82), mean(bic_ratio_162)]; %mean of throughput ratio
std_bic_ratio = [std(bic_ratio_16), std(bic_ratio_22), std(bic_ratio_42), std(bic_ratio_82), std(bic_ratio_162)]
mean_bic_util = [mean(bic_util_16), mean(bic_util_22), mean(bic_util_42), mean(bic_util_82), mean(bic_util_162)];
std_bic_util = [std(bic_util_16), std(bic_util_22), std(bic_util_42), std(bic_util_82), std(bic_util_162)];

% HSTCP result
hstcp_hs1_16 = [122 123 117 113 110];
hstcp_hs2_16 = [184 184 186 179 178];
hstcp_bg1_16 = [53.4 55.5 57.5 57 56.5];
hstcp_bg2_16 = [19.7 18.5 18.7 18.2 18];

hstcp_hs1_22 = [108 104 108 105 108];
hstcp_hs2_22 = [187 189 182 179 175];
hstcp_bg1_22 = [54.8 53 52.7 51.8 54];
hstcp_bg2_22 = [19.4 19 19.4 19.2 18.4];

hstcp_hs1_42 = [121 120 123 128 115];
hstcp_hs2_42 = [185 190 195 201 189];
hstcp_bg1_42 = [47.3 48 49.3 49.8 48];
hstcp_bg2_42 = [20 19.5 18.3 17.5 19.9];

hstcp_hs1_82 = [125 128 137 129 128];
hstcp_hs2_82 = [171 181 178 174 179];
hstcp_bg1_82 = [45 44.5 44.3 42.9 44];
hstcp_bg2_82 = [19.7 19.8 19.5 19.6 19.4];

hstcp_hs1_162 = [127 122 118 103 105];
hstcp_hs2_162 = [154 169 172 175 177];
hstcp_bg1_162 = [49.1 49 49.4 49.6 48.5];
hstcp_bg2_162 = [20.5 20.5 19.8 19.8 19.6];

hstcp_ratio_16 = hstcp_hs1_16 ./hstcp_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
hstcp_used_16 = hstcp_hs1_16 + hstcp_hs2_16 + hstcp_bg1_16 + hstcp_bg2_16;  %used bandwidth is the sum of all flows
hstcp_util_16 = hstcp_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

hstcp_ratio_22 = hstcp_hs1_22 ./hstcp_hs2_22;
hstcp_used_22 = hstcp_hs1_22 + hstcp_hs2_22 + hstcp_bg1_22 + hstcp_bg2_22;
hstcp_util_22 = hstcp_used_22 ./ bw;

hstcp_ratio_42 = hstcp_hs1_42 ./hstcp_hs2_42;
hstcp_used_42 = hstcp_hs1_42 + hstcp_hs2_42 + hstcp_bg1_42 + hstcp_bg2_42;
hstcp_util_42 = hstcp_used_42 ./ bw;

hstcp_ratio_82 = hstcp_hs1_82 ./hstcp_hs2_82;
hstcp_used_82 = hstcp_hs1_82 + hstcp_hs2_82 + hstcp_bg1_82 + hstcp_bg2_82;
hstcp_util_82 = hstcp_used_82 ./ bw;

hstcp_ratio_162 = hstcp_hs1_162 ./hstcp_hs2_162;
hstcp_used_162 = hstcp_hs1_162 + hstcp_hs2_162 + hstcp_bg1_162 + hstcp_bg2_162;
hstcp_util_162 = hstcp_used_162 ./ bw;

mean_hstcp_ratio = [mean(hstcp_ratio_16), mean(hstcp_ratio_22), mean(hstcp_ratio_42), mean(hstcp_ratio_82), mean(hstcp_ratio_162)]; %mean of throughput ratio
std_hstcp_ratio = [std(hstcp_ratio_16), std(hstcp_ratio_22), std(hstcp_ratio_42), std(hstcp_ratio_82), std(hstcp_ratio_162)]
mean_hstcp_util = [mean(hstcp_util_16), mean(hstcp_util_22), mean(hstcp_util_42), mean(hstcp_util_82), mean(hstcp_util_162)];
std_hstcp_util = [std(hstcp_util_16), std(hstcp_util_22), std(hstcp_util_42), std(hstcp_util_82), std(hstcp_util_162)];

% Standard TCP protocol Reno
reno_hs1_16 = [112 113 115 129 109];
reno_hs2_16 = [176 182 190 189 183];
reno_bg1_16 = [48.6 48.9 48.5 49.3 49];
reno_bg2_16 = [19.9 19.8 19.4 19.2 19];

reno_hs1_22 = [103 105 109 112 107];
reno_hs2_22 = [165 159 158 165 163];
reno_bg1_22 = [50.3 50 49.4 48.9 49];
reno_bg2_22 = [18.7 19 19.2 18.9 19];

reno_hs1_42 = [109 108 98 100 116];
reno_hs2_42 = [158 165 166 168 151 ];
reno_bg1_42 = [49.5 48.1 48.3 49 48.2];
reno_bg2_42 = [19.2 18.5 18.5 18.5 18.3];

reno_hs1_82 = [98 95 103 104 100];
reno_hs2_82 = [138 139 138 137 142];
reno_bg1_82 = [46.3 45.4 45.9 46 46.2];
reno_bg2_82 = [20.3 20.2 20 20.3 20.2];

reno_hs1_162 = [95.1 95 96 109 107];
reno_hs2_162 = [132 128 127 119 125];
reno_bg1_162 = [48.4 45.2 46.3 47.5 48];
reno_bg2_162 = [19.7 19.8 19.5 19.3 19.4];

reno_ratio_16 = reno_hs1_16 ./reno_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
reno_used_16 = reno_hs1_16 + reno_hs2_16 + reno_bg1_16 + reno_bg2_16  %used bandwidth is the sum of all flows
reno_util_16 = reno_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

reno_ratio_22 = reno_hs1_22 ./reno_hs2_22;
reno_used_22 = reno_hs1_22 + reno_hs2_22 + reno_bg1_22 + reno_bg2_22;
reno_util_22 = reno_used_22 ./ bw;

reno_ratio_42 = reno_hs1_42 ./reno_hs2_42;
reno_used_42 = reno_hs1_42 + reno_hs2_42 + reno_bg1_42 + reno_bg2_42;
reno_util_42 = reno_used_42 ./ bw;

reno_ratio_82 = reno_hs1_82 ./reno_hs2_82;
reno_used_82 = reno_hs1_82 + reno_hs2_82 + reno_bg1_82 + reno_bg2_82;
reno_util_82 = reno_used_82 ./ bw;

reno_ratio_162 = reno_hs1_162 ./reno_hs2_162;
reno_used_162 = reno_hs1_162 + reno_hs2_162 + reno_bg1_162 + reno_bg2_162;
reno_util_162 = reno_used_162 ./ bw;

mean_reno_ratio = [mean(reno_ratio_16), mean(reno_ratio_22), mean(reno_ratio_42), mean(reno_ratio_82), mean(reno_ratio_162)]; %mean of throughput ratio
std_reno_ratio = [std(reno_ratio_16), std(reno_ratio_22), std(reno_ratio_42), std(reno_ratio_82), std(reno_ratio_162)]
mean_reno_util = [mean(reno_util_16), mean(reno_util_22), mean(reno_util_42), mean(reno_util_82), mean(reno_util_162)];
std_reno_util = [std(reno_util_16), std(reno_util_22), std(reno_util_42), std(reno_util_82), std(reno_util_162)];

% plot 
figure(1);clf;
errorbar(rtt, mean_cubic_ratio, std_cubic_ratio, '-ob');
hold on;
errorbar(rtt, mean_bic_ratio, std_bic_ratio, '-*r');
hold on;
errorbar(rtt, mean_hstcp_ratio, std_hstcp_ratio, '-xk');
hold on;
errorbar(rtt, mean_reno_ratio, std_reno_ratio, '-og');
hold on;
ylim([0.4 1]);
xlabel('RTT(ms)');
ylabel('Throughout Ratio');
legend('CUBIC','BIC-TCP','HSTCP','RENO');
title('Inter-RTT fairness');

figure(2);clf;
errorbar(rtt, mean_cubic_util, std_cubic_util, '-ob');
hold on;
errorbar(rtt, mean_bic_util, std_bic_util, '-*r');
hold on;
errorbar(rtt, mean_hstcp_util, std_hstcp_util, '-xk');
hold on;
errorbar(rtt, mean_reno_util, std_reno_util, '-og');
hold on;
xlabel('RTT(ms)');
ylabel('Link utilization');
title('Inter-RTT fairness');
ylim([0.4 1]);
legend('CUBIC','BIC-TCP','HSTCP','RENO');