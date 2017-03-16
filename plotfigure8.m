clc;
close all;
num =5 % reprat 5 times for every experiment
bw = 400; % bottleneck bandwidth is 400Mbps
rtt = [16 42 82 162 324]; % RTT value

% FOr CUBIC protocol, the bandwidth for two high-speed flows and background
% traffic, the unit of bandwidth is Mbps
cubic_hs1_16 = [161 161 156 156 162];% RTT is 16ms, the bandwidth of high-speed flow 1
cubic_hs2_16 = [163 162 166 164 162];% RTT is 16ms, the bandwidth of high-speed flow 2
cubic_bg1_16 = [40.1 40.4 40.6 41.7 41.1];% RTT is 16ms, the bandwidth of background flows
cubic_bg2_16 = [19.1 18.2 18.9 18.5 18.5]; % RTT is 16ms, the bandwidth of background flows

cubic_hs1_42 = [156 156 155 159 156]; %RTT is 42ms
cubic_hs2_42 = [160 157 164 162 161];
cubic_bg1_42 = [39.7 40.6 40.5 39.6 40.8];
cubic_bg2_42 = [18.9 17.4 18.2 18.8 18.4];

cubic_hs1_82 = [143 159 151 157 161];%RTT is 82ms
cubic_hs2_82 = [175 165 168 167 162];
cubic_bg1_82 = [41 40 40.4 39.8 39.3];
cubic_bg2_82 = [18.6 19 18.5 18.4 18.2];

cubic_hs1_162 = [142 151 142 148 151];% RTT is 162ms
cubic_hs2_162 = [174 167 177 166 165];
cubic_bg1_162 = [41.8 43.2 42.5 41.6 41.9];
cubic_bg2_162 = [18.8 18.6 19 18.9 18.9];

cubic_hs1_324 = [155 123 127 130.5 134]; % RTT is 324ms
cubic_hs2_324 = [174 149 148 137 160.7];
cubic_bg1_324 = [41.6 52.9 51.4 42.6 54.1];
cubic_bg2_324 = [19.8 19.3 19.8 19.2 19.8];

cubic_ratio_16 = cubic_hs1_16 ./cubic_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
cubic_used_16 = cubic_hs1_16 + cubic_hs2_16 + cubic_bg1_16 + cubic_bg2_16  %used bandwidth is the sum of all flows
cubic_util_16 = cubic_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

cubic_ratio_42 = cubic_hs1_42 ./cubic_hs2_42;
cubic_used_42 = cubic_hs1_42 + cubic_hs2_42 + cubic_bg1_42 + cubic_bg2_42;
cubic_util_42 = cubic_used_42 ./ bw;

cubic_ratio_82 = cubic_hs1_82 ./cubic_hs2_82;
cubic_used_82 = cubic_hs1_82 + cubic_hs2_82 + cubic_bg1_82 + cubic_bg2_82;
cubic_util_82 = cubic_used_82 ./ bw;

cubic_ratio_162 = cubic_hs1_162 ./cubic_hs2_162;
cubic_used_162 = cubic_hs1_162 + cubic_hs2_162 + cubic_bg1_162 + cubic_bg2_162;
cubic_util_162 = cubic_used_162 ./ bw;

cubic_ratio_324 = cubic_hs1_324 ./cubic_hs2_324;
cubic_used_324 = cubic_hs1_324 + cubic_hs2_324 + cubic_bg1_324 + cubic_bg2_324;
cubic_util_324 = cubic_used_324 ./ bw;

mean_cubic_ratio = [mean(cubic_ratio_16), mean(cubic_ratio_42), mean(cubic_ratio_82), mean(cubic_ratio_162), mean(cubic_ratio_324)]; %mean of throughput ratio
std_cubic_ratio = [std(cubic_ratio_16), std(cubic_ratio_42), std(cubic_ratio_82), std(cubic_ratio_162), std(cubic_ratio_324)]
mean_cubic_util = [mean(cubic_util_16), mean(cubic_util_42), mean(cubic_util_82), mean(cubic_util_162), mean(cubic_util_324)];
std_cubic_util = [std(cubic_util_16), std(cubic_util_42), std(cubic_util_82), std(cubic_util_162), std(cubic_util_324)];

% BIC_TCP
bic_hs1_16 = [159 162 165 163 167];
bic_hs2_16 = [165 166 171 168 167];
bic_bg1_16 = [39.7 40.4 41.2 43 42];
bic_bg2_16 = [18.9 19.2 19.3 19.2 19.1];

bic_hs1_42 = [152 145 147 155 162];
bic_hs2_42 = [165 163 167.6 167 164];
bic_bg1_42 = [39.6 40.2 44.2 38.6 41];
bic_bg2_42 = [18.1 19.2 18.6 19 19.2];

bic_hs1_82 = [161 159 143 146 153];
bic_hs2_82 = [179 182 178 169 172];
bic_bg1_82 = [26.2 34.5 39.8 42.5 37.6];
bic_bg2_82 = [11.8 12.5 17.8 19.3 19.8];

