# CarveRange

Given two date ranges (A and B), return an array of date ranges such that each new date range does not overlap with the date range B (but include date range B)

## Example 1

Date Range A: #########
Date Range B:   #####
Carve(A,B):			 [##, ##, ####]

## Example 1 Why?

Date Range A:   #########
Date Range B:     #####
Date Range A':  ##
Date Range A'':        ##
A' + A'' + B: [##, ##, ####]

## Example 2

Date Range A: #####
Date Range B:   #####
Carve(A,B):			 [##,#####]

## Example 3

Date Range A:   #####
Date Range B:   ###
Carve(A,B):			 [##,###]

## Example 4

Date Range A:  #####
Date Range B: #######
Carve(A,B):	 [#######]

## Use Case

Your tracking your activity in a calendar for a month. For days 1-30, you Went Jogging, so you create an Event that Starts At Day 1 and End At day 2. Oops! You double-check your journal and realize that Day 15-18 you said you went Jogging, but actually you Stayed Home.

You can "carve" the 1 Event (that contains a Start Date and and End Date) with this gem such that you could get 3 Events. The first event is Days 1-14 (you Went Jogging those days). The second event is Days 15-18 (you Stayed Home those days). The third event is Days 19-30 (you Went Jogging those days).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carve_range'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carve_range

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/possibly/carve_range.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
