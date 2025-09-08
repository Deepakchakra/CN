set ns [new Simulator]
set nf [open "prog2.nam" w]
$ns namtrace-all $nf
set tf [open "prog2.tr" w]
$ns trace-all $tf
proc finish {} {
    global ns nf tf
    $ns flush-trace
    close $nf
    close $tf
    exec nam prog2.nam &
    exit 0
}
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
$ns duplex-link $n0 $n4 10mb 10ms DropTail
$ns duplex-link $n1 $n4 5mb 15ms DropTail
$ns duplex-link $n2 $n4 7mb 20ms DropTail
$ns duplex-link $n3 $n4 15mb 25ms DropTail
$ns duplex-link $n5 $n4 9mb 100ms DropTail
$ns queue-limit $n0 $n4 5
$ns queue-limit $n1 $n4 4
$ns queue-limit $n2 $n4 3
$ns queue-limit $n3 $n4 5
$ns queue-limit $n5 $n4 3
set P1 [new Agent/Ping]
$ns attach-agent $n0 $P1
$P1 set packetSize_ 5000
$P1 set interval_ 0.0001
set P2 [new Agent/Ping]
$ns attach-agent $n1 $P2
set P3 [new Agent/Ping]
$ns attach-agent $n2 $P3
$P3 set packetSize_ 2000
$P3 set interval_ 0.00001
set P4 [new Agent/Ping]
$ns attach-agent $n3 $P4
set P5 [new Agent/Ping]
$ns attach-agent $n5 $P5
Agent/Ping instproc recv {from rtt} {
$self instvar node_
puts "node [$node_ id] recieved answer from $from with roundtrip time $rtt msec"
}
$ns connect $P1 $P5
$ns connect $P3 $P4
$ns at 0.1 "$P1 send"
$ns at 0.2 "$P1 send"
$ns at 0.3 "$P1 send"
$ns at 0.4 "$P1 send"
$ns at 0.5 "$P1 send"
$ns at 0.6 "$P1 send"
$ns at 0.7 "$P1 send"
$ns at 0.8 "$P1 send"
$ns at 0.9 "$P1 send"
$ns at 1.0 "$P1 send"
$ns at 0.1 "$P3 send"
$ns at 0.2 "$P3 send"
$ns at 0.3 "$P3 send"
$ns at 0.4 "$P3 send"
$ns at 0.5 "$P3 send"
$ns at 0.6 "$P3 send"
$ns at 0.7 "$P3 send"
$ns at 0.8 "$P3 send"
$ns at 0.9 "$P3 send"
$ns at 1.0 "$P3 send"
$ns at 2.0 "finish"
$ns run