bic_hs1_162 = [147 147 145 153 139];
bic_hs2_162 = [168 150 156.8 163.4 147];
bic_bg1_162 = [42.6 50.2 46.7 48.5 50];
bic_bg2_162 = [18.6 18.9 19.4 19.3 19.3];

bic_hs1_324 = [117 117 114 123 141.5];
bic_hs2_324 = [130 134 139.6 142 150];
bic_bg1_324 = [51.2 50.9 45.9 48.8 46];
bic_bg2_324 = [19.4 19.7 18.9 19.2 19.7];

bic_ratio_16 = bic_hs1_16 ./bic_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
bic_used_16 = bic_hs1_16 + bic_hs2_16 + bic_bg1_16 + bic_bg2_16  %used bandwidth is the sum of all flows
bic_util_16 = bic_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

bic_ratio_42 = bic_hs1_42 ./bic_hs2_42;
bic_used_42 = bic_hs1_42 + bic_hs2_42 + bic_bg1_42 + bic_bg2_42;
bic_util_42 = bic_used_42 ./ bw;

bic_ratio_82 = bic_hs1_82 ./bic_hs2_82;
bic_used_82 = bic_hs1_82 + bic_hs2_82 + bic_bg1_82 + bic_bg2_82;
bic_util_82 = bic_used_82 ./ bw;

bic_ratio_162 = bic_hs1_162 ./bic_hs2_162;
bic_used_162 = bic_hs1_162 + bic_hs2_162 + bic_bg1_162 + bic_bg2_162;
bic_util_162 = bic_used_162 ./ bw;

bic_ratio_324 = bic_hs1_324 ./bic_hs2_324;
bic_used_324 = bic_hs1_324 + bic_hs2_324 + bic_bg1_324 + bic_bg2_324;
bic_util_324 = bic_used_324 ./ bw;

mean_bic_ratio = [mean(bic_ratio_16), mean(bic_ratio_42), mean(bic_ratio_82), mean(bic_ratio_162), mean(bic_ratio_324)]; %mean of throughput ratio
std_bic_ratio = [std(bic_ratio_16), std(bic_ratio_42), std(bic_ratio_82), std(bic_ratio_162), std(bic_ratio_324)]
mean_bic_util = [mean(bic_util_16), mean(bic_util_42), mean(bic_util_82), mean(bic_util_162), mean(bic_util_324)];
std_bic_util = [std(bic_util_16), std(bic_util_42), std(bic_util_82), std(bic_util_162), std(bic_util_324)];

% HSTCP result
hstcp_hs1_16 = [130 136 127 138 129];
hstcp_hs2_16 = [189 176 196 184 192];
hstcp_bg1_16 = [46.4 50.2 47.5 48.3 48.5];
hstcp_bg2_16 = [19.2 19.6 19.3 19.4 19.1];

hstcp_hs1_42 = [126 119 126 132 118];
hstcp_hs2_42 = [160 165 172 179 182];
hstcp_bg1_42 = [45.2 46.3 45.9 44.8 46];
hstcp_bg2_42 = [18.8 19.2 19.5 19.7 19.8];

hstcp_hs1_82 = [119  116 118 119 123];
hstcp_hs2_82 = [183 185 168 179 183];
hstcp_bg1_82 = [48.4 48.4 48 48.9 48];
hstcp_bg2_82 = [19.1 19.5 19.4 19.6 19];

hstcp_hs1_162 = [123 115 128 119 120];
hstcp_hs2_162 = [150 154 156 149 123];
hstcp_bg1_162 = [52.5 53 52.8 51.6 52.9];
hstcp_bg2_162 = [18.8 19 19.2 18.6 18.6];

hstcp_hs1_324 = [63.9 63.9 63.8 63.9 63];
hstcp_hs2_324 = [116 121 119 123 131];
hstcp_bg1_324 = [51.2 50.8 52 53.2 54];
hstcp_bg2_324 = [19.3 19.1 19.8 19.5 19.6];

hstcp_ratio_16 = hstcp_hs1_16 ./hstcp_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
hstcp_used_16 = hstcp_hs1_16 + hstcp_hs2_16 + hstcp_bg1_16 + hstcp_bg2_16  %used bandwidth is the sum of all flows
hstcp_util_16 = hstcp_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

hstcp_ratio_42 = hstcp_hs1_42 ./hstcp_hs2_42;
hstcp_used_42 = hstcp_hs1_42 + hstcp_hs2_42 + hstcp_bg1_42 + hstcp_bg2_42;
hstcp_util_42 = hstcp_used_42 ./ bw;

hstcp_ratio_82 = hstcp_hs1_82 ./hstcp_hs2_82;
hstcp_used_82 = hstcp_hs1_82 + hstcp_hs2_82 + hstcp_bg1_82 + hstcp_bg2_82;
hstcp_util_82 = hstcp_used_82 ./ bw;

