set ns [new Simulator]
set nf [open prog2.nam w]
$ns namtrace-all $nf
set tf [open prog2.tr w]
$ns trace-all $tf
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
$ns duplex-link $n0 $n4 10kb 100ms DropTail
$ns duplex-link $n1 $n4 10kb 100ms DropTail
$ns duplex-link $n2 $n4 10kb 100ms DropTail
$ns duplex-link $n3 $n4 10kb 100ms DropTail
$ns duplex-link $n5 $n4 10kb 100ms DropTail
$ns queue-limit $n0 $n4 10
$ns queue-limit $n1 $n4 10
$ns queue-limit $n2 $n4 10
$ns queue-limit $n3 $n4 10
$ns queue-limit $n5 $n4 10
set p1 [new Agent/PING]
$ns attach-agent $no $p1
set p2 [new Agent/PING]
$ns attach-agent $n1 $p2
set p3 [new Agent/PING]
$ns attach-agent $n2 $p3
set p4 [new Agent/PING]
$ns attach-agent $n3 $p4
set p5 [new Agent/PING]
$ns attach-agent $n5 $p5
Agent / ping instproc {from vtt}{
$self instvar node_
puts "node [$node_id] received answer from 
$from with round trip time $rttmsec"
}
$ns connect $p1 $p5
$ns connect $p3 $p4
$ns at 0.1 "$p1 send"
$ns at 0.2 "$p1 send"
$ns at 0.3 "$p1 send"
$ns at 0.4 "$p1 send"
$ns at 0.5 "$p1 send"
$ns at 0.6 "$p1 send"
$ns at 0.7 "$p1 send"
$ns at 0.8 "$p1 send"
$ns at 0.9 "$p1 send"
$ns at 1.0 "$p1 send"
$ns at 0.1 "$p3 send"
$ns at 0.2 "$p3 send"
$ns at 0.3 "$p3 send"
$ns at 0.4 "$p3 send"
$ns at 0.5 "$p3 send"
$ns at 0.6 "$p3 send"
$ns at 0.7 "$p3 send"
$ns at 0.8 "$p3 send"
$ns at 0.9 "$p3 send"
$ns at 1.0 "$p3 send"
$ns at 2.0 "finisf"
$ns run 

