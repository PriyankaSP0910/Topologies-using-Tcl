#This Program will create a ring topology using less number of statements in TCL Language
set ns [new Simulator]

set tracefile [open mesh.tr w]
$ns trace-all $tracefile

set nf [open mesh.nam w]
$ns namtrace-all $nf

$ns rtproto DV

proc finish {} {
        global ns nf
        $ns flush-trace
        close $nf
        exec nam mesh.nam
        exit 0
        }

#Creating Nodes
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
#set n5 [$ns node]

#Creating Links
$ns duplex-link $n0 $n1   2Mb  10ms DropTail SFQ
$ns duplex-link $n0 $n2   2Mb  10ms DropTail SFQ
$ns duplex-link $n0 $n3   2Mb  10ms DropTail SFQ
$ns duplex-link $n0 $n4   2Mb  10ms DropTail SFQ
$ns duplex-link $n1 $n2   2Mb  10ms DropTail SFQ
$ns duplex-link $n1 $n3   2Mb  10ms DropTail SFQ
$ns duplex-link $n1 $n4   2Mb  10ms DropTail SFQ
$ns duplex-link $n2 $n3 0.3Mb 10ms DropTail SFQ
$ns duplex-link $n2 $n4 0.3Mb 10ms DropTail SFQ
$ns duplex-link $n3 $n4 0.5Mb  10ms DropTail SFQ
#$ns duplex-link $n4 $n5 0.5Mb  10ms DropTail
#$ns duplex-link $n5 $n0 0.5Mb  10ms DropTail

$ns duplex-link-op $n0 $n1 orient right-down
$ns duplex-link-op $n1 $n2 orient right
$ns duplex-link-op $n2 $n3 orient right-up
$ns duplex-link-op $n3 $n4 orient left-up
#$ns duplex-link-op $n4 $n5 orient left
#$ns duplex-link-op $n5 $n0 orient left-up


#Creating UDP agent and attching to node 0
set udp0 [new Agent/UDP]
$ns attach-agent $n0 $udp0

#Creating Null agent and attaching to node 3
set null0 [new Agent/Null]
$ns attach-agent $n2 $null0

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
$ns rtmodel-at 1.0 down $n0 $n2
$ns rtmodel-at 2.0 up $n0 $n2
#$ns at 2.0 "$ns duplex-link-op $n1 $n2 orient right-down down"
#$ns at 3.0 "$ns duplex-link-op $n1 $n2 orient right-down up"

# Schedule packet path change events
#$ns at 1.0 "$ns trace-annotate \"$ftp changes path\""
#$ns at 2.5 "$ns trace-annotate \"$ftp changes path again\""
#$ns at 3.5 "$ns trace-annotate \"$ftp changes path one more time\""
$ns at 5.0 "finish"

# Run simulation
$ns run
#$ns rtmodel-at 2.0 up $n0 $n2
$ns at 4.0 "finish"
$ns run
