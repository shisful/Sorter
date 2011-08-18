package Sorter;
use warnings;
use strict;

sub new{
	my $pkg = shift;
	my $hash = {
		input_list => []
	};
	bless $hash,$pkg;
}

sub set_values{
	my ($class, @args) = @_;
	$class->{input_list} = \@args;
	return 1;
}

sub get_values{
	my $class = shift;
	return @{$class->{input_list}};
}

sub sort{
	my $class = shift;
	@{$class->{input_list}} = quick_sort($class -> {input_list});
	return 1;
}


sub quick_sort{
    my ($list) = @_;

    my $length = @{$list};
    my $start = 0;
    refroop($start,$length-1,$list);
    return @$list;
}

sub refroop{#再帰用
    my ($i,$j,$list) = @_;
    my $right = $j;
    my $left = $i;
    my $pivot = search_pivot($i,$j,$list);
    if(defined($pivot)){
        while( $left <= $right ){
            while(!($list->[$left] >= $pivot) && $left<=$j){
                $left++;
            }
            while(!($list->[$right] < $pivot) && $right >= $i){
                $right--;
            }
            if( $left <= $right ){
                my $var = $list->[$left];
                $list->[$left] = $list->[$right];
                $list->[$right] = $var;
                $left++;
                $right--;
            }
        }
        refroop($i,$left-1,$list);
        refroop($left,$j,$list);
    }
}

sub search_pivot{#input:配列 output:ピボット
    my ($i,$j,$list) = @_;
    my $pivot = $list->[$i];
    if($j -$i == 1){
        if($list->[$i] > $list->[$j]){
            my $var = $list->[$i];
            $list->[$i] = $list->[$j];
            $list->[$j] = $var;
        }
    }else{
        for(my $var = $i;$var <= $j;$var++){
            if($pivot < $list->[$var]){
                return $list->[$var];
            } elsif ($pivot > $list->[$var]) {
                return $pivot;
            }
        }
    }
    return undef;
}

1;
