#!/usr/bin/perl -w

use Test::Inter;
$t = new Test::Inter 'GetPrev';
$testdir = '';
$testdir = $t->testdir();

BEGIN {
   $Date::Manip::Backend = 'DM5';
}

use Date::Manip;

Date_Init("TZ=EST");

$tests ="

'Fri Nov 22 1996 17:49:30' thu 0 => 1996112117:49:30

'Fri Nov 22 1996 17:49:30' thu 1 => 1996112117:49:30

'Fri Nov 22 1996 17:49:30' fri 0 => 1996111517:49:30

'Fri Nov 22 1996 17:49:30' 5 0 => 1996111517:49:30

'Fri Nov 22 1996 17:49:30' fri 1 => 1996112217:49:30

'Fri Nov 22 1996 17:49:30' fri 0 18:30 => 1996111518:30:00

'Fri Nov 22 1996 17:49:30' fri 0 18:30:45 => 1996111518:30:45

'Fri Nov 22 1996 17:49:30' fri 0 18 30 => 1996111518:30:00

'Fri Nov 22 1996 17:49:30' fri 0 18 30 45 => 1996111518:30:45

'Fri Nov 22 1996 17:49:30' fri 1 18 30 45 => 1996112218:30:45

'Fri Nov 22 1996 17:49:30' fri 2 18 30 45 => 1996111518:30:45

'Fri Nov 22 1996 17:49:30' '' 0 18 => 1996112118:00:00

'Fri Nov 22 1996 17:49:33' '' 0 18:30 => 1996112118:30:00

'Fri Nov 22 1996 17:49:33' '' 0 18 30 => 1996112118:30:00

'Fri Nov 22 1996 17:49:33' '' 0 18:30:45 => 1996112118:30:45

'Fri Nov 22 1996 17:49:33' '' 0 18 30 45 => 1996112118:30:45

'Fri Nov 22 1996 17:49:33' '' 0 18 '' 45 => 1996112118:00:45


'Fri Nov 22 1996 17:00:00' '' 0 17 => 1996112117:00:00

'Fri Nov 22 1996 17:00:00' '' 1 17 => 1996112217:00:00

'Fri Nov 22 1996 17:49:00' '' 0 17 49 => 1996112117:49:00

'Fri Nov 22 1996 17:49:00' '' 1 17 49 => 1996112217:49:00

'Fri Nov 22 1996 17:49:33' '' 0 17 49 33 => 1996112117:49:33

'Fri Nov 22 1996 17:49:33' '' 1 17 49 33 => 1996112217:49:33

'Fri Nov 22 1996 17:00:33' '' 0 17 '' 33 => 1996112117:00:33

'Fri Nov 22 1996 17:00:33' '' 1 17 '' 33 => 1996112217:00:33



'Fri Nov 22 1996 17:49:30' '' 0 '' 30 => 1996112217:30:00

'Fri Nov 22 1996 17:49:30' '' 0 '' 30 45 => 1996112217:30:45

'Fri Nov 22 1996 17:49:30' '' 0 '' '' 30 => 1996112217:48:30



'Fri Nov 22 1996 17:30:00' '' 0 '' 30 => 1996112216:30:00

'Fri Nov 22 1996 17:30:00' '' 1 '' 30 => 1996112217:30:00

'Fri Nov 22 1996 17:30:45' '' 0 '' 30 45 => 1996112216:30:45

'Fri Nov 22 1996 17:30:45' '' 1 '' 30 45 => 1996112217:30:45

'Fri Nov 22 1996 17:30:45' '' 0 '' '' 45 => 1996112217:29:45

'Fri Nov 22 1996 17:30:45' '' 1 '' '' 45 => 1996112217:30:45

";

$t->tests(func  => \&Date_GetPrev,
          tests => $tests);
$t->done_testing();

#Local Variables:
#mode: cperl
#indent-tabs-mode: nil
#cperl-indent-level: 3
#cperl-continued-statement-offset: 2
#cperl-continued-brace-offset: 0
#cperl-brace-offset: 0
#cperl-brace-imaginary-offset: 0
#cperl-label-offset: 0
#End:
