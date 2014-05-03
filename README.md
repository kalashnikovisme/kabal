# Kabal

[![Build Status](https://travis-ci.org/kalashnikovisme/kabal.svg?branch=master)](https://travis-ci.org/kalashnikovisme/kabal)
[![Coverage Status](https://coveralls.io/repos/kalashnikovisme/kabal/badge.png?branch=master)](https://coveralls.io/r/kalashnikovisme/kabal?branch=master)
[![Gem Version](https://badge.fury.io/rb/kabal.svg)](http://badge.fury.io/rb/kabal)
[![endorse](https://api.coderwall.com/kalashnikovisme/endorsecount.png)](https://coderwall.com/kalashnikovisme)
[![Dependency Status](https://gemnasium.com/kalashnikovisme/kabal.svg)](https://gemnasium.com/kalashnikovisme/kabal)
[![Still MainTained](http://stillmaintained.com/kalashnikovisme/kabal.png)](http://stillmaintained.com/kalashnikovisme/kabal)


Kabal allows you to translate number into text.

## Installation

Add this line to your application's Gemfile:

    gem 'kabal'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kabal

## Usage

Kabal has one main feature - number to text "converting".

    $> require 'kabal'
    $> include Kabal
    $> Kabal.to_text 1 #=> "один"
    $> Kabal.to_text -1000000 #=> "минус один миллион"

You can choose language to "converting".

    $> Kabal.language = "Russian"
    $> Kabal.current_language #=> "Russian"

Supported Languages:

* Russian

*More languages will be added later.*

You can see actual list of supported languages:

    $> Kabal.supported_languages #=> ["Russian"]

## Contributing

1. Fork it ( https://github.com/kalashnikovisme/kabal/fork )
2. Create your feature branch (`git flow feature start new_super_feature`)
3. Commit your changes (`git commit`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## How add languages

To add Elfin language you should:

1. Create `lib/kabal/languages/elfin.rb`. You'll describe rules of this language to drawing numbers there.
2. Create `test/lib/kabal/languages/elfin_test.rb`. You'll cover your code by tests there.
3. Create `yaml/languages/el.yml`. You'll add numbers and words, which they correspond, there.
4. Add `Elfin: "el"` to `yaml/languages.yml`.
5. Add `require "kabal/languages/elfin"` to `lib/kabal/supported_languages.rb`.

## Testing

Kabal has the BigTest. This test checks the correctness of the operation with all the numbers (0 to 10,000) in all supported languages.
Be careful: BigTest working with 10 001 numbers on one languages during around 3 minutes.
