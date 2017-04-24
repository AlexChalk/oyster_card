# Oystercard

This project maps a simple travelcard scheme, such as the Oyster Card scheme in London. It is very basic code that took a day to complete.

## Dependencies

You'll need Ruby to explore this project—instructions for getting it are available on ruby-lang's [installation page](https://www.ruby-lang.org/en/documentation/installation/). If you are on macOS or Linux, I recommend using [RVM](https://rvm.io).

You will also need `bundler`—if you haven't installed it, run `gem install bundler`. Then navigate to the project root and run `bundle install`—this will install any missing project dependencies.

## Usage

Run this project in a REPL such as IRB (installed with Ruby), or Pry (`gem install pry`). Run `irb` or `pry` from the project root, followed by `require './lib/oyster_card.rb'`. Here is an example of the application in use:

```
[6] pry(main)> card.top_up(20)
=> 20
[7] pry(main)> card.touch_in
=> true
[8] pry(main)> card.in_journey?
=> true
[9] pry(main)> card.touch_in
RuntimeError: Error: Card already in journey
from /Users/adc/makers_projects/oyster_card/oyster_card_1/lib/oyster_card.rb:16:in `touch_in'
[10] pry(main)> card.touch_out
=> false
[11] pry(main)> card.balance
=> 18
```

You can do the following:
* create an Oyster Card; 
* check a card's balance and journey status; and
* "touch in" and "touch out" the card.

An error is raised if you touch in/out an already touched-in/out card, or if you don't have sufficient funds to make a journey.

## Running tests

To test, navigate to the project root and run `rspec`.

## Other notes

Part of week two at the [Makers Academy](http://www.makersacademy.com) Bootcamp.