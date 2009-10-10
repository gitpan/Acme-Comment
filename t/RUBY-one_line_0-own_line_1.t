BEGIN { unshift @INC, '/home/chris/dev/perlmods/git/kane/Acme-Comment/lib'; }

use strict;
use Test::More q[no_plan];

use Acme::Comment 1.01 type => "RUBY", one_line => 0, own_line => 1;


### Test 7 ###
my $seven = 7;

=begin
    $seven = 8;
=end

### Check Test 7 ###
is($seven, 7, "RUBY => own_line: 1, one_line: 0: Standard Multiline");



### Test 8 ###
my $eight = 8;

=begin
    $eight = 9;
    =begin
        $eight = 10;
    =end
    $eight = 11;
=end

### Check Test 8 ###
is($eight, 8, "RUBY => own_line: 1, one_line: 0: Nested Multiline");

### Test 9 ###
eval {
    =begin
        this should break
    =end
    1;
};

### Check 9 ###
ok(!$@, "RUBY => own_line: 1, one_line: 0: Broken Syntax Ignored Multiline");


my $ten = 10;
# $ten = 11;

is($ten, 10, "RUBY => own_line: 1, one_line: 0: Standard Single Line");

