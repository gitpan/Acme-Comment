BEGIN { unshift @INC, '/home/chris/dev/perlmods/git/kane/Acme-Comment/lib'; }

use strict;
use Test::More q[no_plan];

use Acme::Comment 1.01 type => "BETA", one_line => 0, own_line => 1;


### Test 7 ###
my $seven = 7;

(*
    $seven = 8;
*)

### Check Test 7 ###
is($seven, 7, "BETA => own_line: 1, one_line: 0: Standard Multiline");



### Test 8 ###
my $eight = 8;

(*
    $eight = 9;
    (*
        $eight = 10;
    *)
    $eight = 11;
*)

### Check Test 8 ###
is($eight, 8, "BETA => own_line: 1, one_line: 0: Nested Multiline");

### Test 9 ###
eval {
    (*
        this should break
    *)
    1;
};

### Check 9 ###
ok(!$@, "BETA => own_line: 1, one_line: 0: Broken Syntax Ignored Multiline");

