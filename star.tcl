#Create a simulator object
set ns [new Simulator]

set tracefile [open star.tr w]
$ns trace-all $tracefile

set nf [open star.nam w]
$ns namtrace-all $nf

proc finish {} {
    global ns nf
    $ns flush-trace
    close $nf
    exec nam star.nam &
    exit 0
}


set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]


$n0 shape square

$ns duplex-link $n0 $n1 1Mb 10ms DropTail
$ns duplex-link $n0 $n2 1Mb 10ms DropTail
$ns duplex-link $n0 $n3 1Mb 10ms DropTail
$ns duplex-link $n0 $n4 1Mb 10ms DropTail

set udp [new Agent/UDP]
$udp set class_ 1
$ns attach-agent $n1 $udp

set null [new Agent/Null]
$ns attach-agent $n3 $null

$ns connect $udp $null

set cbr0 [new Application/Traffic/CBR]
$cbr0 set packetSize_ 500
$cbr0 set interval_ 0.01
$cbr0 attach-agent $udp

$ns at 0.5 "$cbr0 start"
$ns at 4.5 "$cbr0 stop"
#$ns rtmodel-at 3.0 down "$n0 $n3"
#$ns loss $n0 $n3 1.0
#$ns duplex-link-op $n0 $n3 down
$ns rtmodel-at 3.0 down $n0 $n3

$ns at 5.0 "finish"

$ns run
