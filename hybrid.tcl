# Create a simulator object
set ns [new Simulator]

# Open trace files for simulation results
set tracefile [open hybrid.tr w]
$ns trace-all $tracefile

set nf [open hybrid.nam w]
$ns namtrace-all $nf

$ns rtproto DV

# Define a procedure to finish the simulation
proc finish {} {
    global ns nf
    $ns flush-trace
    close $nf
    exec nam hybrid.nam &
    exit 0
}

# Create nodes for the star topology
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]


# Create nodes for the mesh topology
set m0 [$ns node]
set m1 [$ns node]
set m2 [$ns node]
set m3 [$ns node]
set m4 [$ns node]
set m5 [$ns node]
set m6 [$ns node]

$ns duplex-link $n0 $n1 10Mb 5ms DropTail
$ns duplex-link $n1 $n2 10Mb 5ms DropTail
$ns duplex-link $n2 $n3 10Mb 5ms DropTail
$ns duplex-link $n3 $n0 10Mb 5ms DropTail

# Add links to connect the star topology nodes
$ns duplex-link $m0 $m1 2Mb 20ms DropTail
$ns duplex-link $m0 $m2 2Mb 20ms DropTail
$ns duplex-link $m0 $m3 2Mb 20ms DropTail
$ns duplex-link $m0 $n0 2Mb 20ms DropTail

# Add links to connect the star topology nodes
$ns duplex-link $m4 $n1 2Mb 20ms DropTail
$ns duplex-link $m4 $m5 2Mb 20ms DropTail
$ns duplex-link $m4 $m6 2Mb 20ms DropTail


$ns duplex-link-op $n0 $n1 orient up 
$ns duplex-link-op $n1 $n2 orient right
$ns duplex-link-op $n2 $n3 orient down
$ns duplex-link-op $n3 $n0 orient left


set tcp [new Agent/TCP]
$tcp set class_ 1
$ns attach-agent $m1 $tcp

set sink [new Agent/TCPSink]
$ns attach-agent $m6 $sink

$ns connect $tcp $sink

set ftp [new Application/FTP]
$ftp set packetSize_ 500
$ftp set interval_ 0.01
$ftp attach-agent $tcp

$ns at 0.5 "$ftp start"
$ns at 4.5 "$ftp stop"
#$ns at 1.0 "$ns link-down $n2 $n3"
#$ns at 3.0 "$ns link-up $n2 $n3"

$ns rtmodel-at 0.7 down $n0 $n1
$ns rtmodel-at 1.0 up $n0 $n1

$ns at 5.0 "finish"

$ns run



