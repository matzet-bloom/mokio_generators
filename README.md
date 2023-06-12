# MokioGenerators

Simple Resource Generator for Mokio CMS

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mokio_generators'
```

And then execute:

    $ bundle

## Usage
```ruby
rails g mokio:resources:add Model column:type
```

The generator creates the following resources for Mokio::Cms for the given model and list of columns:

- Model
- Migrations
- Translations
- Form
- Controller and Params