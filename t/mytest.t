package t::MyTest;

use strict;
use warnings;
use Sorter;

my $sorter = Sorter->new();
$sorter->set_values(1,2,3,4,2);
print $sorter->get_values();
1;
