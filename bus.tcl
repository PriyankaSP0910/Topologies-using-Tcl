LanRouter set debug_ 0 

set ns [new Simulator]

set tracefile [open bus.tr w]
$ns trace-all $tracefile

set nf [open bus.nam w]
$ns namtrace-all $nf

proc finish {} {
global ns nf
$ns flush-trace
close $nf
exec nam bus.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]

set lan1 [$ns newLan "$n0 $n1 $n2 $n3 $n4" 100Mbps 5ms LL Queue/DropTail MAC/Csma/Cd Channel]

set tcp [new Agent/TCP]
$tcp set class_ 1
$ns attach-agent $n1 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink
$ns connect $tcp $sink

set cbr [new Application/Traffic/CBR]
$cbr set packetsize_ 500
$cbr set interval_ 0.01
$cbr attach-agent $tcp


$ns at 0.5 "$cbr start"
$ns at 4.5 "$cbr stop"
$ns at 5.0 "finish"

$ns run
