# !perl -T

use Basket::Calc;
# use Test::More tests => 3;

my $result;

# new instance test
my $basket = Basket::Calc->new(debug => 1, currency => 'NZD', tax => .15);

# add items in base currency
$result = $basket->add_item({ price => 14.90 });
$result = $basket->add_item({ price => 14.90, quantity => 2 });

# add foreign currency items
$result = $basket->add_item({ price => 59, currency => 'EUR' });
$result = $basket->add_item({ price => 14.90, currency => 'USD', quantity => 2 });
$result = $basket->add_item({ price => 119.15, currency => 'JPY' });

# add %20 discount
$result = $basket->add_discount({ type => 'percent', value => .2 });

# calculate totals
$result = $basket->calculate;

# add fixed currency amount discount
$result = $basket->add_discount({ type => 'amount', value => 15, currency => 'HKD' });

# calculate totals again
$result = $basket->calculate;
