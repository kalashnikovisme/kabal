# Kabal

[![Build Status](https://travis-ci.org/kalashnikovisme/kabal.svg?branch=master)](https://travis-ci.org/kalashnikovisme/kabal)
[![Coverage Status](https://coveralls.io/repos/kalashnikovisme/kabal/badge.png?branch=master)](https://coveralls.io/r/kalashnikovisme/kabal?branch=master)
[![Inline docs](http://inch-ci.org/github/kalashnikovisme/kabal.png)](http://inch-ci.org/github/kalashnikovisme/kabal)
[![Gem Version](https://badge.fury.io/rb/kabal.svg)](http://badge.fury.io/rb/kabal)
[![endorse](https://api.coderwall.com/kalashnikovisme/endorsecount.png)](https://coderwall.com/kalashnikovisme)
[![Dependency Status](https://gemnasium.com/kalashnikovisme/kabal.svg)](https://gemnasium.com/kalashnikovisme/kabal)
[![Still MainTained](http://stillmaintained.com/kalashnikovisme/kabal.png)](http://stillmaintained.com/kalashnikovisme/kabal)
[![Code Climate](https://codeclimate.com/github/kalashnikovisme/kabal/badges/gpa.svg)](https://codeclimate.com/github/kalashnikovisme/kabal)


Kabal allows you to translate number into text. See Demo on [http://kabal.herokuapp.com](http://kabal.herokuapp.com)

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
    $> Kabal.to_text_in_russian 1 #=> "один"
    $> Kabal.to_text_in_english 1 #=> "one"
    $> Kabal.to_text -1000000 #=> "минус один миллион"

You can choose language to "converting".

    $> Kabal.language = "Russian"
    $> Kabal.current_language #=> "Russian"

Supported Languages:

* Russian
    * Natural Numbers { max: 10 ** 100 }
    * Fractional Numbers
    * Negative Numbers
* English
    * Natural Numbers { max 10 ** 63 }
    * Fractional Numbers
    * Negative Numbers
* Deutsch
    * Natural Number { max 10 ** 24 }
    * Fractional Numbers
    * Negative Numbers

Interfaces:

    $> Kabal.supported_languages #=> ["Russian", "English", "Deutsch"]
    $> Kabal.to_text "1" #=> "один"
    $> Kabal.to_text_in_language(1, "English") #=> "one"
    $> Kabal.to_text_in_language(1, :English) #=> "one"
    $> Kabal.to_text_in_language("1", "English") #=> "one"
    $> Kabal.to_text_in_language("1", :English) #=> "one"
    $> Kabal.to_text_in_language(1, "en") #=> "one"
    $> Kabal.to_text_in_language(1, :en) #=> "one"
    $> Kabal.to_text_in_language("1", "en") #=> "one"
    $> Kabal.to_text_in_language("1", :en) #=> "one"
    $> Kabal.to_text_in_language_by_index(1, 0) #=> "один"
    $> Kabal.to_text_in_language_by_index("1", 0) #=> "один"
    $> Kabal.current_language_supports_natural? #=> true
    $> Kabal.current_language_supports_fractional? #=> true
    $> Kabal.language_supports_negative? #=> true
    $> Kabal.language_supports_fractional? #= true
    $> Kabal.maximum_for "Russian" #=> 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    $> Kabal.minimum_for "English" #=> -999999999999999999999999999999999999999999999999999999999999999999

## Contributing

1. Fork it ( https://github.com/kalashnikovisme/kabal/fork )
2. Create your feature branch (`git flow feature start new_super_feature`)
3. Commit your changes (`git commit`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## How add languages

To add Elfin language you should use language generator:

    $> cd generators
    $> thor add_language elfin el

It will:

1. Create `lib/kabal/languages/elfin.rb`. You'll describe rules of this language to drawing numbers there.

    ```ruby
    require 'kabal/languages/language'

    class Kabal::Elfin < Kabal::Language
        def convert(number)
            #anything you want
        end
    end
    ```
2. Create `test/lib/kabal/languages/elfin_test.rb`. You'll cover your code by tests there.
3. Create `yaml/languages/el.yml`. You'll add numbers and words, which they correspond, there.

    ```yaml
    el:
      minus: #Minus on Elfin Language#
    ```
4. Add `Elfin: "el"` to `yaml/languages.yml`.
5. Add to `yaml/support.yml`

    ```yaml
    el:
      natural:
        min: {min_of_your_realization}
        max: {max_of_your_realization}
      fractional:
        symbols: {count_of_symbols_after_dot_that_you_realized}
    ```
6. Add `require "kabal/languages/elfin"` to `lib/kabal/supported_languages.rb`.

HINT: Method `Kabal.to_text_in_elfin` will create automatically.

If you want remove language:

    $> cd generators
    $> thor remove_language elfin

## Testing

Kabal has the BigTest. This test checks the correctness of the operation with all the numbers (0 to 10,000) in all supported languages.
Be careful: BigTest now working around 8 minutes.
Run BigTest

    $> tconsole bigtest

Relax!

    $> tconsole all

runs all tests without Bigtest.
