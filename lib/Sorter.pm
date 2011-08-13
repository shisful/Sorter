package Sorter;
use warnings;
use strict;

sub new{
	my $pkg = shift;
	my $hash = {
		input_list => [],
		sorted_list => []
	};
	bless $hash,$pkg;
}

sub set_values{
	my ($class, @args) = @_;
	$class->{input_list} = \@args;
	return 1;
}

sub sort{
	my ($class, @args) = @_;
	@{$class->{sorted_list}} = quick_sort(@{$class -> {input_list}});
}

sub get_values{
	my ($class,@args) = @_;
	return "(".join(",",@{$class -> {sorted_list}}).")";
}

sub quick_sort{

	my @list = @_;
	my $length = @list;
	my $start = 0;
	refroop($start,$length-1);

	return @list;

	sub refroop{#再帰用
		my ($i,$j) = @_;
		my $right = $j;
		my $left = $i;
		my $pivot = search_pivot($i,$j);
		if(defined($pivot)){
			while( $left <= $right ){
				while(!($list[$left] >= $pivot) && $left<=$j){
					$left++;
				}
				while(!($list[$right] < $pivot) && $right >= $i){
					$right--;
				}
				if( $left <= $right ){
					my $var = $list[$left];
					$list[$left] = $list[$right];
					$list[$right] = $var;
					$left++;
					$right--;
				}
			}
			refroop($i,$left-1);
			refroop($left,$j);
		}
	}
		sub search_pivot{#input:配列 output:ピボット
			my ($i,$j) = @_;
			my $pivot = $list[$i];
			if($j -$i == 1){
				if($list[$i]>$list[$j]){
					my $var = $list[$i];
					$list[$i] = $list[$j];
					$list[$j] = $var;
				}
			}else{
				for(my $var = $i;$var<=$j;$var++){
					if($pivot < $list[$var]){
						return $list[$var];
					} elsif ($pivot > $list[$var]) {
						return $pivot;
					}
				}
			}
		return undef;
		}

}
1;