hstcp_ratio_162 = hstcp_hs1_162 ./hstcp_hs2_162;
hstcp_used_162 = hstcp_hs1_162 + hstcp_hs2_162 + hstcp_bg1_162 + hstcp_bg2_162;
hstcp_util_162 = hstcp_used_162 ./ bw;

hstcp_ratio_324 = hstcp_hs1_324 ./hstcp_hs2_324;
hstcp_used_324 = hstcp_hs1_324 + hstcp_hs2_324 + hstcp_bg1_324 + hstcp_bg2_324;
hstcp_util_324 = hstcp_used_324 ./ bw;

mean_hstcp_ratio = [mean(hstcp_ratio_16), mean(hstcp_ratio_42), mean(hstcp_ratio_82), mean(hstcp_ratio_162), mean(hstcp_ratio_324)]; %mean of throughput ratio
std_hstcp_ratio = [std(hstcp_ratio_16), std(hstcp_ratio_42), std(hstcp_ratio_82), std(hstcp_ratio_162), std(hstcp_ratio_324)]
mean_hstcp_util = [mean(hstcp_util_16), mean(hstcp_util_42), mean(hstcp_util_82), mean(hstcp_util_162), mean(hstcp_util_324)];
std_hstcp_util = [std(hstcp_util_16), std(hstcp_util_42), std(hstcp_util_82), std(hstcp_util_162), std(hstcp_util_324)];

% Standard TCP protocol Reno
reno_hs1_16 = [147 152 147 153 150];
reno_hs2_16 = [147 154 153 156 157];
reno_bg1_16 = [47.9 48.2 48.6 49.2 47.2];
reno_bg2_16 = [19.8 19.6 18.7 19.2 16.9];

reno_hs1_42 = [131 132 135 141 136];
reno_hs2_42 = [132 133 136 142 142];
reno_bg1_42 = [48.6 49.3 49.2 49.1 48.4];
reno_bg2_42 = [19.5 18.6 19.4 18.7 19.2];

reno_hs1_82 = [121 116 117 119 123];
reno_hs2_82 = [129 137 146 128 132];
reno_bg1_82 = [51.9 49.8 49.9 52 51.8];
reno_bg2_82 = [19.1 19.2 19.6 18.6 19.5];

reno_hs1_162 = [126 128 109 98 102];
reno_hs2_162 = [145 156 132 114 128];
reno_bg1_162 = [51.2 52 52.5 49.8 48.6];
reno_bg2_162 = [19.3 19.6 19.5 18.7 19.4];

reno_hs1_324 = [63.9 59 67 52 49];
reno_hs2_324 = [74.4 82 79 73 83];
reno_bg1_324 = [52.4 51.7 53.6 51.9 49.6];
reno_bg2_324 = [19.1 19.5 19.7 18.9 19.2];

reno_ratio_16 = reno_hs1_16 ./reno_hs2_16; % Throughput ratio is the bandwidth ratio between two high-speed flows
reno_used_16 = reno_hs1_16 + reno_hs2_16 + reno_bg1_16 + reno_bg2_16  %used bandwidth is the sum of all flows
reno_util_16 = reno_used_16 ./ bw; % link utilization is the ratio between used bandwidth and bottleneck bandwidth

reno_ratio_42 = reno_hs1_42 ./reno_hs2_42;
reno_used_42 = reno_hs1_42 + reno_hs2_42 + reno_bg1_42 + reno_bg2_42;
reno_util_42 = reno_used_42 ./ bw;

reno_ratio_82 = reno_hs1_82 ./reno_hs2_82;
reno_used_82 = reno_hs1_82 + reno_hs2_82 + reno_bg1_82 + reno_bg2_82;
reno_util_82 = reno_used_82 ./ bw;

reno_ratio_162 = reno_hs1_162 ./reno_hs2_162;
reno_used_162 = reno_hs1_162 + reno_hs2_162 + reno_bg1_162 + reno_bg2_162;
reno_util_162 = reno_used_162 ./ bw;

reno_ratio_324 = reno_hs1_324 ./reno_hs2_324;
reno_used_324 = reno_hs1_324 + reno_hs2_324 + reno_bg1_324 + reno_bg2_324;
reno_util_324 = reno_used_324 ./ bw;

mean_reno_ratio = [mean(reno_ratio_16), mean(reno_ratio_42), mean(reno_ratio_82), mean(reno_ratio_162), mean(reno_ratio_324)]; %mean of throughput ratio
std_reno_ratio = [std(reno_ratio_16), std(reno_ratio_42), std(reno_ratio_82), std(reno_ratio_162), std(reno_ratio_324)]
mean_reno_util = [mean(reno_util_16), mean(reno_util_42), mean(reno_util_82), mean(reno_util_162), mean(reno_util_324)];
std_reno_util = [std(reno_util_16), std(reno_util_42), std(reno_util_82), std(reno_util_162), std(reno_util_324)];

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
title('Intra-protocol fairness');

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
ylim([0.4 1]);
legend('CUBIC','BIC-TCP','HSTCP','RENO');
title('Intra-protocol fairness');