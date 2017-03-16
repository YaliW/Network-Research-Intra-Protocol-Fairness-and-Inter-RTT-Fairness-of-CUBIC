# Network-Research-Intra-Protocol-Fairness-and-Inter-RTT-Fairness-of-CUBIC
# Introduction
This project is about the intra-protocol fairness and inter-RTT fairness of CUBIC [1].  CUBIC is a new high-speed TCP variant, and the default TCP algorithm in Linux.  The paper is "CUBIC: A New TCP Friendly High-Speed TCP Variant". We are going to reproduce Fig. 8 and Fig. 9 of the paper on GENI testbed. Because I need to compare the intra-protocol fairness and inter-RTT fairness of CUBIC, BIC-TCP, HSTCP, and Reno so that the time to run my experiment is too long.  The total time to do the experiment is more than 20 hours.
# Background
The window growth function of CUBIC is shown in Fig. 1.   CUBIC uses the concave and convex profiles of a cubic function to increase window.  Most window samples of CUBIC are close to  the saturation point so that CUBIC protocol guarantees high network utilization and stability. Because the window growth function is independent with RTT, CUBIC has a good RTT fairness. However, the convex profile of window growth function may lead to a large burst of packet losses after the saturation point.  

![Fig. 1 Window growth function](http://imgur.com/50S0oko.jpg)

Fig. 1  Window growth function of CUBIC

Fairness is very important in Network transmission, because fairness guarantees that every user can be treated fairly and use the same resources.  Besides, good fairness is benefit to congestion control.  Hence, it is very interesting and necessary to verify the fairness of CUBIC.  In my project, we will reproduce the intra-protocol fairness and inter-RTT fairness of CUBIC protocol.  
# Result
The intra-protocol fairness is shown in Fig. 2(a) (Fig. 8 of the paper).  Intra-protocol fairness is represented by the throughput ratio of two high-speed flows of a protocol with the same RTT.  The throughput ratio shows the degree of bandwidth shares between two flows of the same protocol.  If the throughput ratio approaches to 1, it means that the protocol has a good fairness.  To verify that CUBIC has a better intra-protocol fairness, we compare CUBIC with HSTCP, BIC-TCP, and Reno.  Link utilization is shown in Fig. 2(b), and it can be computed by the ratio of all used bandwidth and bottleneck bandwidth.

![Intra-protocol fairness](http://imgur.com/3egPPeS.jpg)

Fig .2  (a) Intra-protocol fairness.  (b) Link utilization.  The bottleneck bandwidth is set to 400Mbps and 2Mbyte bottleneck buffer is used.  RTT is varies between 16ms and 324ms and two flows have the same RTT.


Inter-RTT fairness of CUBIC is shown in Fig. 3(a).  Two high-speed flows of a protocol with different RTT and background traffic of the standard TCP protocol go through the bottleneck router.  To verify the inter-RTT fairness, we measure bandwidth of two high-speed flows.  The throughput ratio of two flows of Reno is linearly proportional to the inverse of the RTT ratio, which means that the short RTT flow obtain more bandwidth than the longer RTT flow.  However, because long RTT flows use more resources along the longer path than short RTT flows, this RTT-fairness notion is acceptable.  If the RTT fairness of a protocol has a similar slope with Reno, the protocol has acceptable inter-RTT fairness.  To verify that CUBIC has a better intra-protocol fairness, we compare CUBIC with HSTCP, BIC-TCP, and Reno.  Link utilization is shown in Fig. 3(b), and it can be computed by the ratio of all used bandwidth and bottleneck bandwidth.

![Intra-RTT fairness](http://imgur.com/K6iBLro.jpg)

Fig. 3  (a) Inter-RTT fairness. (b) Link utilization.  The bottleneck bandwidth is set to 400Mbps and 2Mbyte buffer is used.  One flow has a fixed RTT of 162ms and the other flow varies its RTT from 16ms to 162ms.

Fig. 2 and Fig. 3 show that CUBIC has a good intra-protocol fairness and inter-RTT fairness even when RTT is large.  These features make CUBIC have a good performance over fast and long distance networks.  

To reproduce Fig. 2 above in the experiment, we generate two figures.  The intra-protocol fairness is shown in Fig. 4.  The link utilization is shown in Fig. 5.

![Throughput Ratio](http://imgur.com/EAruWw7.jpg)

Fig. 4  Intra-protocol fairness.   

![Link Utilization](http://imgur.com/DZ3UdO4.jpg)

Fig. 5  Link utilization.

To reproduce Fig. 3 above in the experiment, the two figures of Inter-RTT fairness and Link Utilization are generated.  The inter-RTT fairness is shown in Fig. 6.  The link utilization is shown in Fig. 7.

![Throughput Ratio](http://imgur.com/wulD7X0.jpg)

Fig. 6  Inter-RTT fairness. 

![Link Utilization](http://imgur.com/Hsm2FMG.jpg)

Fig. 7  Link utilization.

#### Comment on my result
Fig. 4 shows that Reno has good fairness when RTT is small, which means Reno only can work well on short distance network.  HSTCP shows worse fairness whenever RTT is small or large.  CUBIC and BIC-TCP have higher fairness index than HSTCP and Reno when RTT is large, which means that CUBIC and BIC-TCP have good fairness over fast and long distance network.  

In Fig. 5  HSTCP and Reno has low link utilization when RTT is large.  However, CUBIC and BIC-TCP still have high utilization whenever RTT is small or large.  CUBIC is enhanced version of BIC-TCP. It remains the strength of BIC-TCP (stability, fairness, and  scalability) , simplifies window control and enhances TCP friendliness of BIC-TCP, so CUBIC is a better choice as high-speed TCP protocol.

Fig. 6 shows that CUBIC and BIC-TCP have similar slope with Reno, so they have acceptable RTT fairness, but HSTCP has worse RTT fairness even when RTT ratio is 1.  Since CUBIC has higher RTT fairness index than BIC-TCP and Reno, CUBIC has best RTT fairness among these four TCP protocols.  The reason why CUBIC has a good RTT fairness is that the window growth function depends on the time difference of two continue congestions instead of RTT.  

The link utilization of inter-RTT fairness is shown in Fig. 7.  CUBIC, BIC-TCP, and HSTCP have high utilization, but Reno has low link utilization.  The reason is that CUBIC, BIC-TCP, and HSTCP are high-speed TCP variant so that they can use more bandwidths to transmit packets than Reno. 

The figures I reproduce are similar to the original figures, especially for CUBIC.  Form the above figures, it shows that CUBIC has a better intra-protocol fairness, intra-RTT fairness, and higher link utilization even at large RTT.  For CUBIC, the throughput ratio and link utilization do not change a lot from small RTT to large RTT, it also proves that CUBIC is stable.  It verifies that CUBIC is a good high-speed TCP protocol over fast and long distance network.  

The trend of reproducing results is similar to author's in the paper, but the magnitude is not exactly same.  
The reason may be that:

1: The original result is highly sensitive to background traffic.  Because I only use long-lived flows as background traffic, it may affect the result.  

2: Testbed experiment cannot simulate the network very well and the results fluctuate a lot when repeating the same experiment.  The deviation may influence the accuracy of results.

3: The exeriment duration in the original paper is  1200 seconds, but it is too long for me and reviewers to reproduce the experiment so that I change it to 600 seconds in my experiment design.  The running time may affect the result.

4: Different tools may affect the result.  The author uses Dummyet to set delay, but I use Netem to set delay.  

5: The delay may affect my result.  The actual delay is a little bit higher than the delay that I set by Netem, because the node also has its own delay.

Even though my reproducing result are not exactly same with the author’s, we still can prove that CUBIC has a better intra-protocol fairness, intra-RTT fairness, and a higher link utilization than other three TCP protocols.  

# Run The Experiment
The system is defined by a dumbbell network configuration with significant background traffic in both direction in testbed environment.  One router is used to setup the bottleneck bandwidth and buffer size, and the other router is the delay generator to setup RTT values in this experiment.  The two senders send traffic with high-speed TCP protocol to two receivers through routers.  The two short and long lived traffic generators are used to produce multiple comprised  flows as the background traffic. 
The network topology is shown in Fig. 8.

![Network Topology](http://i.imgur.com/0xVwsfY.png)

Fig . 8  Network Topology on GENI testbed
#### Build Network Topology on GENI
1: You can upload the RSpec that I attached on my repository on GENI, select ExoGeni aggregate (eg,OSF ExoGeni).  
2: After log into the nodes, you also need to setup routing table to make sure all nodes can ping each other by experiment interface.

At client1 node, to add routing tbale, run 
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.1.2 eth1`

At client2 node, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.2.2 eth1`

At client3 node, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.3.2 eth1`

At client4 nod, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.4.2 eth1`

At server1 node, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.6.1 eth1`

At server2 node, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.7.1 eth1`

At server3 node, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.8.1 eth1`

At server4 node, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.9.1 eth1`

At router1 node, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.5.2 eth3`
`sudo sysctl -w net.ipv4.ip_forward=1`

At router2, run
`sudo route add -net 10.0.0.0 netmask 255.0.0.0 gw 10.10.5.1 eth4`
`sudo sysctl -w net.ipv4.ip_forward=1`

When you create the same network topology, the eth interface may be different.  To make clear, the detailed information of my topology on GENI is shown in Fig. 9.

![Detail](http://i.imgur.com/gHiNLlXr.jpg?1) 

Fig. 9  Deatiled eth interface of network topology

Because eth interface is used a lot in the following commands, you may need to change it to the correct eth interface in your topology if it is different with yours.
Before the experiment, please make sure every node can ping each other and measure the bandwidth.
#### Setup TCP ptotocol in client 1-4
At client 1 and client 2, we need to send high-speed TCP flows to server 1-2.  In this experiment, we need to verify the performance of CUBIC, BIC-TCP,HSTCP,TCP-SACK.  TCP-SACK is the standard TCP protocol, so I use TCP reno to replace it.  Because CUBIC and RENO are already in linux, we only need to add BIC-TCP and HSTCP by commands.

Run the following command to add TCP protocols at client 1-2 sepateraly:
`sudo /sbin/modprobe tcp_highspeed`
`sudo /sbin/modprobe tcp_bic`

Run the following command to check the available TCP protocols:
`sudo sysctl net.ipv4.tcp_available_congestion_control`

At client 3-4, we need to send TCP flows with standard TCP procotol(reno).  Because CUBIC is the default TCP protocol on Linux, we need to change the default TCP protocol from CUBIC to RENO by the following command.
`sudo sysctl -w net.ipv4.tcp_congestion_control=reno`
#### Setup Bottleneck Bandwidth and Buffer 
At router 1, we need to set the bottleneck bandwidth 400Mbps and buffer size 2Mb.
Run the following command:
`sudo tc qdisc add dev eth3 root tbf rate 400mbps limit 2mb burst 32KB`

#### Setup Delay for every flow 
At router2, we need to setup different delay for every flow.  For background traffic, the delays are sampled randomly from a specific empirical distribution, so I run the following command to setup delay randomly.
`sudo tc qdisc add dev eth1 root netem delay 200ms 200ms`
`sudo tc qdisc add dev eth3 root netem delay 200ms 200ms`

To show what you set, please run the command:
`sudo tc qdisc show dev eth1`

To delete what you set, please run the command:
`sudo tc qdisc del dev eth1 root`

To replace what you set before, please run the command:
`sudo tc qdisc replace dev eth1 root netem delay 200ms 200ms`

The RTT of the backgroun traffic will not change any more during the experiment.

To set delay of two high-speed TCP flows, for example set delay to be 16ms by the command：
`sudo tc qdisc add dev eth5 root netem delay 16ms`
`sudo tc qdisc add dev eth2 root netem delay 16ms`

You also change show, delete, replace the delay like above.
### Setup Socket buffer size
For background traffic, the socket buffer size is default 64KB so that we do not need set it again.
For high-speed TCP flows, to make sure the flows are only limited by the congestion control algorithm, we set the socket buffer size to be very large 64MB at client 1-2 and server 1-2.

Run the following command at these 4 nodes:
`sudo sysctl -w net.core.rmem_max=67108864`
`sudo sysctl -w net.core.wmem_max=67108864`
`sudo sysctl -w net.ipv4.tcp_rmem="4096 87380 67108864"`
`sudo sysctl -w net.ipv4.tcp_wmem="4096 65536 67108864"`
`sudo sysctl -w net.ipv4.tcp_no_metrics_save=1`
`sudo syscel -w net.core.netdev_max_backlog=3000`
`sudo ifconfig eth1 txqueuelen 3000`
### Put together to run the experiment
After setting routing table, TCP protocol, bandwidth, buffer, and delays above, the next thing is to run the exeriment.
#### Intra-protocol fairness (figure 8 of the paper)
For one TCP protocol, we need to vary both high-speed flows' RTT from 16ms to 324ms (16ms,42ms, 82ms, 162ms,and 324ms).  The TCP protocols we need to verify are CUBIC, BIC-TCP, HSTCP, and Reno.

1: For example, to verify CUBIC at RTT 16ms.  Firstly, pleae set delay 16ms for two high-speed flows by the following command at router 2:
`sudo tc qdisc add dev eth5 root netem delay 16ms`
`sudo tc qdisc add dev eth2 root netem delay 16ms`

2: Set CUBIC to be the default TCP protocol at client 1-2 by the command:
`sudo sysctl -w net.ipv4.tcp_congestion_control=cubic`

3: Run `sudo apt-get install iperf3` at client 1-4 and server 1-4 before using iperf3.
Then run `iperf3 -s` at server 1-4.
Then run `iperf3 -c 10.10.8.2 -t 605 -P 12` at client 3 and `iperf3 -c 10.10.9.2 -t 605 -P 12`at client 4 at time 0 seconds to generate multiple comprised long-lived flows as background traffic.

Finally, run `iperf3 -c 10.10.6.2 -t 600 -Z cubic` at client 1 and `iperf3 -c 10.10.7.2 -t 600 -Z cubic` at client 2 at time 5 seconds to generate two high-speed flows.  If you want to set the intrval value, you can try `iperf3 -c 10.10.7.2 -t 600 -Z cubic -i 10`.

Record the TCP type (CUBIC), RTT (16ms), bandwidth of two high-speed flows, bandwidth of background traffic. 
Repeat this experiment 5 times for same TCP type and RTT.

4: To verify CUBIC at RTT 42ms, you need to change RTT to 42ms at router 2 by the command:
`sudo tc qdisc replace dev eth5 root netem delay 42ms`
`sudo tc qdisc replace dev eth2 root netem delay 42ms`
And repeat step 3 to meansure bandwidth by iperf3.
For RTT is 82ms, 162ms, and 324ms, the steps are same with above.

5: After verifying CUBIC, we start to verify BIC-TCP at RTT 16ms, 42ms, 82ms, 162ms,and 324ms.  The experiment steps are same with CUBIC except the TCP type.
Firstly, pleae set delay 16ms for two high-speed flows by the following command at router 2:
`sudo tc qdisc replace dev eth5 root netem delay 16ms`
`sudo tc qdisc replace dev eth2 root netem delay 16ms`

Then run ` sudo sysctl -w net.ipv4.tcp_congestion_control=bic`at client 1-2.

Then run `iperf3 -s` at server 1-4.

Then run `iperf3 -c 10.10.8.2 -t 605 -P 12` at client 3 and `iperf3 -c 10.10.9.2 -t 605 -P 12`at client 4 at time 0 seconds to generate multiple comprised long-lived flows as background traffic.

Finally, run `iperf3 -c 10.10.6.2 -t 600 -Z bic` at client 1 and `iperf3 -c 10.10.7.2 -t 600 -Z bic` at client 2 at time 5 seconds to generate two high-speed flows.

Record the TCP type, RTT, bandwidth of two high-speed flows, bandwidth of background traffic. 
Repeat this experiment 5 times for same TCP type and RTT.

6: For HSTCP, run the command at client 1-2:
`sudo sysctl -w net.ipv4.tcp_congestion_control=highspeed`
and replace corresponding TCP type to "highspeed";

For Reno, run the command at client 1-2:
`sudo sysctl -w net.ipv4.tcp_congestion_control=reno`
and replace corresponding TCP type to "reno".
The other steps are same with TCP type (CUBIC).
#### Inter-RTT fairness (figure 9 of the paper)
For one TCP Protocol, we need to fix one high-speed flow's RTT to be 162ms, and the other high-speed flow's RTT to vary from 16ms to 162ms(16ms, 22ms, 42ms, 82ms, and 162ms).  

1: Fix one high-speed flow's RTT to be 162ms by running the command at router 2:
`sudo tc qdisc replace dev eth5 root netem delay 162ms`

2: For example, to verify CUBIC at one RTT 16ms.  Firstly, pleae set delay 16ms for one high-speed flow by the following command at router 2:
`sudo tc qdisc replace dev eth2 root netem delay 16ms`

3: Run the command `sudo sysctl -w net.ipv4.tcp_congestion_control=cubic` to set CUBIC as the default TCP protocol at client 1-2. 

4: Run `iperf3 -s` at server 1-4.

Then run `iperf3 -c 10.10.8.2 -t 605 -P 12` at client 3 and `iperf3 -c 10.10.9.2 -t 605 -P 12`at client 4 at time 0 seconds to generate multiple comprised long-lived flows as background traffic.

Finally, run `iperf3 -c 10.10.6.2 -t 600 -Z cubic` at client 1 and `iperf3 -c 10.10.7.2 -t 600 -Z cubic` at client 2 at time 5 seconds to generate two high-speed flows.

Record the TCP type (CUBIC), RTT (16ms), bandwidth of two high-speed flows, bandwidth of background traffic. 
Repeat this experiment 5 times for same TCP type and RTT.

5: Change one RTT to 22ms by running the command ar router 2:
`sudo tc qdisc replace dev eth2 root netem delay 22ms`
Repeat step 4 above.
For RTT 42ms, 82ms, and 162ms, the steps are same.

6: Verify other TCP protocol's performance, for example BIC-TCP at one RTT 16ms.
The steps are same with above except TCP protocol type.
 
Run command `sudo sysctl -w net.ipv4.tcp_congestion_control=bic` at client 1-2.

Let client 1-2 sent two high-speed flows, run `iperf3 -c 10.10.6.2 -t 600 -Z bic` at client 1 and `iperf3 -c 10.10.7.2 -t 600 -Z bic` at client 2 at time 5 seconds.  Other steps are totally same with above.

For  HSTCP, run the command at client 1-2:
`sudo sysctl -w net.ipv4.tcp_congestion_control=highspeed`
and replace corresponding TCP type to "highspeed";

For Reno, run the command at client 1-2:
`sudo sysctl -w net.ipv4.tcp_congestion_control=reno`
and replace corresponding TCP type to "reno".
The other steps are same with TCP type (CUBIC).
# Notes
My kernel version is 3.13.0, but I think it does not matter because all of the commands are fit to most kernel version.

I use OSF ExoGENI aggregate because the maximum bandwidth is 400Mbps.  If OSF ExoGENI aggregate is not available, you also can try other ExoGENI aggregate.

To generte flows and measure bandwidth, I use 'iperf3' on Linux.
To setup delay, I use 'Netem' on Linux.
To setup bottleneck bandwidth and buffer, I use 'tc' on Linux.

# Reference:

[1]  Sangtae Ha, Injong Rhee, LiSong Xu, “CUBIC: A New TCP-Friendly High-Speed TCP Variant”, PFLDnet 2005.

[2] TCP Testing. http://netsrv.csc.ncsu.edu/wiki/index.php/TCP_Testing.

[3] Netem. http://www.linuxfoundation.org/collaborate/workgroups/networking/netem.

[4] Netem. http://man7.org/linux/man-pages/man8/tc-netem.8.html.

[5] Iperf. http://software.es.net/iperf/.

[6] Linux TCP Tuning. http://kaivanov.blogspot.com/2010/09/linux-tcp-tuning.html.

The maximum bandwidth is 400Mbps, and there are only 10 nodes, so I do not need to scale down the original experiment.  However, the deviation of testbed result is large, especially for throughput ratio, so testbed does not have a perfect ability to support the experiment.  The testbed just simulates a realistcl network, so the result is not 100% accurate, but the trend is correct.
