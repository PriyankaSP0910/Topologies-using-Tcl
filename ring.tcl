//ring
set ns [new Simulator]

set tracefile [open ring1.tr w]
$ns trace-all $tracefile

set nf [open ring1.nam w]
$ns namtrace-all $nf

proc finish {} {
        global ns nf
        $ns flush-trace
        close $nf
        exec nam ring1.nam
        exit 0
        }

#Creating Nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

#Creating Links
$ns simplex-link $n0 $n1   2Mb  10ms DropTail
$ns simplex-link $n1 $n2   2Mb  10ms DropTail
$ns simplex-link $n2 $n3 0.3Mb 10ms DropTail
$ns simplex-link $n3 $n4 0.5Mb  10ms DropTail
$ns simplex-link $n4 $n5 0.5Mb  10ms DropTail
$ns simplex-link $n5 $n0 0.5Mb  10ms DropTail

$ns simplex-link-op $n0 $n1 orient right-up
$ns simplex-link-op $n1 $n2 orient right
$ns simplex-link-op $n2 $n3 orient right-down
$ns simplex-link-op $n3 $n4 orient left-down
$ns simplex-link-op $n4 $n5 orient left
$ns simplex-link-op $n5 $n0 orient left-up


#Creating UDP agent and attching to node 0
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

#Creating Null agent and attaching to node 3
set null0 [new Agent/Null]
$ns attach-agent $n5 $null0

$ns connect $udp0 $null0


#Creating a CBR agent and attaching it to udp0
set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 1024
$cbr0 set interval_ 0.01
$cbr0 attach-agent $udp0

#$ns rtmodel-at 0.4 down $n2 $n3
#$ns rtmodel-at 1.0 up $n2 $n2

$ns at 0.01 "$cbr0 start"
$ns at 3.5 "$cbr0 stop"

$ns at 4.0 "finish"
$ns run
